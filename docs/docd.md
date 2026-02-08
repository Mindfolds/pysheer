 DOCUMENTAÇÃO COMPLETA DO PYSHEER
🚀 ÍNDICE
📋 COMANDOS PRINCIPAIS

⚙️ CONFIGURAÇÃO

📊 COMANDOS DE ANÁLISE

🐍 COMANDOS PARA PYPOLDS

🔧 COMANDOS DE DESENVOLVIMENTO

🎯 EXEMPLOS PRÁTICOS

🔄 FLUXOS DE TRABALHO

🚨 SOLUÇÃO DE PROBLEMAS

📋 COMANDOS PRINCIPAIS
COMANDOS BÁSICOS
bash
# Mostra versão
pysheer --version

# Mostra ajuda completa
pysheer --help

# Mostra ajuda de um comando específico
pysheer analyze --help
pysheer blueprint --help
pysheer pyfolds --help
INICIALIZAÇÃO
bash
# Cria configuração padrão
pysheer init

# Cria configuração com nome específico
pysheer init --output minha-config.toml

# Cria configuração avançada
pysheer init --advanced
⚙️ CONFIGURAÇÃO
ARQUIVO DE CONFIGURAÇÃO (pysheer.toml)
toml
# Exemplo completo de configuração
[project]
name = "PyFolds"
version = "1.0.0"
description = "Framework de redes neurais"
author = "PyFolds Team"

[analysis]
# Limites
max_depth = 8
max_file_size_kb = 100
max_files_per_dir = 50

# Verificações
check_file_sizes = true
check_imports = true
check_circular_deps = true
require_init_files = true
require_tests = false

# Ignorar
ignore_dirs = [
    ".git",
    "__pycache__", 
    ".venv",
    "venv",
    "build",
    "dist",
    "node_modules"
]

ignore_patterns = [
    "*.pyc",
    "*.pyo",
    "*.pyd",
    ".coverage",
    "*.egg-info"
]

[pyfolds]
# Módulos esperados no PyFolds
expected_modules = [
    "nn",
    "data", 
    "optim",
    "runtime",
    "tracing",
    "experiments"
]

# Regras específicas
check_layer_violations = true
allow_cross_layer_imports = false
max_circular_imports = 3

[reporting]
# Saída
output_dir = "reports"
formats = ["html", "json", "md"]
open_browser = true
theme = "dark"

# Personalização
company_logo = "logo.png"
custom_css = "style.css"
COMANDOS DE CONFIGURAÇÃO
bash
# Valida configuração atual
pysheer config validate

# Valida arquivo específico
pysheer config validate --file custom-config.toml

# Mostra configuração atual
pysheer config show

# Cria configuração de exemplo
pysheer config example --output exemplo.toml

# Mescla configurações
pysheer config merge base.toml override.toml --output final.toml

# Converte formatos
pysheer config convert config.json --to toml
pysheer config convert config.toml --to json
pysheer config convert config.yaml --to toml
VARIÁVEIS DE AMBIENTE
bash
# No PowerShell
$env:PYSHEER_CONFIG = "config/production.toml"
$env:PYSHEER_OUTPUT_DIR = "audits"
$env:PYSHEER_VERBOSE = "true"

# No Linux/Mac
export PYSHEER_CONFIG="config/production.toml"
export PYSHEER_OUTPUT_DIR="audits"
export PYSHEER_VERBOSE="true"
📊 COMANDOS DE ANÁLISE
ANÁLISE BÁSICA
bash
# Análise simples do diretório atual
pysheer analyze

# Análise de diretório específico
pysheer analyze --src .
pysheer analyze --src src
pysheer analyze --src /caminho/completo/projeto

# Análise com opções
pysheer analyze --src src --output relatorios --verbose
pysheer analyze --src src --config minha-config.toml
pysheer analyze --src src --max-depth 5

# Análise rápida (ignora verificações pesadas)
pysheer analyze --quick
pysheer analyze --fast
ANÁLISE DETALHADA
bash
# Modo detalhado (mais informações)
pysheer analyze --verbose

