#!/usr/bin/env python3
"""Exemplo básico do PySheer."""

from pysheer import ADR50Model, PySheerAnalyzer

analyzer = PySheerAnalyzer(".")
result = analyzer.analyze()

print("📊 Análise completa!")
print(f"Diretórios: {result.directories}")
print(f"Arquivos: {result.files}")
print(f"Python: {result.python_files}")

model = ADR50Model()
adr = model.compute([12.0, 14.0, 13.0], [10.0, 11.0, 10.5])[-1]
print(f"ADR(50) final: {adr:.4f}")
