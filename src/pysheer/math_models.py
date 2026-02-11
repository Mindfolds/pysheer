"""Modelos matemáticos utilitários para o PySheer.

Este módulo implementa o indicador ADR(50) (Average Daily Range com janela 50),
com foco explícito em:
- estabilidade numérica;
- domínio válido dos dados (high >= low);
- convergência assintótica da média móvel exponencial.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Sequence


def _validate_ranges(highs: Sequence[float], lows: Sequence[float]) -> None:
    if len(highs) != len(lows):
        raise ValueError("highs e lows devem ter o mesmo tamanho")
    if len(highs) == 0:
        raise ValueError("a série não pode ser vazia")

    for idx, (h, l) in enumerate(zip(highs, lows)):
        if h < l:
            raise ValueError(
                f"domínio inválido no índice {idx}: high={h} < low={l}"
            )


@dataclass(frozen=True)
class ADR50Model:
    """Modelo para cálculo do ADR com período 50.

    Definição:
        range_t = high_t - low_t
        adr_t = alpha * range_t + (1 - alpha) * adr_{t-1}

    onde alpha = 2/(N+1), com N=50.

    Propriedades:
    - 0 < alpha < 1  -> filtro estável (BIBO para entrada limitada);
    - pesos somam 1  -> combinação convexa, sem explosão;
    - para range_t constante, adr_t converge monotonicamente ao valor constante.
    """

    period: int = 50

    @property
    def alpha(self) -> float:
        return 2.0 / (self.period + 1)

    def compute(self, highs: Sequence[float], lows: Sequence[float]) -> list[float]:
        _validate_ranges(highs, lows)

        ranges = [h - l for h, l in zip(highs, lows)]
        adr_series: list[float] = [ranges[0]]
        a = self.alpha

        for r in ranges[1:]:
            adr_series.append(a * r + (1.0 - a) * adr_series[-1])

        return adr_series


def adr50(highs: Sequence[float], lows: Sequence[float]) -> float:
    """Retorna o último valor ADR(50) da série."""
    model = ADR50Model(period=50)
    return model.compute(highs, lows)[-1]
