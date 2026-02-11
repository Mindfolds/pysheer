# Prompt pronto para ChatGPT Codex

Use o texto abaixo diretamente no Codex para gerar a base do projeto.

---

Você é um engenheiro de software sênior e deve implementar o **Spider Code Analysis Platform** a partir dos ADRs listados abaixo, com foco em robustez de engenharia, coerência matemática das métricas e arquitetura evolutiva.

## Objetivo
Construir o esqueleto funcional do projeto com código inicial executável, testes mínimos e documentação técnica.

## Requisitos de entrega
1. Criar a estrutura de pastas completa:
   - `adrs/` com arquivos `ADR-0001.md` até `ADR-0050.md`.
   - `src/spider/` com módulos `api`, `core`, `plugins`, `parsers`, `metrics`, `models`, `storage`, `cli`, `monitoring`, `learning`, `utils`.
   - `tests/unit`, `tests/integration`, `tests/e2e`.
   - `docs/`, `config/`, `.github/workflows/`, `docker/`.
2. Implementar MVP funcional com:
   - CLI `spider analyze --src <path>`.
   - Pipeline simples de análise para Python (`ast`) com 3 métricas: complexidade ciclomática aproximada, tamanho e imports.
   - Persistência local inicial em SQLite (com interface preparada para TimescaleDB).
   - API REST FastAPI com endpoint `GET /metrics/{project_id}`.
3. Criar contratos de dados:
   - `MetricMeasurement` com `time`, `project_id`, `commit_hash`, `metric_name`, `metric_value`, `tags`.
   - registro versionado de métricas em `config/metrics_registry.yaml`.
4. Testes obrigatórios:
   - teste unitário de cálculo de métrica.
   - teste de integração CLI -> persistência.
   - teste API de leitura histórica.
5. Qualidade:
   - type hints obrigatórios.
   - logging estruturado em JSON.
   - lint + test no CI (`.github/workflows/ci.yml`).

## Regras matemáticas e científicas (obrigatórias)
- Cada métrica deve declarar fórmula, domínio, limites e interpretação.
- Evitar métricas sem normalização quando houver agregação entre módulos.
- Se criar score composto, documentar equação e pesos em `docs/metrics-model.md`.
- Adicionar seção “validação” com limitações estatísticas e risco de falso positivo.

## Lista oficial de ADRs
- ADR-0001: Arquitetura Monolítica Modular
- ADR-0002: Sistema de Plugins para Análises
- ADR-0003: Cache Multinível SHA256 + mtime
- ADR-0004: Persistência com SQLAlchemy Core
- ADR-0005: Plano de 50 ADRs para o Spider Code Analysis Platform
- ADR-0006: Parsing AST Robusto com Fallbacks
- ADR-0007: Estratégia Multi-linguagem Faseada
- ADR-0008: Configuração Hierárquica em TOML
- ADR-0009: Auth com JWT + OAuth2 + RBAC
- ADR-0010: Logging Estruturado JSON
- ADR-0011: AST com astroid + LibCST
- ADR-0012: Type Hints Obrigatórios
- ADR-0013: Estratégia de Testes 80%
- ADR-0014: Pipeline CI/CD em Estágios
- ADR-0015: Containerização Multi-stage
- ADR-0016: Documentação com MkDocs
- ADR-0017: Tratamento de Erros Degradável
- ADR-0018: Monitoramento de Performance
- ADR-0019: Security Scanning no CI
- ADR-0020: Backup Incremental de Histórico
- ADR-0021: REST + GraphQL Híbrido
- ADR-0022: Frontend React 18 + TypeScript
- ADR-0023: State Management com Zustand
- ADR-0024: Estilo com Tailwind + CSS Modules
- ADR-0025: Visualização com D3 + Recharts
- ADR-0026: Internacionalização com i18next
- ADR-0027: Aplicação como PWA
- ADR-0028: SEO com SSR para páginas públicas
- ADR-0029: Acessibilidade WCAG 2.1 AA
- ADR-0030: Suporte de Navegadores
- ADR-0031: Layout do Dashboard
- ADR-0032: Tema Escuro por Padrão
- ADR-0033: Visualização de Erros por Heatmap
- ADR-0034: Editor com Monaco
- ADR-0035: Atualizações em Tempo Real
- ADR-0036: Exportação Multi-formato
- ADR-0037: Busca Full-text e Filtros
- ADR-0038: Onboarding Guiado
- ADR-0039: Sistema de Notificações
- ADR-0040: Responsividade Mobile-first
- ADR-0041: Métricas de Qualidade ISO 25010
- ADR-0042: Análise de Segurança OWASP/SANS
- ADR-0043: Análise de Performance de Código
- ADR-0044: Análise de Cobertura de Testes
- ADR-0045: Análise de Documentação Técnica
- ADR-0046: Análise Arquitetural por Dependências
- ADR-0047: Detecção de Code Smells
- ADR-0048: Detecção de Duplicação
- ADR-0049: Modo de Aprendizado
- ADR-0050: Sugestões de Refatoração Seguras

## Saída esperada do Codex
- Commits pequenos por módulo.
- Código executável localmente com `make test` e `make run`.
- README com quickstart e arquitetura.
- Lista de gaps técnicos pendentes para Fase 2.

---

## Observação para uso prático
Se quiser reduzir risco no primeiro ciclo, execute em duas etapas:
1. **Scaffold + MVP backend/CLI**.
2. **Frontend + tempo real + ML**.
