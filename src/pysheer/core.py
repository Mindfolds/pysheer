"""Núcleo simplificado de análise para o pacote pysheer."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path


@dataclass
class AnalysisResult:
    directories: int
    files: int
    python_files: int
    violations: int = 0
    violations_list: list[str] | None = None


class PySheerAnalyzer:
    def __init__(self, root: str) -> None:
        self.root = Path(root)

    def analyze(self, quick: bool = False) -> AnalysisResult:
        paths = list(self.root.rglob("*"))
        directories = sum(1 for p in paths if p.is_dir())
        files = sum(1 for p in paths if p.is_file())
        python_files = sum(1 for p in paths if p.is_file() and p.suffix == ".py")

        violations: list[str] = []
        if not quick and python_files == 0:
            violations.append("Nenhum arquivo Python encontrado")

        return AnalysisResult(
            directories=directories,
            files=files,
            python_files=python_files,
            violations=len(violations),
            violations_list=violations,
        )
