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

1. Clonar este repo (convenção: `~/projects/dotfiles`).
2. Ligar cada skill em `~/.claude/skills/` — roda uma vez, pega todas as
   pastas dentro de `claude/skills/` automaticamente, sem precisar listar
   nome por nome:

   **Windows** (junction, não precisa de admin):
   ```powershell
   Get-ChildItem "$env:USERPROFILE\projects\dotfiles\claude\skills" | ForEach-Object {
       cmd /c mklink /J "$env:USERPROFILE\.claude\skills\$($_.Name)" $_.FullName
   }
   ```

   **macOS/Linux**:
   ```bash
   for d in ~/projects/dotfiles/claude/skills/*/; do
     ln -s "$d" ~/.claude/skills/"$(basename "$d")"
   done
   ```
