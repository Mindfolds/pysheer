# create-pysheer-complete.ps1
# Script PowerShell COMPLETO para criar o sistema PySheer do zero

param(
    [string]$ProjectName = "pysheer",
    [switch]$Force = $false,
    [switch]$SkipInstall = $false,
    [switch]$TestOnly = $false
)

# ============================================================================
# CONFIGURAÇÃO
# ============================================================================

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

# Cores
function Write-Success { Write-Host "✅ $args" -ForegroundColor Green }
function Write-Info { Write-Host "📝 $args" -ForegroundColor Cyan }
function Write-Warning { Write-Host "⚠️  $args" -ForegroundColor Yellow }
function Write-Error { Write-Host "❌ $args" -ForegroundColor Red }
function Write-Title { 
    Write-Host "`n" + "═" * 60 -ForegroundColor Magenta
    Write-Host "🚀 $args" -ForegroundColor White -BackgroundColor DarkMagenta
    Write-Host "═" * 60 -ForegroundColor Magenta
    Write-Host ""
}

# ============================================================================
# FUNÇÕES UTILITÁRIAS
# ============================================================================

function Test-Command($cmd) {
    try { Get-Command $cmd -ErrorAction Stop | Out-Null; return $true }
    catch { return $false }
}

function Ensure-Dir($path) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

