---
name: weekly-prep
description: Monta o prep da "Weekly - Projetos e Tarefas" de segunda — prospectivo, no que vou trabalhar essa semana. Diferente do Recap da Semana (sexta), que é retrospectivo. Use quando eu disser "prep da weekly", "prep de segunda", "prep da semana" ou /weekly-prep.
---

Escreve `C:\Users\msilva\Documents\work\meetings\<data> Weekly - Projetos e
Tarefas.md` — segue o schema em `CLAUDE.md` daquele vault (`type:
meeting-prep`). Nunca escreve direto: monta o rascunho, mostra a msilva no
chat, espera confirmação (ou ajuste) e só então grava.

## O que esta reunião é (não confundir com o Recap)

Decidido por msilva 2026-09-14, registrado em
`meetings/2026-08-14 Recap da Semana.md`: a Weekly de segunda é
**prospectiva** — mostra no que cada um vai trabalhar essa semana. O Recap
de sexta é **retrospectivo** — reporta o progresso da semana que passou.

**Isto significa**: o prep não é uma tabela de status do que já foi feito.
É uma lista do que msilva pretende tocar essa semana, mais o que ele quer
levar/perguntar ao grupo. Progresso passado só entra como justificativa
curta de por que um item está na fila agora ("X foi resolvido, então Y é o
próximo passo").

## Passo 1 — achar a última ocorrência

`Glob` em `meetings/*Weekly - Projetos e Tarefas*.md` — pega a mais
recente. Ela dá: attendees de referência, e qualquer pergunta que ficou em
aberto lá (ver se já foi resolvida em outro lugar antes de repetir).

## Passo 2 — attendees de hoje

Tenta `list_events` no calendário de hoje pra achar o convite real desta
reunião e puxar a lista de convidados. Se não achar (reunião não está no
calendário de hoje, ou skill rodando em outro dia), reusa a lista de
attendees da última ocorrência, sem inventar nomes novos.

## Passo 3 — resumo rápido do que foi fechado semana passada

Curto, de propósito — o Recap de sexta é o lugar pro detalhe por pessoa.
Fontes:

1. **Issues do Linear atribuídas a mim que viraram `Done` nos últimos ~7
   dias** (comparar `updatedAt`/`completedAt`).
2. **Decisões (`decisions/`) ou marcos registrados em `meetings/`** na
   mesma janela de ~7 dias que registrem algo que msilva fechou.

Bullets de uma linha, no máximo ~5 itens. Se nada relevante fechou, uma
linha dizendo isso — nunca omita a seção em silêncio.

## Passo 4 — montar "no que vou trabalhar essa semana"

Fontes, nesta ordem:

1. **Issues do Linear atribuídas a mim** (`list_issues`, `assignee: me`) —
   filtra por `In Progress` e `Todo`/próximo passo desbloqueado. Ignora
   `Backlog` puro a menos que uma decisão recente (ver item 2 abaixo) tenha
   acabado de destravar algo de lá.
2. **Decisões/marcos recentes da wiki** (`decisions/`, `meetings/` dos
   últimos ~7 dias) que já definem algo específico pra essa semana — ex.:
   "dev de X começa segunda", um prazo combinado com alguém. Não é uma
   varredura geral da wiki, só o que bate com a janela de 1 semana.
3. **Perguntas/bloqueios pra levar ao grupo** — coisas que dependem de
   outra pessoa (aprovação, decisão, recurso), não status pessoal.

Se algo relevante mudou desde a última leitura da wiki (ex.: um deploy que
terminou, um trial que foi resolvido), **pergunte a msilva antes de
assumir o estado atual** em vez de confiar cegamente no que a wiki registra
— páginas descrevem o estado na última vez que foram tocadas, não live
state. Ofereça atualizar a(s) página(s) afetada(s) com a correção, mas só
depois de confirmar com ele.

## Passo 5 — formato

Direto, tabelas/bullets de uma linha — não um parágrafo por item (mesmo
padrão de concisão de qualquer `meeting-prep` deste vault). Seções, nesta
ordem, cada uma só se tiver conteúdo real:

1. **Resumo rápido da semana passada** — bullets curtos (Passo 3).
2. **No que vou trabalhar essa semana** — tabela: item, por que está na
   fila agora, referência (issue do Linear, decisão da wiki).
3. **Pontos rápidos pro grupo** — fatos de **estado compartilhado que
   mudaram e afetam outras pessoas**, não "o que eu vou fazer" (já está na
   seção 2) nem "o que eu já fiz" (isso é o Recap de sexta). Teste: *isso
   desbloqueia, afeta ou interessa alguém além de mim?* Exemplos:
   - um bloqueio comum que caiu (ex.: um trial/limite que travava todo
     mundo foi resolvido);
   - um marco de infra que outros dependem (ex.: um serviço foi ao ar,
     ainda sem consumidor conectado);
   - um prazo/marco combinado que envolve outra frente, mesmo não sendo
     trabalho seu (ex.: outro projeto começa a ser desenvolvido essa
     semana).
   Bullets de uma linha. Perguntas que dependem de alguém responder não
   entram aqui — essas já são o item 3 do Passo 4.

Não recrie a seção "aberto na reunião passada" a menos que a pergunta
ainda dependa de alguém do grupo responder — perguntas já resolvidas em
chat ou numa 1:1 não voltam ao prep, só são fechadas na página onde
ficaram em aberto (ver Passo 7).

## Passo 6 — mostrar e confirmar

Cole o markdown completo (com frontmatter) na conversa. Pergunte se pode
gravar, ajustar, ou cancelar. **Nunca escreva o arquivo antes dessa
confirmação.**

Frontmatter:
```yaml
---
type: meeting-prep
status: active
updated: <data de hoje>
date: <data de hoje>
attendees: [...]
tags: [weekly, linear, ...]
aliases: [Weekly <data>]
---
```

## Passo 7 — gravar e fechar o loop

Depois da confirmação:
1. `Write` em `meetings/<data> Weekly - Projetos e Tarefas.md`.
2. Se alguma pergunta em aberto de uma página antiga foi resolvida nesta
   conversa (ex.: msilva corrigiu um fato, uma decisão que era condicional
   virou certa), atualize essa página também, com um callout datado — não
   deixe a correção só no prep novo.
3. Acrescenta uma linha em `index.md`, seção `## Meetings`.
4. Acrescenta entrada em `log.md`, prefixo `refactor` (precedente: preps
   de reunião sempre usam esse prefixo, nunca `ingest`).
5. `git add` só os arquivos tocados + `git commit` no vault
   (`C:\Users\msilva\Documents\work`), mensagem batendo com a entrada do
   log.

## Regras

- Nunca invente o que msilva vai trabalhar — se as fontes não derem uma
  resposta clara, pergunte a ele em vez de supor.
- Não é status report. Se o rascunho começar a parecer uma lista do que já
  foi feito, reformule em termos de "o que isso destrava pra essa semana".
- Datas absolutas (`YYYY-MM-DD`), nunca "essa semana" sem a data por trás.
