# Issue técnico: implementação robusta do ADR(50)

## Problema
O repositório não possuía implementação funcional de pacote (`src/pysheer`) e os testes/exemplos estavam sintaticamente inválidos.

## Correção objetiva aplicada
1. Implementação explícita do modelo ADR(50) com:
   - validação de domínio `high >= low`;
   - parâmetro de suavização `alpha = 2/(N+1)` com `N=50`;
   - recorrência EMA estável por construção.
2. Criação de testes para convergência em regime constante e para validação de domínio.

## Justificativa matemática
- Como `N=50`, temos `alpha = 2/51`, logo `0 < alpha < 1`.
- A dinâmica `adr_t = alpha*r_t + (1-alpha)*adr_{t-1}` é combinação convexa e
  define sistema linear estável para entrada limitada.
- Se `r_t = c` constante, o erro `e_t = adr_t - c` satisfaz
  `e_t = (1-alpha)*e_{t-1}` e converge para zero geometricamente.

## Referências
- Brown, R. G. (1959). *Statistical Forecasting for Inventory Control*.
- Hyndman, R. J., & Athanasopoulos, G. (2021). *Forecasting: Principles and Practice* (EMA smoothing).
