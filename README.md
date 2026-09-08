# dotfiles

Configs pessoais que quero versionadas fora de qualquer repo de projeto.

## claude/skills/

Skills próprias do Claude Code (não as de plugin/marketplace, essas já são
gerenciadas por fora). Cada uma vive em `claude/skills/<nome>/SKILL.md` e é
ligada em `~/.claude/skills/<nome>` por uma junction NTFS (não precisa de
privilégio de admin, ao contrário de um symlink comum no Windows):

```powershell
cmd /c mklink /J "C:\Users\msilva\.claude\skills\<nome>" "C:\Users\msilva\projects\dotfiles\claude\skills\<nome>"
```

- `finish-day` — comita e dá push nos repos trabalhados no dia, com confirmação.
- `start-day` — panorama do dia (agenda, Linear, Slack, e-mail, wiki, repos pendentes).

### Setup em máquina nova

1. Clonar este repo (em qualquer pasta — os scripts se localizam sozinhos).
2. Rodar o script do seu OS. Pega toda pasta em `claude/skills/`
   automaticamente (nada pra editar quando uma skill nova entrar) e é
   idempotente — rodar de novo só pula o que já está ligado.

   **Windows** (junction, não precisa de admin): `.\setup.ps1`
   **macOS/Linux**: `./setup.sh`