# Modo muito detalhado (debug)
pysheer analyze --debug

# Modo silencioso (apenas erros)
pysheer analyze --quiet

# Apenas valida (não gera relatórios)
pysheer analyze --validate-only

# Simula (não escreve arquivos)
pysheer analyze --dry-run

# Limita profundidade
pysheer analyze --max-depth 4

# Ignora diretórios específicos
pysheer analyze --ignore-dirs "tests,__pycache__"
pysheer analyze --ignore-patterns "*.pyc,*.tmp"

# Limita por tamanho de arquivo
pysheer analyze --max-file-size 512  # em KB
FORMATOS DE SAÍDA
bash
# HTML (dashboard visual)
pysheer analyze --format html
pysheer analyze --format html --open  # abre no navegador
pysheer analyze --format html --theme dark
pysheer analyze --format html --theme light

# JSON (para automação)
pysheer analyze --format json
pysheer analyze --format json --compact
pysheer analyze --format json --output analysis.json

# Markdown (documentação)
pysheer analyze --format md
pysheer analyze --format markdown
pysheer analyze --format md --output README_ANALYSIS.md

# Todos os formatos
pysheer analyze --format all
pysheer analyze --format html,json,md

# CSV (para planilhas)
pysheer analyze --format csv
pysheer analyze --format csv --output data.csv

# XML (para integração)
pysheer analyze --format xml
FILTROS E OPÇÕES
bash
# Apenas arquivos Python
pysheer analyze --only-python

# Ignora testes
pysheer analyze --exclude-tests

# Ignora diretórios ocultos
pysheer analyze --exclude-hidden

# Filtra por extensão
pysheer analyze --extensions ".py,.md,.txt"
pysheer analyze --include-extensions ".py"
pysheer analyze --exclude-extensions ".pyc,.tmp"

# Limita número de resultados
pysheer analyze --limit 50
pysheer analyze --limit-files 100
pysheer analyze --limit-dirs 20

# Ordenação
pysheer analyze --sort name
pysheer analyze --sort size
pysheer analyze --sort date
pysheer analyze --sort-desc size
MÉTRICAS E ESTATÍSTICAS
bash
# Mostra apenas estatísticas
pysheer stats --src src
pysheer metrics --src src

# Estatísticas detalhadas
pysheer stats --detailed
pysheer metrics --verbose

# Exporta métricas
pysheer metrics --output metrics.json
pysheer stats --format csv --output stats.csv

# Compara métricas
pysheer metrics compare antes.json depois.json
🐍 COMANDOS PARA PYPOLDS
ANÁLISE ESPECÍFICA
bash
# Análise básica do PyFolds
pysheer pyfolds

# Especifica diretório
pysheer pyfolds --src src/pyfolds
pysheer pyfolds --src .
pysheer pyfolds --src /caminho/para/pyfolds

# Verifica módulos esperados
pysheer pyfolds --check-modules
pysheer pyfolds --verify-structure

# Verifica dependências entre camadas
pysheer pyfolds --check-dependencies
pysheer pyfolds --layer-analysis

# Análise profunda
pysheer pyfolds --deep
pysheer pyfolds --full-analysis
VERIFICAÇÃO DE MÓDULOS
bash
# Lista módulos encontrados
pysheer pyfolds modules list

# Verifica módulos obrigatórios
pysheer pyfolds modules check

# Detecta módulos faltantes
pysheer pyfolds modules missing

# Mostra hierarquia de módulos
pysheer pyfolds modules tree

# Análise de imports
pysheer pyfolds imports analyze
pysheer pyfolds imports graph
pysheer pyfolds imports circular
ARQUITETURA
bash
# Verifica violações arquiteturais
pysheer pyfolds architecture check

# Gera diagrama de camadas
pysheer pyfolds architecture layers

# Analisa acoplamento
pysheer pyfolds architecture coupling

# Analisa coesão
pysheer pyfolds architecture cohesion

