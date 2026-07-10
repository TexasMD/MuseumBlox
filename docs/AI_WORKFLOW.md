# AI Workflow: Roblox Studio, Jules, GitHub, and Codex

## Recommended Setup

Use GitHub as the shared source of truth.

```text
Jules -> GitHub branch / PR -> local pull/review -> Rojo sync/build -> Roblox Studio playtest
Codex -> local repo changes + Roblox Studio MCP checks -> GitHub commit / PR
Roblox Studio -> live editing, playtesting, publishing
```

Jules is not a replacement for Roblox Studio Assistant and does not directly connect to the local Roblox Studio MCP session. Jules works best as a GitHub coding agent that edits repo files, opens branches, and prepares PRs. Codex can work locally and can also use the Roblox Studio MCP bridge when Studio is open.

## One-Time Local Setup

1. Open the repo:

```powershell
cd C:\Users\sethm\RB\MOBI
```

2. Confirm the GitHub remote:

```powershell
git remote -v
```

Expected remote:

```text
https://github.com/TexasMD/MuseumBlox.git
```

3. Confirm Rojo works:

```powershell
& 'C:\Users\sethm\.rokit\bin\rojo.exe' build -o "$env:TEMP\museum-of-bad-ideas-test.rbxlx"
```

4. Open Roblox Studio and enable the MCP server:

```text
Assistant -> ... -> Manage MCP Servers -> Enable Studio as MCP server
```

5. In Codex, target the connected Studio instance before changing the place through MCP.

## Jules Setup

1. Go to `https://jules.google.com`.
2. Sign in with the Google account you want to use.
3. Connect GitHub.
4. Grant Jules access to `TexasMD/MuseumBlox`.
5. Select the repo and branch in Jules.
6. Let Jules read the root `AGENTS.md` file.

Suggested Jules setup script:

```bash
set -euo pipefail

if ! command -v rokit >/dev/null 2>&1; then
  curl -sSf https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | bash
  export PATH="$HOME/.rokit/bin:$PATH"
fi

rokit install
rojo --version
rojo build -o /tmp/museum-of-bad-ideas-test.rbxlx
```

Jules runs in a Linux VM, so it can validate source layout and Rojo builds, but it cannot run the Windows Roblox Studio app or playtest the local place.

## How To Use Jules

Use Jules for isolated repo tasks:

- Add or refactor Luau modules under `src/`.
- Add shared definitions under `src/shared`.
- Update docs.
- Add manual test checklists.
- Prepare PRs for review.

Avoid giving Jules vague tasks like "make the game better." Good tasks are small and testable.

Example Jules prompt:

```text
In TexasMD/MuseumBlox, add a small shared definition module for the five MVP interactables. Keep the existing PrototypeInteractionService behavior unchanged. Update docs/TECHNICAL_ARCHITECTURE.md with the new file and run rojo build. Open a PR when complete.
```

You can also start Jules from GitHub Issues by adding the label:

```text
jules
```

## How To Use Codex With Roblox Studio MCP

Use Codex for local work that benefits from the live Studio session:

- Inspect the open place DataModel.
- Run Luau in Edit mode.
- Start and stop play mode.
- Read Studio console output.
- Verify that required objects exist.
- Make small local repo changes and test them with Rojo/Studio.

Current Codex MCP config uses:

```toml
[mcp_servers.Roblox_Studio]
command = "cmd.exe"
args = ["/c", 'C:\Users\sethm\AppData\Local\Roblox\mcp.bat']
startup_timeout_sec = 120
```

Before a Codex MCP change, confirm the active Studio window is the intended MuseumBlox place.

## Day-To-Day Workflow

1. Create or pick a GitHub Issue for the next small task.
2. Assign the task to either Jules or Codex:
   - Use Jules for branch/PR code work.
   - Use Codex for local Studio/MCP work.
3. Review the diff before merging.
4. Pull the merged branch locally:

```powershell
git pull --ff-only
```

5. Run a Rojo build:

```powershell
& 'C:\Users\sethm\.rokit\bin\rojo.exe' build -o "$env:TEMP\museum-of-bad-ideas-test.rbxlx"
```

6. Open or sync in Roblox Studio and playtest.
7. Commit any Studio-driven source changes back to GitHub.

## Current Manual Playtest Checklist

In Roblox Studio, make sure these objects exist:

```text
Workspace.Museum.Interactables.PassportKiosk
Workspace.Museum.Interactables.WaiverKiosk
Workspace.Museum.Interactables.BureaucracyClerk
Workspace.Museum.Interactables.PunPlaque
Workspace.Museum.Interactables.SanitationBooth
```

Each should contain a `ProximityPrompt`.

Press Play and verify:

1. Passport kiosk grants `HasBadIdeaPassport`.
2. Waiver kiosk grants `PocketProtectorRequired`.
3. Bureaucracy clerk sets a quest.
4. Pun plaque applies `PunContaminated`.
5. Sanitation booth clears contamination and adds a passport stamp.
