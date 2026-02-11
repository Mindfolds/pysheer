# Backlog técnico (issues recomendadas por engenharia sênior)

## ISSUE-01 — Definir formalmente o catálogo de métricas
**Problema**: Métricas sem fórmula explícita tendem a gerar interpretações inconsistentes.

**Ação**:
- Criar `metrics_registry.yaml` com campos: `name`, `formula`, `domain`, `unit`, `thresholds`, `version`.
- Versionar mudanças sem quebrar histórico.

**Critério de pronto**:
- Todas as métricas do MVP possuem definição matemática e limites operacionais.

---

## ISSUE-02 — Normalização e agregação de scores
**Problema**: Somar métricas heterogêneas sem normalização distorce decisão.

**Ação**:
- Adotar min-max ou z-score por métrica.
- Definir pesos auditáveis para score composto.

**Critério de pronto**:
- Documento `docs/metrics-model.md` com equações e exemplos numéricos.

---

## ISSUE-03 — Validação estatística de alertas
**Problema**: limiar fixo gera falso positivo em projetos de perfis diferentes.

**Ação**:
- Implementar alerta por distribuição histórica (percentil + desvio).
- Medir precisão/recall dos alertas em baseline interno.

**Critério de pronto**:
- Relatório com taxa de falso positivo e falso negativo por tipo de alerta.

---

## ISSUE-04 — Convergência de métricas temporais
**Problema**: tendência semanal pode oscilar por sazonalidade e gerar ruído.

**Ação**:
- Aplicar suavização (EMA) e janela mínima de observações.
- Marcar confiança da previsão quando N for baixo.

**Critério de pronto**:
- Endpoint retorna `value`, `trend`, `confidence`.

---

## ISSUE-05 — Correlação entre mudanças e falhas reais
**Problema**: sem conexão com incidentes/bugs, o score perde valor de negócio.

**Ação**:
- Integrar dados de incidentes (Jira/Sentry/GitHub Issues).
- Calcular correlação entre degradação arquitetural e defeitos.

**Critério de pronto**:
- Dashboard com evidência de impacto (ex.: aumento de bugs por hotspot).

---

## ISSUE-06 — Segurança e isolamento de análise
**Problema**: análise de repositório pode executar conteúdo malicioso se não isolada.

**Ação**:
- Executar análise em ambiente restrito (container sem privilégios).
- Proibir execução dinâmica de código analisado.

**Critério de pronto**:
- Política de sandbox documentada e teste de segurança no CI.
