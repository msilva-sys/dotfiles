---
name: weekly-recap
description: Monta o prep pro "Recap da Semana" — retrospectivo, o que eu fiz/decidi essa semana. Diferente do weekly-prep (segunda), que é prospectivo. Use quando eu disser "recap da semana", "prep do recap", "recap de sexta" ou /weekly-recap.
---

Escreve `C:\Users\msilva\Documents\work\meetings\<data> Recap da Semana.md`
(schema em `CLAUDE.md` daquele vault, `type: meeting-prep`). Nunca escreve
direto: monta o rascunho, mostra a msilva no chat, espera confirmação (ou
ajuste) e só então grava.

## O que esta reunião é (não confundir com a Weekly)

A Weekly de segunda é **prospectiva** — o que cada um vai trabalhar essa
semana. O Recap de sexta é **retrospectivo** — reporta o progresso da
semana que passou. Precedentes: [[2026-08-14 Recap da Semana]],
[[2026-08-27 Recap da Semana]] (escritas depois da reunião, via ingest de
transcript — esta skill escreve o prep de ANTES).

**Isto significa**: nada de "no que vou trabalhar" ou "próximos passos" no
prep. Só o que já aconteceu, foi decidido, ou mudou de estado esta semana.
Se um item só descreve o estado atual de um projeto sem ligação com algo
que mudou nesta janela de 7 dias, ele não entra.

**Escopo: só a parte de msilva** — mesma lógica do `/weekly-prep`, mesmo a
reunião reunindo o time todo.

## Passo 1 — achar a última ocorrência

`Glob` em `meetings/*Recap da Semana*.md` — pega a mais recente (seja
prep ou já ingerida). Ela dá a **janela de tempo real**: da data dela até
hoje, não um "~7 dias" fixo — a cadência já variou (sexta, quinta) e não é
sempre semanal.

## Passo 2 — attendees de hoje

Mesma lógica do `/weekly-prep`: tenta `list_events` no calendário de hoje
pra achar o convite real. Se não achar, reusa a lista de attendees da
última ocorrência, sem inventar nomes novos.

## Passo 3 — montar o retrospectivo

Fontes, nesta janela (Passo 1):

1. **`log.md`** — todas as entradas na janela. É a fonte primária: já
   narra o que foi feito/decidido/achado, com citação de página.
2. **`decisions/` e `meetings/` criados na janela** — cruzar com o log
   pra não perder nada que o log resumiu de menos.
3. **Issues do Linear atribuídas a mim, `Done` ou criadas na janela** —
   só as que não já apareceram via 1/2.

Organiza por **projeto/sistema** (Airtable Proxy, Fluxo Agêntico, etc.),
não por dia — dia-a-dia é o que o `log.md` já é. Um item só entra se algo
**mudou** nesta janela (decisão fechada, achado, issue criada/fechada,
correção de estado). Estado que só descreve "onde o projeto está hoje"
sem uma mudança desta semana por trás fica de fora — isso é o que
`projects/*.md` já registra.

## Passo 4 — formato

Direto, bullets de uma linha por item — não parágrafo (mesmo padrão de
concisão de qualquer `meeting-prep` deste vault). Um heading por
projeto/sistema tocado na janela, só os que tiveram mudança real (Passo
3). Cada bullet cita a issue/decisão/página quando existir. **Sem seção
"próximos passos"** — se aparecer, é sinal de que virou weekly-prep, corta.

## Passo 5 — mostrar e confirmar

Cole o markdown completo (com frontmatter) na conversa. Pergunta se pode
gravar, ajustar, ou cancelar. **Nunca escreve o arquivo antes dessa
confirmação.**

Frontmatter:
```yaml
---
type: meeting-prep
status: active
updated: <data de hoje>
date: <data de hoje>
attendees: [...]
tags: [recap, linear, ...]
aliases: [Recap <data>]
---
```

## Passo 6 — gravar e fechar o loop

Depois da confirmação:
1. `Write` em `meetings/<data> Recap da Semana.md`.
2. Acrescenta linha em `index.md`, seção `## Meetings`.
3. Acrescenta entrada em `log.md`, prefixo `refactor` (mesmo precedente do
   `/weekly-prep`).
4. `git add` só os arquivos tocados + `git commit` no vault, mensagem
   batendo com a entrada do log.

Quando a reunião real acontecer e virar transcript, o ingest normal de
meeting (`CLAUDE.md`, variante de transcript) sobrescreve/complementa este
mesmo arquivo — não cria um "Meeting prep -" separado, mesmo padrão do
`/weekly-prep`.

## Regras

- Nunca invente o que foi feito — se as fontes não confirmarem algo, marca
  como incerto ou pergunta, não assume.
- Não é plano. Se o rascunho começar a soar como "vou fazer X", corta —
  isso é o `/weekly-prep`.
- Datas absolutas (`YYYY-MM-DD`), nunca "essa semana" sem a data por trás.
