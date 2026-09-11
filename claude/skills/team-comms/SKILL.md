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

## Regras por canal

### Slack
- pt-BR por padrão, a menos que a thread já esteja em inglês.
- Sem emoji.
- Curto — frases de uma linha; várias mensagens curtas em vez de uma longa,
  se for o padrão da conversa.
- Tom direto e cordial, sem formalidade de e-mail.

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