function Write-File($path, $content) {
    Ensure-Dir (Split-Path $path -Parent)
    [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
    Write-Info "Criado: $path"
}

function Run-Python($script, $args = "") {
    $python = if (Test-Command "python") { "python" } else { "py" }
    $cmd = "$python $script $args"
    Write-Info "Executando: $cmd"
    Invoke-Expression $cmd
}

# ============================================================================
# VALIDAÇÃO
# ============================================================================

Write-Title "CRIADOR COMPLETO DO PYSHEER"

# Verifica Python
if (-not (Test-Command "python") -and -not (Test-Command "py")) {
    Write-Error "Python não encontrado!"
    Write-Info "Instale Python: https://www.python.org/downloads/"
    exit 1
}

# Verifica diretório
if (Test-Path $ProjectName -and -not $Force) {
    Write-Error "Diretório '$ProjectName' já existe!"
    Write-Info "Use: .\create-pysheer-complete.ps1 -Force"
    exit 1
}

if ($Force -and (Test-Path $ProjectName)) {
    Write-Warning "Removendo diretório existente..."
    Remove-Item $ProjectName -Recurse -Force
}

# ============================================================================
# CRIA ESTRUTURA
# ============================================================================

Write-Title "CRIANDO ESTRUTURA DO PROJETO"

Ensure-Dir $ProjectName
Set-Location $ProjectName

Write-Success "Projeto criado em: $(Get-Location)"

# ============================================================================
# 1. ARQUIVOS DE CONFIGURAÇÃO
# ============================================================================

Write-Info "Criando arquivos de configuração..."

# pyproject.toml
@"
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "pysheer"
version = "1.0.0"
description = "PySheer - Sistema de Análise Arquitetural"
readme = "README.md"
requires-python = ">=3.8"
license = {text = "MIT"}
authors = [{name = "PyFolds Team", email = "team@pyfolds.org"}]

classifiers = [
    "Development Status :: 4 - Beta",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: MIT License",
    "Programming Language :: Python :: 3.8+",
    "Topic :: Software Development :: Quality Assurance",
]

dependencies = [
    "click>=8.0.0",
    "rich>=13.0.0",
]

[project.scripts]
pysheer = "pysheer.cli:main"

[project.urls]
Homepage = "https://github.com/pyfolds/pysheer"
"@ | Out-File "pyproject.toml" -Encoding UTF8
Write-Success "pyproject.toml criado"

# requirements.txt
@"
click>=8.0.0
rich>=13.0.0
"@ | Out-File "requirements.txt" -Encoding UTF8
Write-Success "requirements.txt criado"

# ============================================================================
# 2. ESTRUTURA DE DIRETÓRIOS
# ============================================================================

Write-Info "Criando estrutura de diretórios..."

$dirs = @(
    "src/pysheer",
    "src/pysheer/rules",
    "examples",
    "tests",
    "docs"
)

foreach ($dir in $dirs) {
    Ensure-Dir $dir
    Write-Info "  Criado: $dir"
}

# ============================================================================
# 3. CÓDIGO FONTE DO PYSHEER
# ============================================================================

Write-Title "CRIANDO CÓDIGO FONTE"

# __init__.py
@"
"""
PySheer - Sistema de Análise Arquitetural
"""

__version__ = "1.0.0"
__author__ = "PyFolds Team"
"@ | Out-File "src/pysheer/__init__.py" -Encoding UTF8

# cli.py - Interface principal
@"
#!/usr/bin/env python3
"""
PySheer CLI - Interface de linha de comando
"""

import click
import os
from pathlib import Path

@click.group()
@click.version_option()
def cli():
    """PySheer - Sistema de Análise Arquitetural"""
    pass

@cli.command()
@click.option("--src", default=".", help="Diretório para análise")
@click.option("--quick", is_flag=True, help="Modo rápido")
def analyze(src, quick):
    """Analisa estrutura do projeto"""
    click.echo("🔍 Analisando: " + src)
    
    from pysheer.core import PySheerAnalyzer
    analyzer = PySheerAnalyzer(src)
    result = analyzer.analyze(quick=quick)
    
    click.echo(f"📊 Resultados:")
    click.echo(f"  Diretórios: {result.directories}")
    click.echo(f"  Arquivos: {result.files}")
    click.echo(f"  Python: {result.python_files}")
    
    if result.violations > 0:
        click.echo(f"⚠️  Violações: {result.violations}")
        for v in result.violations_list[:3]:
            click.echo(f"    • {v}")

@cli.command()
@click.option("--src", default=".", help="Diretório para blueprint")
def blueprint(src):
    """Gera blueprint arquitetural"""
    click.echo("📋 Gerando blueprint para: " + src)
    
    from pysheer.blueprint import generate_blueprint
    output = generate_blueprint(src)
    click.echo(f"✅ Blueprint salvo: {output}")

@cli.command()
def init():
    """Inicializa configuração do PySheer"""
    from pysheer.config import save_config, default_config
    save_config(default_config(), "pysheer.toml")
    click.echo("✅ Configuração criada: pysheer.toml")

@cli.command()
@click.option("--src", default="src/pyfolds", help="Diretório do PyFolds")
def pyfolds(src):
    """Análise específica para PyFolds"""
    click.echo(f"🐍 Analisando PyFolds: {src}")
    
    if not os.path.exists(src):
        click.echo("❌ Diretório não encontrado!")
        return
    
    from pysheer.core import PySheerAnalyzer
    analyzer = PySheerAnalyzer(src)
    result = analyzer.analyze()
    
    click.echo(f"📦 Módulos encontrados: {result.python_files}")

def main():
    cli()

if __name__ == "__main__":
    main()
"@ | Out-File "src/pysheer/cli.py" -Encoding UTF8
Write-Success "cli.py criado"

# core.py - Núcleo do sistema
@"
#!/usr/bin/env python3
"""
PySheer Core - Núcleo do sistema
"""

import os
from pathlib import Path
from dataclasses import dataclass, field
from typing import List
import json

@dataclass
class AnalysisResult:
    directories: int = 0
    files: int = 0
    python_files: int = 0
    violations: int = 0
    violations_list: List[str] = field(default_factory=list)

class PySheerAnalyzer:
    def __init__(self, src_path="."):
        self.src_path = Path(src_path)
    
    def analyze(self, quick=False):
        result = AnalysisResult()
        
        for root, dirs, files in os.walk(self.src_path):
            result.directories += 1
            result.files += len(files)
            
            # Conta Python
            py_files = [f for f in files if f.endswith('.py')]
            result.python_files += len(py_files)
            
            # Verifica violações simples
            if not quick:
                for f in py_files:
                    if f == "__init__.py":
                        continue
                    filepath = Path(root) / f
                    size = filepath.stat().st_size
                    if size > 100 * 1024:  # 100KB
                        result.violations += 1
                        result.violations_list.append(
                            f"Arquivo grande: {filepath.relative_to(self.src_path)}"
                        )
        
        return result
"@ | Out-File "src/pysheer/core.py" -Encoding UTF8
Write-Success "core.py criado"

# blueprint.py
@"
#!/usr/bin/env python3
"""
PySheer Blueprint - Geração de blueprint
"""

from pathlib import Path
from datetime import datetime

def generate_blueprint(src_path=".", output_path="blueprint.md"):
    src = Path(src_path)
    output = Path(output_path)
    
    output.parent.mkdir(parents=True, exist_ok=True)
    
    # Coleta dados simples
    dirs = []
    files = []
    py_files = []
    
    for item in src.rglob("*"):
        if item.is_dir():
            dirs.append(str(item.relative_to(src)))
        elif item.is_file():
            files.append(item.name)
            if item.suffix == ".py":
                py_files.append(item.name)
    
    # Gera markdown
    content = f'''# 📋 Blueprint Arquitetural

**Projeto:** {src.name}
**Data:** {datetime.now().isoformat()}
**Diretório:** {src}

## 📊 Estatísticas

- **Diretórios:** {len(dirs)}
- **Arquivos:** {len(files)}
- **Python:** {len(py_files)}

## 📁 Estrutura