# Pontuação arquitetural
pysheer pyfolds architecture score
DIAGRAMAS E VISUALIZAÇÕES
bash
# Diagrama de classes
pysheer pyfolds diagram classes
pysheer pyfolds diagram classes --output classes.puml
pysheer pyfolds diagram classes --format plantuml
pysheer pyfolds diagram classes --format mermaid

# Diagrama de componentes
pysheer pyfolds diagram components
pysheer pyfolds diagram components --output components.svg

# Diagrama de dependências
pysheer pyfolds diagram dependencies
pysheer pyfolds diagram dependencies --graphviz

# Diagrama de camadas
pysheer pyfolds diagram layers
pysheer pyfolds diagram layers --interactive
🔧 COMANDOS DE DESENVOLVIMENTO
BLUEPRINT ARQUITETURAL
bash
# Gera blueprint básico
pysheer blueprint

# Especifica diretório
pysheer blueprint --src src
pysheer blueprint --src src/pyfolds

# Opções de saída
pysheer blueprint --output arquitetura.md
pysheer blueprint --output docs/ARCHITECTURE.md
pysheer blueprint --format md
pysheer blueprint --format html
pysheer blueprint --format json

# Personalização
pysheer blueprint --template custom_template.md
pysheer blueprint --include-diagrams
pysheer blueprint --exclude-stats
AUDITORIA DE CÓDIGO
bash
# Auditoria básica
pysheer audit

# Modo estrito
pysheer audit --strict

# Modo relaxado
pysheer audit --relaxed

# Verifica segurança
pysheer audit --security

# Verifica performance
pysheer audit --performance

# Verifica boas práticas
pysheer audit --best-practices

# Filtros
pysheer audit --only-critical
pysheer audit --exclude-warnings
pysheer audit --min-severity high

# Exporta resultados
pysheer audit --output audit.json
pysheer audit --format sarif  # para GitHub
TESTES E VALIDAÇÃO
bash
# Valida estrutura
pysheer validate structure
pysheer validate imports
pysheer validate dependencies

# Testes unitários do PySheer
pysheer test
pysheer test --coverage
pysheer test --verbose

# Benchmark
pysheer benchmark
pysheer benchmark --iterations 10
UTILITÁRIOS
bash
# Limpa relatórios antigos
pysheer clean
pysheer clean --reports
pysheer clean --all

# Mostra informações do sistema
pysheer info
pysheer info --system
pysheer info --dependencies

# Gera documentação
pysheer docs generate
pysheer docs serve  # servidor local
pysheer docs build

# Atualiza PySheer
pysheer update
pysheer update --check
pysheer update --force
🎯 EXEMPLOS PRÁTICOS
EXEMPLO 1: ANÁLISE INICIAL
bash
# 1. Inicializa projeto
pysheer init

# 2. Analisa estrutura atual
pysheer analyze --src . --verbose

# 3. Gera blueprint
pysheer blueprint --src . --output ARCHITECTURE.md

# 4. Cria dashboard
pysheer analyze --format html --open
EXEMPLO 2: CI/CD PIPELINE
bash
# Para GitHub Actions/GitLab CI
pysheer analyze --src src --format json --quiet > analysis.json
pysheer audit --strict --format sarif > code-scanning.sarif

# Com validação
if pysheer analyze --src src --max-violations 0; then
    echo "✅ Estrutura aprovada"
else
    echo "❌ Violações encontradas"
    exit 1
fi
EXEMPLO 3: ANÁLISE DIÁRIA
powershell
# PowerShell - análise agendada
$date = Get-Date -Format "yyyy-MM-dd"
pysheer analyze --src . --format json --output "reports/analysis-$date.json"
pysheer pyfolds --src src/pyfolds --output "reports/pyfolds-$date.md"

# Envia notificação se houver violações
$result = Get-Content "reports/analysis-$date.json" | ConvertFrom-Json
if ($result.violations -gt 0) {
    Send-MailMessage -Subject "PySheer Alert: $($result.violations) violations" -Body "Review the report"
}
EXEMPLO 4: REFATORAÇÃO
bash
# Antes da refatoração
pysheer analyze --src src --format json > before.json
pysheer pyfolds --src src/pyfolds --output before-pyfolds.md

