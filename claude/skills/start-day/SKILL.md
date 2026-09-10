---
name: start-day
description: Monta um panorama do dia — agenda, Linear, Slack, e-mail, pendências desta wiki e repos não fechados. Use quando eu disser "panorama do dia", "bom dia", "como está o dia" ou /start-day.
---

Comando **read-only sobre a wiki** — nunca cria, edita nem apaga nenhuma
página do vault. Roda do zero a cada chamada; não depende de estado de
execuções anteriores.

A saída é **markdown direto no chat** — nunca um Artifact. A mensagem em si
é a entrega; não publique arquivo nem link.

## Data de hoje

Use a data de hoje do contexto da sessão (fuso Brasília). Nunca pergunte a
msilva que dia é.

## Fontes a consultar

1. **Agenda (calendar).** Eventos de hoje. Sinalize:
   - conflitos / reuniões coladas sem intervalo
   - convites ainda não respondidos (accept/decline pendente)
   - reuniões sem nenhuma página correspondente em `meetings/` — nem prep nem
     nota de uma ocorrência anterior do mesmo assunto

2. **Linear.** Issues atribuídas a msilva:
   - atrasadas (due date no passado) — destaque quantos dias
   - vencendo hoje
   - em progresso há muito tempo sem movimento (se o campo estiver disponível)
   Não é preciso resolver team/projeto default — liste issues do usuário
   através da busca por assignee, não crie nem edite nada.

3. **Slack — varredura leve.** Só menções e DMs das últimas ~24–48h que
   parecem esperar resposta. Não vasculhe canais inteiros nem histórico
   antigo — o objetivo é "o que ficou parado ontem à noite", não um resumo
   geral do workspace.

4. **E-mail — varredura leve.** Threads não lidos/importantes das últimas
   ~24–48h que parecem pedir uma ação ou resposta de msilva. Mesmo critério
   de leveza do Slack: não é inbox zero, é "o que não pode ficar mais um
   dia".

5. **Esta wiki.** Sem campo de tarefas centralizado — e **não é mais fonte de
   pendências acionáveis de msilva**: `meetings/*.md` guarda `Commitments`
   como registro em prosa, não checkbox, e qualquer coisa acionável que
   msilva deveria fechar já devia ter virado issue no Linear (ver
   `CLAUDE.md`). Aqui, só:
   - para cada reunião de hoje na agenda, cheque se já existe
     `meetings/<data> <assunto>.md` (prep ou de uma ocorrência anterior
     ligada ao mesmo projeto/pessoa); se não existir, sinalize como prep
     faltando
   - cheque `syntheses/` com `status: active` cujo tema toca algo da agenda
     de hoje
   - opcionalmente, puxe da seção `Commitments` das reuniões mais recentes
     (últimos ~2 dias) só os compromissos **de terceiros** ainda sem retorno
     visível — não os de msilva, esses vivem no Linear

6. **Repos de código — varredura read-only.** Mesmas raízes e mesmo
   critério "trabalhei hoje/ontem" do skill `finish-day` (subpastas de
   `C:\Users\msilva\projects\` com `.git`, mais `work` e `projetos-wiki`):
   mudança pendente (`git status`) ou commit local sem push. Aqui é só
   **detectar e sinalizar** — nunca commite, dê push, nem stage nada; se
   quiser fechar, é o `/finish-day` que faz isso.

## Como montar o panorama

Direto, sem prosa — tabelas ou bullets de uma linha, não um parágrafo por
item (mesmo padrão de concisão usado em `meetings/` prep pages). Ordem:

1. **🔴 Urgente/atrasado** — issues Linear atrasadas, convites/e-mails/Slack
   que já deveriam ter resposta. Se não houver nada, diga explicitamente
   "nada atrasado" em vez de omitir a seção.
2. **📅 Agenda de hoje** — horário, assunto, prep faltando quando for o caso.
3. **Linear** — vencendo hoje / em progresso relevante. É a fonte de verdade
   para pendências de msilva, wiki incluída.
4. **Slack** — menções/DMs que pedem resposta.
5. **E-mail** — threads que pedem resposta.
6. **Wiki** — prep de reunião faltando, syntheses abertas relacionadas ao
   dia, compromissos de terceiros ainda sem retorno.
7. **Repos** — repos com mudança pendente ou commit não pushado; sugira
   `/finish-day` se houver algum.

Se alguma fonte não pôde ser checada (sem acesso, erro, escopo insuficiente),
diga isso explicitamente na seção correspondente — nunca omita em silêncio.

## Calibração conhecida (releia antes de classificar urgência)

- **`dueDate` do Linear em issues `Backlog`** costuma ser um prazo de
  planejamento antigo, nunca atualizado — não trate como atraso real sem
  ressalva. Dê mais peso a issues **`In Progress`** vencidas, essas são o
  sinal confiável.
- **`Commitments` de `meetings/*.md` não são mais uma fonte de pendências de
  msilva** (decidido 2026-08-26) — são registro em prosa, sem checkbox, sem
  data. O que ele precisa fechar vive no Linear. Só vale puxar dali
  compromissos de **terceiros**, e só das reuniões mais recentes (~2 dias),
  para não virar ruído.
