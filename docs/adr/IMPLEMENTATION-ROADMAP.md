# Roadmap de Implementação orientado por ADR

## Objetivo
Transformar o PySheer em uma plataforma de análise com foco em robustez de engenharia, validade técnica e visualização acionável de erros.

## Fase 1 — Fundação (2 semanas)
- Implementar núcleo `SpiderEngine` (ADR-0001, ADR-0006, ADR-0017).
- Estruturar cache L1/L2 com invalidação hash+mtime (ADR-0003).
- Ativar logging estruturado e telemetria básica (ADR-0010, ADR-0018).
- Definir baseline de testes e cobertura (ADR-0013).

## Fase 2 — Performance e Governança (2 semanas)
- Otimização de construção de dependências para evitar O(n²) evitável.
- Pipeline CI/CD multi-estágio com quality gates (ADR-0014, ADR-0019).
- Persistência de histórico e backup incremental (ADR-0004, ADR-0020).

## Fase 3 — Dashboard e UX (2 semanas)
- Back-end FastAPI + WebSocket/SSE (ADR-0005, ADR-0021).
- Front-end React + TypeScript e visualização de hotspots (ADR-0022, ADR-0025, ADR-0033).
- Busca e filtros avançados no painel (ADR-0037).

## Fase 4 — Qualidade Analítica (2 semanas)
- Métricas ISO 25010 subset e smells prioritários (ADR-0041, ADR-0047).
- Sugestões de refatoração seguras e modo aprendizado (ADR-0049, ADR-0050).

## Critérios de aceite técnico
- Nenhuma regressão crítica em testes automatizados.
- Latência média por análise dentro da meta definida em benchmark.
- Todas as decisões implementadas rastreadas para ADR correspondente.
- Documentação atualizada por feature entregue.