# Depois da refatoração
pysheer analyze --src src-refactored --format json > after.json
pysheer pyfolds --src src-refactored/pyfolds --output after-pyfolds.md

# Comparação
pysheer compare before.json after.json
pysheer diff before-pyfolds.md after-pyfolds.md
EXEMPLO 5: INTEGRAÇÃO COM FERRAMENTAS
bash
# Para VS Code
pysheer analyze --src . --format json | jq '.metrics'
pysheer audit --format json | ConvertTo-Json

# Para Jupyter Notebook
!pysheer analyze --src . --format json
import json
with open('analysis.json') as f:
    data = json.load(f)

# Para Makefile
audit:
    pysheer analyze --src src --format json > analysis.json
    @if [ $$(jq '.violations' analysis.json) -gt 0 ]; then \
        echo "Violations found"; exit 1; \
    fi
🔄 FLUXOS DE TRABALHO
FLUXO 1: NOVO PROJETO
bash
# 1. Inicialização
pysheer init
# Edita pysheer.toml conforme necessário

# 2. Primeira análise
pysheer analyze --src . --verbose --format all

# 3. Configura git hook
echo '#!/bin/sh
pysheer analyze --src . --quick
if [ $? -ne 0 ]; then
    echo "PySheer found violations!"
    exit 1
fi' > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# 4. Configura CI
# Adiciona ao .github/workflows/audit.yml
FLUXO 2: MANUTENÇÃO CONTÍNUA
bash
# Diariamente
pysheer analyze --src . --quick
pysheer audit --security

# Semanalmente
pysheer analyze --src . --full
pysheer pyfolds --deep

# Antes de releases
pysheer analyze --src . --strict
pysheer validate all
FLUXO 3: REVIEW DE CÓDIGO
bash
# Para pull requests
pysheer analyze --src . --output pr-analysis.md
pysheer audit --strict --output pr-audit.json

# Compara com main
git checkout main
pysheer analyze --src . --output main-analysis.json
git checkout feature-branch
pysheer analyze --src . --output feature-analysis.json
pysheer compare main-analysis.json feature-analysis.json
🚨 SOLUÇÃO DE PROBLEMAS
PROBLEMAS COMUNS
bash
# 1. "pysheer não é reconhecido"
python -m pysheer --help
# ou
py -m pysheer --help

# 2. Erro de importação
pip install -e .
pip install click rich

# 3. Configuração não encontrada
pysheer init
# ou especifique manualmente
pysheer analyze --config config/pysheer.toml

# 4. Permissões negadas
# Execute como administrador ou ajuste permissões

# 5. Python não encontrado
# Instale Python 3.8+ de python.org
COMANDOS DE DIAGNÓSTICO
bash
# Diagnóstico completo
pysheer doctor
pysheer diagnose

# Verifica instalação
pysheer check install
pysheer check dependencies

# Verifica configuração
pysheer check config
pysheer check permissions

# Logs detalhados
pysheer analyze --debug --log-file debug.log
pysheer --verbose --log-level DEBUG
MODOS ALTERNATIVOS
bash
# Modo offline (sem internet)
pysheer analyze --offline

# Modo seguro (sem escrita)
pysheer analyze --read-only

# Modo mínimo (poucos recursos)
pysheer analyze --minimal

# Modo batch (para muitos projetos)
pysheer batch analyze projects.txt
📦 COMANDOS AVANÇADOS
API PROGRAMÁTICA
python
# Exemplo de uso programático
from pysheer import PySheerAnalyzer, generate_blueprint, run_audit

# Análise
analyzer = PySheerAnalyzer("src/pyfolds", config="custom.toml")
result = analyzer.analyze(verbose=True, quick=False)
print(f"Violations: {result.violations}")

# Blueprint
blueprint_path = generate_blueprint(
    "src/pyfolds", 
    output="architecture.md",
    template="custom_template.md"
)

