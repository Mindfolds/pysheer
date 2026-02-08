Script para iniciar rapidamente o PySheer
Write-Host "`n🚀 Inicializando PySheer..." -ForegroundColor Cyan
Write-Host "═" * 50 -ForegroundColor Cyan

Verifica se está no diretório certo
if (-not (Test-Path "src/pysheer")) {
Write-Host "❌ Diretório do PySheer não encontrado!" -ForegroundColor Red
Write-Host "Execute este script no diretório do PySheer" -ForegroundColor Yellow
exit 1
}

Verifica Python
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
if (Get-Command python3 -ErrorAction SilentlyContinue) {
$python = "python3"
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
$python = "py"
} else {
Write-Host "❌ Python não encontrado!" -ForegroundColor Red
Write-Host "Instale Python: https://www.python.org/downloads/" -ForegroundColor Yellow
exit 1
}
} else {
$python = "python"
}

Write-Host "✅ Python encontrado: $python" -ForegroundColor Green

Instala se necessário
try {
$test = & $python -c "import pysheer" 2>&1
if ($LASTEXITCODE -ne 0) {
Write-Host "📦 Instalando PySheer..." -ForegroundColor Yellow
& $python -m pip install -e . --quiet
}
} catch {
Write-Host "📦 Instalando PySheer..." -ForegroundColor Yellow
& $python -m pip install -e . --quiet
}

Cria configuração se não existir
if (-not (Test-Path "pysheer.toml")) {
Write-Host "⚙️ Criando configuração..." -ForegroundColor Yellow
& $python -m pysheer init
}

Write-Host "`n✅ PySheer pronto para usar!" -ForegroundColor Green
Write-Host "═" * 50 -ForegroundColor Green

Write-Host "`n📋 COMANDOS DISPONÍVEIS:" -ForegroundColor Cyan
Write-Host " pysheer --help # Mostra ajuda" -ForegroundColor Yellow
Write-Host " pysheer analyze --src . # Analisa diretório atual" -ForegroundColor Yellow
Write-Host " pysheer analyze --quick # Análise rápida" -ForegroundColor Yellow
Write-Host " pysheer blueprint --src src # Gera blueprint" -ForegroundColor Yellow
Write-Host " pysheer pyfolds --src src/pyfolds # Análise PyFolds" -ForegroundColor Yellow

Write-Host "`n🔧 COMANDOS ALTERNATIVOS:" -ForegroundColor Magenta
Write-Host " python -m pysheer [comando] # Se 'pysheer' não funcionar" -ForegroundColor Gray

Write-Host "`n🎯 PARA COMEÇAR:" -ForegroundColor Green
Write-Host " 1. pysheer init # Cria configuração" -ForegroundColor White
Write-Host " 2. pysheer analyze --src . # Testa análise" -ForegroundColor White
Write-Host " 3. pysheer pyfolds --src src/pyfolds # Analisa PyFolds" -ForegroundColor White

Write-Host "`n═" * 50 -ForegroundColor Green
Write-Host "🚀 DIVIRTA-SE ANALISANDO!" -ForegroundColor Green -BackgroundColor Black
Write-Host "═" * 50 -ForegroundColor Green
'@

Write-File "quick-start.ps1" $quickStartScript

============================================================================
RESUMO FINAL
============================================================================
Write-Header "🎉 PYSHEER CRIADO COM SUCESSO!"

Write-Host "📁 ESTRUTURA CRIADA:" -ForegroundColor Cyan
Get-ChildItem -Recurse -Depth 2 | Select-Object @{Name="Tipo";Expression={if($_.PSIsContainer){"📁"}else{"📄"}}}, Name | Format-Table -AutoSize

Write-Host "`n🚀 PRÓXIMOS PASSOS:" -ForegroundColor Green
Write-Host " 1. cd $ProjectName # Entre no diretório" -ForegroundColor Yellow
Write-Host " 2. .\quick-start.ps1 # Inicialize o PySheer" -ForegroundColor Yellow
Write-Host " 3. pysheer analyze --src . --quick # Teste a análise" -ForegroundColor Yellow
Write-Host " 4. pysheer pyfolds --src src/pyfolds # Analise PyFolds" -ForegroundColor Yellow

Write-Host "`n🐍 PARA PYPOLDS:" -ForegroundColor Magenta
Write-Host " pysheer pyfolds --src src/pyfolds" -ForegroundColor White
Write-Host " pysheer blueprint --src src/pyfolds --output pyfolds-architecture.md" -ForegroundColor White

Write-Host "`n📚 DOCUMENTAÇÃO:" -ForegroundColor Cyan
Write-Host " • README.md - Documentação principal" -ForegroundColor Gray
Write-Host " • QUICKSTART.md - Guia rápido" -ForegroundColor Gray
Write-Host " • examples/basic.py - Exemplo de uso" -ForegroundColor Gray

Write-Host "`n🔧 PARA DESENVOLVIMENTO:" -ForegroundColor Blue
Write-Host " python examples/basic.py # Testa exemplo" -ForegroundColor Yellow
Write-Host " pip install -e . # Reinstala em modo dev" -ForegroundColor Yellow

Write-Host "`n" + "═" * 60 -ForegroundColor Green
Write-Host "✅ TUDO PRONTO! O PySheer foi criado com sucesso!" -ForegroundColor Green -BackgroundColor Black
Write-Host "═" * 60 -ForegroundColor Green

Volta ao diretório original
Set-Location $currentDir

Write-Host "n💡 DICA: Para começar a usar:" -ForegroundColor Cyan Write-Host " cd $ProjectName && .\quick-start.ps1" -ForegroundColor Yellow -BackgroundColor DarkGray Write-Host "n"

text

## 🚀 **COMO USAR:**

### 1. **Salve o script** como `create-pysheer.ps1`

### 2. **Execute no PowerShell:**
```powershell
# Abra PowerShell como Administrador se necessário
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Execute o script
.\create-pysheer.ps1

# Ou com força se já existir
.\create-pysheer.ps1 -Force

# Com nome diferente
.\create-pysheer.ps1 -ProjectName "meu-analisador"