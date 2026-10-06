---
name: team-comms
description: Revisa ou redige mensagens antes de enviar a colegas — Slack, comentário de Linear, review/comentário de GitHub. Ajusta tom, idioma e clareza pro canal e destinatário. Use quando eu disser "revisa essa mensagem", "ajuda a escrever isso pro Slack/Linear/GitHub", "manda isso pra [pessoa]" ou /team-comms.
---

Pega uma ideia em bruto (rascunho, bullets, ou "quero dizer X pra Y") e devolve
uma versão revisada, pronta pra colar — ajustada ao canal e ao destinatário.
**Nunca envia sozinha**: a entrega é o texto no chat, esperando aprovação
antes de qualquer `send_message` / `save_comment` / `gh pr comment`.

## Antes de escrever

1. Identifique o canal (Slack DM/canal, comentário de Linear, comentário/review
   de GitHub) e o destinatário — pergunte se não estiver claro pelo contexto.
2. Leia o histórico relevante (thread, issue, PR) antes de redigir — a
   mensagem deve responder ao que já foi dito, não flutuar solta.

## Regra geral: corta fluff

Aplica em todo canal, além das regras específicas abaixo.

- Sem preâmbulo ("espero que esteja bem", "só passando aqui pra..."), vai
  direto ao ponto.
- Sem repetir o mesmo fato duas vezes (ex.: contexto no início + resumo no
  fim dizendo a mesma coisa).
- Sem meta-narração sobre o processo ("revisei e percebi que...", "depois
  de pensar bastante...") — só o conteúdo que importa pro destinatário.
- Uma ideia por frase, frase curta. Corta advérbio/qualificador que não
  muda o sentido ("bem simples", "só uma pequena dúvida").
- Pedido vem explícito e cedo (o que precisa da pessoa), não enterrado no
  fim de um parágrafo.

## Regras por canal

### Slack
- pt-BR por padrão, a menos que a thread já esteja em inglês.
- Sem emoji.
- Curto — frases de uma linha; várias mensagens curtas em vez de uma longa,
  se for o padrão da conversa.
- Tom direto e cordial, sem formalidade de e-mail.

#### A voz do msilva

Perfil levantado em 2026-10-06 a partir de mensagens reais dele no Slack.
Vale para mensagens dele na primeira pessoa — não sobrepõe as regras de
Linear/GitHub abaixo, que têm convenção própria.

- Minúsculo no começo da frase é o padrão em mensagens rápidas/operacionais
  ("acho que foi isso", "sim, pode ser"). Mensagem com mais substância
  (explicação técnica, feedback de produto) pode capitalizar normalmente —
  ele mistura os dois registros, não é regra fixa.
- "Acho que" é hedge constante antes de opinião — manter, é a voz dele, não
  um tique pra cortar.
- "pra" em vez de "para", sempre. "tá"/"tô" em vez de "está"/"estou" em
  mensagens casuais.
- Travessão (—) pra emendar ressalva ou causa na mesma frase, em vez de
  abrir frase nova: "não faz sentido juntar como produto — são coisas
  diferentes".
- Feedback de produto pra colega segue um formato enxuto: abre com "Oie",
  rótulo curto ("Feedback de/sobre X:"), bullets diretos — sem
  elogio-sanduíche nem parágrafo de abertura — e fecha com uma linha curta
  de resumo só se precisar. Ver exemplo real abaixo.
- Sem assinatura nem despedida.

Exemplo real (feedback pro Vitrine, 2026-09-18, pra Carol Bezerra):

> Oie
>
> Feedbacks sobre o vitrine:
> • painel com meus projetos/skills/artefatos criados (A Gabi já tinha comentado, né)
> • no modal de cadastro podia ter um exemplo de prompt pra nos auxiliar a preencher os campos.
>
> acho que os dois principais são esses

### Comentário de Linear
- Segue `linear-issue-conventions.md` integralmente: pt-BR, sem nome de
  colega no texto (só em campos nativos), linguagem de negócio quando o
  comentário for sobre prioridade/justificativa.
- Dado que tem campo nativo (Estimate, Priority, Label) não vira prosa no
  comentário — aponta pro campo.

### GitHub (PR review / comentário de issue)
- Idioma acompanha o predominante já usado no repo/PR; default inglês se
  não houver padrão claro.
- Identificadores de código nunca traduzidos.
- Direto ao ponto técnico: o que está errado/sugestão + por quê, sem
  preâmbulo, a menos que o tom do repo já seja assim.

## Depois de redigir

Mostra o texto revisado no chat. Não chama a ferramenta de envio sem
confirmação explícita — enviar é visível a terceiros, sempre pede aprovação,
mesmo que já tenha aprovado antes nesta sessão.
