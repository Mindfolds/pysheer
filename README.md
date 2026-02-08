# 🕷️ PySheer

**Sistema de Análise Arquitetural**

## 🚀 Instalação Rápida

`ash
# Instale localmente
pip install -e .

# Ou use diretamente
python -m pysheer
📖 Uso Básico
bash
# Inicializa configuração
pysheer init

# Analisa projeto atual
pysheer analyze

# Analisa diretório específico
pysheer analyze --src src/pyfolds

# Gera blueprint
pysheer blueprint --src src

# Análise PyFolds
pysheer pyfolds --src src/pyfolds
📊 Exemplo
python
from pysheer import PySheerAnalyzer

analyzer = PySheerAnalyzer("src/pyfolds")
result = analyzer.analyze()

print(f"Diretórios: {result.directories}")
print(f"Arquivos Python: {result.python_files}")
⚙️ Configuração
Edite pysheer.toml:

toml
[project]
name = "Meu Projeto"

[analysis]
max_depth = 8
check_file_sizes = true
🤝 Contribuindo
Fork o repositório

Crie uma branch

Commit suas mudanças

Abra um Pull Request

📄 Licença
MIT
14. INSTALAÇÃO
============================================================================
Write-Header "INSTALANDO PYSHEER"

try {
Write-Info "Instalando dependências..."
& $env:PYTHON -m pip install --quiet click rich

text
Write-Info "Instalando PySheer em modo desenvolvimento..."
& $env:PYTHON -m pip install --quiet -e .

Write-Success "PySheer instalado com sucesso!"
} catch {
Write-Warning "Não foi possível instalar automaticamente."
Write-Info "Instale manualmente com: pip install -e ."
}

============================================================================
15. TESTE
============================================================================
Write-Header "TESTANDO PYSHEER"

try {
# Testa se o comando foi instalado
$output = & $env:PYTHON -c "import pysheer; print('✅ PySheer importado com sucesso!')" 2>&1
Write-Success $output

text
# Testa comando CLI
Write-Info "Testando comando pysheer --version"
& $env:PYTHON -m pysheer --version
} catch {
Write-Warning "Teste falhou. Use: python -m pysheer"
}

============================================================================
16. ARQUIVO DE AJUDA RÁPIDA
============================================================================
$quickstartContent = @'

🚀 COMO USAR O PYSHEER
📋 COMANDOS RÁPIDOS:
bash
# Mostra ajuda
pysheer --help

# Mostra versão
pysheer --version

# Inicializa configuração
pysheer init

# Analisa diretório atual
pysheer analyze

# Analisa rapidamente
pysheer analyze --quick

# Analisa diretório específico
pysheer analyze --src src/pyfolds

# Gera blueprint
pysheer blueprint --src src

# Análise específica PyFolds
pysheer pyfolds --src src/pyfolds
🐍 USO COMO MÓDULO PYTHON:
python
from pysheer import PySheerAnalyzer

# Analisa um diretório
analyzer = PySheerAnalyzer("src/pyfolds")
result = analyzer.analyze()

print(f"Arquivos Python: {result.python_files}")
print(f"Violations: {result.violations}")
⚙️ CONFIGURAÇÃO:
Crie a configuração:

bash
pysheer init
Edite pysheer.toml

Execute a análise:

bash
pysheer analyze --src seu_diretorio
📁 ESTRUTURA CRIADA:
text
pysheer/
├── src/pysheer/          # Código fonte
├── examples/            # Exemplos
├── tests/              # Testes
├── pyproject.toml      # Configuração
├── requirements.txt    # Dependências
├── README.md          # Documentação
└── LICENSE            # Licença
🔧 SOLUÇÃO DE PROBLEMAS:
Problema: "pysheer não é reconhecido"
Solução: Use python -m pysheer

Problema: Erro de importação
Solução: Execute pip install -e . no diretório do projeto

Problema: Python não encontrado
Solução: Instale Python 3.8+ de python.org

🎯 PARA PYPOLDS:
bash
# Analisa a estrutura do PyFolds
pysheer pyfolds --src src/pyfolds

# Gera blueprint da arquitetura
pysheer blueprint --src src/pyfolds --output arquitetura.md