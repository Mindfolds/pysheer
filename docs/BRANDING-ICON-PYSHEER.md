# Direção de ícone e marca — PySheer

## Conceito escolhido
**Pegada arquitetural** (`🐾`) + **Python** (`🐍`) + **observabilidade** (`👁️`).

Mensagem central: **"Cada commit deixa uma pegada arquitetural."**

## Recomendação visual
1. Ícone principal: forma de pegada estilizada com trilha/curva de serpente.
2. Variação favicon (16x16): simplificar para `🐍👣`.
3. Variação app/store (64x64+): incluir olho minimalista no núcleo.

## Paleta inicial
- Primária: `#4F46E5`
- Secundária (python/ação): `#10B981`
- Neutra escura: `#1F2937`
- Suporte terra (pegada): `#8B4513`

## SVG base (MVP)
```svg
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="64" cy="84" rx="36" ry="18" fill="#8B4513" opacity="0.7"/>
  <circle cx="50" cy="44" r="8" fill="#D2691E"/>
  <circle cx="64" cy="38" r="8" fill="#D2691E"/>
  <circle cx="78" cy="44" r="8" fill="#D2691E"/>
  <path d="M22 66 C44 54, 86 56, 106 68" stroke="#10B981" stroke-width="6" fill="none" stroke-linecap="round"/>
  <circle cx="108" cy="68" r="9" fill="#10B981"/>
  <circle cx="111" cy="66" r="3" fill="#1F2937"/>
  <circle cx="112" cy="65" r="1" fill="#FFFFFF"/>
</svg>
```

## Diretriz de produto
- Usar metáfora de pegada em métricas históricas: "pegada leve", "pegada moderada", "pegada crítica".
- Manter naming técnico em inglês para API e SDK; comunicação de marca pode ser PT/EN.
