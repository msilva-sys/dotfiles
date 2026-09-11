# dotfiles

Configs pessoais que quero versionadas fora de qualquer repo de projeto.

## claude/skills/

Skills próprias do Claude Code (não geradas por plugin/marketplace — essas
vêm de `claude/plugins.txt`, ver abaixo). Cada uma vive em
`claude/skills/<nome>/SKILL.md` e é ligada em `~/.claude/skills/<nome>` por
uma junction NTFS (não precisa de privilégio de admin, ao contrário de um
symlink comum no Windows):

```powershell
cmd /c mklink /J "C:\Users\msilva\.claude\skills\<nome>" "C:\Users\msilva\projects\dotfiles\claude\skills\<nome>"
```

- `finish-day` — comita e dá push nos repos trabalhados no dia, com confirmação.
- `start-day` — panorama do dia (agenda, Linear, Slack, e-mail, wiki, repos pendentes).
- `team-comms` — revisa/redige mensagens pra colegas antes de enviar (Slack, Linear, GitHub).

## nvim/

Config do Neovim (lazy.nvim + `lua/euliveiras/`). É ligada na pasta que o
Neovim lê de fato por uma junction NTFS:

```powershell
cmd /c mklink /J "C:\Users\msilva\AppData\Local\nvim" "C:\Users\msilva\projects\dotfiles\nvim"
```

No Linux/macOS o equivalente é um symlink em `~/.config/nvim`.

## claude/plugins.txt

Lista, um comando por linha, dos marketplaces e plugins instalados (sem o
prefixo `claude` — os scripts de setup completam isso). Pra adicionar um
plugin novo: instale normalmente com `claude plugin install ...` e acrescente
a mesma linha aqui, pra ficar reproduzível na próxima máquina.

## Setup em máquina nova

1. Clonar este repo (em qualquer pasta — os scripts se localizam sozinhos).
2. Rodar o script do seu OS:
   - Liga toda pasta em `claude/skills/` e `nvim/` automaticamente (nada pra
     editar quando uma skill nova entrar) — idempotente, rodar de novo só
     pula o que já está ligado.
   - Roda cada linha de `claude/plugins.txt` via `claude ...` — se o
     marketplace/plugin já existir, o próprio `claude` avisa e o script
     segue (não trava o resto).

   **Windows** (junction, não precisa de admin): `.\setup.ps1`
   **macOS/Linux**: `./setup.sh`