# Auditoria
audit_results = run_audit(
    "src/pyfolds",
    strict=True,
    checks=["security", "performance", "best-practices"]
)
EXTENSÕES E PLUGINS
bash
# Lista plugins disponíveis
pysheer plugins list

# Ativa plugin
pysheer plugins enable plugin-name

# Desativa plugin
pysheer plugins disable plugin-name

# Instala plugin
pysheer plugins install plugin-name

# Cria plugin
pysheer plugins create my-plugin
SCRIPTING
powershell
# PowerShell automation
$projects = @("project1", "project2", "project3")
foreach ($project in $projects) {
    Write-Host "Analyzing $project..." -ForegroundColor Cyan
    pysheer analyze --src $project --output "reports/$project.json" --quiet
    
    $result = Get-Content "reports/$project.json" | ConvertFrom-Json
    if ($result.violations -gt 0) {
        Write-Host "  ⚠️  $($result.violations) violations" -ForegroundColor Yellow
    } else {
        Write-Host "  ✅ No violations" -ForegroundColor Green
    }
}
🎮 CHEATSHEET RÁPIDO
COMANDOS MAIS USADOS
bash
# Top 10 comandos
1. pysheer analyze --src . --quick          # Análise rápida
2. pysheer init                            # Configuração
3. pysheer pyfolds --src src/pyfolds       # Análise PyFolds
4. pysheer blueprint --src src             # Blueprint
5. pysheer audit --strict                  # Auditoria
6. pysheer --help                          # Ajuda
7. pysheer --version                       # Versão
8. pysheer validate structure              # Validação
9. pysheer stats --src src                 # Estatísticas
10. pysheer clean                          # Limpeza
ALIAS ÚTEIS
bash
# Adicione ao seu .bashrc ou $PROFILE
alias pya='pysheer analyze --src . --quick'
alias pyf='pysheer pyfolds --src src/pyfolds'
alias pyb='pysheer blueprint --src .'
alias pys='pysheer stats --src .'
alias pyv='pysheer --version'
ATALHOS POWERSELL
powershell
# Adicione ao seu $PROFILE
function pya { pysheer analyze @args }
function pyf { pysheer pyfolds @args }
function pyb { pysheer blueprint @args }
function pys { pysheer stats @args }

# Funções úteis
function Get-PySheerReport {
    param($Path = ".")
    pysheer analyze --src $Path --format html --open
}

function Test-PyFoldsStructure {
    pysheer pyfolds --src src/pyfolds --check-modules
}
📞 SUPORTE E AJUDA
OBTER AJUDA
bash
# Ajuda geral
pysheer --help
pysheer help

# Ajuda específica
pysheer analyze --help
pysheer pyfolds --help
pysheer config --help

# Exemplos
pysheer examples
pysheer examples analyze
pysheer examples pyfolds

# Tutorial interativo
pysheer tutorial
pysheer tutorial quickstart
RECURSOS
Documentação: docs/ directory

Exemplos: examples/ directory

Issues: GitHub Issues

Comunidade: PyFolds Discord/Slack

Email: team@pyfolds.org

CONTRIBUIÇÃO
bash
# Desenvolvimento
git clone https://github.com/pyfolds/pysheer.git
cd pysheer
pip install -e .[dev]

# Testes
pytest tests/
pytest --cov=pysheer tests/

# Lint
black src/pysheer
isort src/pysheer
flake8 src/pysheer
🎉 PRÓXIMOS PASSOS
Comece com: pysheer init && pysheer analyze --src .

Explore: pysheer --help para ver todos os comandos

Personalize: Edite pysheer.toml para suas necessidades

Automatize: Adicione ao seu CI/CD pipeline

Contribua: Reporte issues e sugira melhorias

Dica: Sempre comece com --quick para testes rápidos, depois use --verbose para análise detalhada.

📄 Documentação atualizada em: $(Get-Date -Format "dd/MM/yyyy")
🔄 Última atualização: Versão 1.0.0
🐍 Python requerido: 3.8+
🔧 Manutenido por: PyFolds Team

