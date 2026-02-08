#!/usr/bin/env python3
"""
Exemplo básico do PySheer
"""

import sys
sys.path.insert(0, "src")

from pysheer import PySheerAnalyzer

Analisa diretório atual
analyzer = PySheerAnalyzer(".")
result = analyzer.analyze()

print("📊 Análise completa!")
print(f"Diretórios: {result.directories}")
print(f"Arquivos: {result.files}")
print(f"Python: {result.python_files}")

if result.violations > 0:
print(f"⚠️ Violações encontradas: {result.violations}")
for v in result.violations_list:
print(f" • {v}")
else:
print("✅ Nenhuma violação encontrada!")

