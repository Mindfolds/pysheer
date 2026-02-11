# ADR-001: PySheer como Plataforma de Métricas Arquiteturais

- **Status**: Proposed
- **Data**: 2026-02-08
- **Decisores**: Time de Arquitetura PySheer
- **Escopo**: Evolução de CLI para plataforma consumível por IA e aplicações externas.

## Contexto
O estado atual favorece análise pontual (execução local por comando). Para cenários de engenharia em escala, precisamos:

1. Coletar métricas de forma contínua e temporal.
2. Expor dados por API para consumo por dashboard, IDE, CI/CD e aplicações de IA.
3. Preservar histórico para análise de tendência, risco e previsão de debt.
4. Diferenciar PySheer de linters tradicionais com foco em **arquitetura + evolução**.

## Decisão
Adotar uma arquitetura de plataforma com quatro pilares:

1. **Coleta contínua** por agentes (repo, commits, PRs, pipelines).
2. **Persistência temporal** (TimescaleDB sobre PostgreSQL) para séries históricas.
3. **Camada de acesso** via API REST (fase inicial) e GraphQL/WebSocket (fase evolutiva).
4. **Inteligência arquitetural** (regras + ML) para predição e recomendações de refatoração.

## Consequências
### Positivas
- Habilita integração com múltiplos consumidores (CLI, web, plugins IDE, bots).
- Permite calcular tendência, degradação e ROI de correções arquiteturais.
- Cria base de dados para modelos preditivos de debt/fragilidade.

### Negativas / Riscos
- Maior complexidade operacional (DB, filas, observabilidade).
- Necessidade de governança de esquema de métricas e versionamento de contratos API.
- Custo inicial mais alto para MVP.

### Mitigações
- Implementação faseada (MVP -> analytics -> inteligência).
- Catálogo de métricas versionado (`metrics_registry`).
- Contratos API com testes de compatibilidade.

## Arquitetura proposta (alto nível)
```text
[Agentes de Coleta] -> [Ingestão] -> [TimescaleDB + Cache] -> [API] -> [Consumidores]
                                        |                      |
                                        +-> [Batch/ML]         +-> [Alertas]
```

## Modelo mínimo de dados
```sql
CREATE TABLE repositories (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    url TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    metadata JSONB DEFAULT '{}'::jsonb
);

CREATE TABLE metric_measurements (
    time TIMESTAMPTZ NOT NULL,
    repository_id UUID NOT NULL REFERENCES repositories(id),
    commit_hash VARCHAR(40),
    metric_name TEXT NOT NULL,
    metric_value JSONB NOT NULL,
    tags JSONB DEFAULT '{}'::jsonb
);
```

## Fases de implementação

### Fase 1 (MVP de Plataforma)
- Ingestão de métricas por commit.
- Persistência temporal.
- Endpoint REST de leitura histórica.
- Export CSV/JSON.

### Fase 2 (Inteligência Operacional)
- Alertas por limiar e tendência.
- Visualização temporal básica.
- Integração GitHub Actions.

### Fase 3 (Inteligência Preditiva)
- Modelos preditivos de hotspots e debt.
- Recomendações de refatoração com score de impacto.
- Simulação de impacto de PR.

## Critérios de aceitação técnicos
1. Métricas são versionadas e auditáveis.
2. API responde com paginação e filtros por período.
3. Pipeline suporta reprocessamento idempotente por commit.
4. Existem testes de regressão para cálculos críticos.

## Critérios científicos/matemáticos (para revisão sênior)
1. Toda métrica derivada deve declarar fórmula, domínio e unidade.
2. Métricas compostas precisam de normalização explícita.
3. Modelos preditivos devem reportar erro (MAE/RMSE/AUC) e janela temporal.
4. Alertas devem usar limiar robusto (ex.: percentil + desvio) para reduzir falso positivo.

## Decisões futuras relacionadas
- ADR de catálogo de métricas (nome, unidade, limites).
- ADR de versionamento de modelo preditivo.
- ADR de privacidade/compliance para dados de repositórios privados.
