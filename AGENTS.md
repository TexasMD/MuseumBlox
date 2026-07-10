# MuseumBlox Agent Instructions

This repo contains the Roblox prototype for Museum of Bad Ideas.

## Source Of Truth

- Work from `C:\Users\sethm\RB\MOBI` for local Windows development.
- GitHub remote: `https://github.com/TexasMD/MuseumBlox`.
- Treat GitHub PRs as the handoff surface between Jules, Codex, and any other agent.
- Treat `src/` and `default.project.json` as the source-controlled Roblox source. Persistent gameplay logic should live in the repo, not only inside a local Studio place.

## Project Shape

- `default.project.json` is the Rojo project file.
- `rokit.toml` pins Rojo through Rokit.
- `src/server` maps to `ServerScriptService`.
- `src/client` maps to `StarterPlayer.StarterPlayerScripts`.
- `src/shared` maps to `ReplicatedStorage.Shared`.
- `src/workspace` maps to `Workspace`.
- Design and implementation context lives in `docs/`.

## Validation

Run the narrowest relevant validation before finishing changes.

Preferred local checks:

```bash
rokit install
rojo build -o "roblox.rbxlx"
```

On this Windows machine, if `rojo` is not on `PATH`, use:

```powershell
& 'C:\Users\sethm\.rokit\bin\rojo.exe' build -o "$env:TEMP\museum-of-bad-ideas-test.rbxlx"
```

Jules runs on Linux and cannot open the user's local Roblox Studio session. Jules should still run repo-level checks when possible, especially `rojo build`, but Studio playtesting must be done locally through Roblox Studio.

## Collaboration Rules

- Keep changes small and reviewable.
- Prefer improving the first playable vertical slice over adding broad future systems.
- Preserve the current architecture unless a change clearly supports the MVP.
- Do not manually add production-only RemoteEvents in Studio without also reflecting the ownership pattern in source.
- Server code owns quest, stamp, and status-effect truth. Clients render state and request actions.
- If a task requires Studio objects, document the required `Workspace` paths and expected instance names.
- If a task changes behavior, include a short manual playtest checklist.

## Current MVP Interactables

The prototype currently expects:

```text
Workspace
  Museum
    Interactables
      PassportKiosk
      WaiverKiosk
      BureaucracyClerk
      PunPlaque
      SanitationBooth
```

Each interactable Part should contain a `ProximityPrompt`.

## Useful Docs

- `README.md` for the quick project overview.
- `docs/PROJECT_HANDOFF.md` for local setup and current status.
- `docs/TECHNICAL_ARCHITECTURE.md` for Rojo mapping and target architecture.
- `docs/AI_WORKFLOW.md` for the Jules, GitHub, Codex, and Roblox Studio workflow.
