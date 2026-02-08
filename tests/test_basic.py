#!/usr/bin/env python3
"""
Testes básicos
"""

import sys
sys.path.insert(0, "src")

from pysheer.core import PySheerAnalyzer
import tempfile
import os

def test_basic_analysis():
"""Testa análise básica"""
with tempfile.TemporaryDirectory() as tmpdir:
# Cria estrutura de teste
test_file = os.path.join(tmpdir, "test.py")
with open(test_file, "w") as f:
f.write("print('test')")

text
    analyzer = PySheerAnalyzer(tmpdir)
    result = analyzer.analyze(quick=True)
    
    assert result.files >= 1
    assert result.python_files >= 1
    print("✅ Teste básico passou!")
if name == "main":
test_basic_analysis()
print("🎉 Todos os testes passaram!")
