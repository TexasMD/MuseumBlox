# MuseumBlox Project Handoff

## Current Working Folder

This project should be worked from:

```text
C:\Users\sethm\RB\MOBI
```

The earlier staging location was:

```text
C:\codex_work\projects\museum-of-bad-ideas
```

The `RB\MOBI` folder now contains the same core project materials and is connected to the GitHub repository.

## GitHub Repository

```text
https://github.com/TexasMD/MuseumBlox
```

Current branch:

```text
main
```

Known commits:

```text
580a264 Initial Roblox prototype scaffold
7ff0e9e Add game design overview
```

## Project Concept

MuseumBlox / Museum of Bad Ideas is a Roblox comedy exploration game set inside a surreal museum that preserves terrible concepts with excessive institutional seriousness.

Players explore exhibits, trigger absurd consequences, collect passport stamps, complete short quests, and become increasingly entangled in the museum bureaucracy.

Tone:

- deadpan
- surreal
- bureaucratic
- family-friendly
- self-aware
- strange but coherent

## Core Prototype Loop

```text
Spawn
-> Get Bad Idea Passport
-> Sign Liability Waiver
-> Receive Pocket Protector Required status
-> Visit Bureaucracy Clerk
-> Trigger Pun Exposure
-> Use Sanitation Booth
-> Earn Pun Hazard Cleared stamp
```

## Important Files

```text
README.md
default.project.json
docs\MVP_PLAN.md
docs\GAME_DESIGN_OVERVIEW.md
docs\PROJECT_HANDOFF.md
src\ServerScriptService\PrototypeInteractionService.server.lua
```

## Roblox Studio Setup

In Roblox Studio:

1. Create or open the place named `Museum of Bad Ideas` or `MuseumBlox`.
2. Enable these panels:
   - Explorer
   - Properties
   - Output
3. Create the basic Workspace structure:

```text
Workspace
  Museum
    Lobby
    Wings
    NPCs
    Interactables
    SpawnPoints
```

4. Add these Parts under:

```text
Workspace > Museum > Interactables
```

Required Part names:

```text
PassportKiosk
WaiverKiosk
BureaucracyClerk
PunPlaque
SanitationBooth
```

5. Add a `ProximityPrompt` inside each required Part.
6. Copy or sync this script into `ServerScriptService`:

```text
src\ServerScriptService\PrototypeInteractionService.server.lua
```

7. Press Play and check the Output panel for prototype messages.

## Codex Roblox MCP Setup

Roblox installed this local MCP launcher:

```text
C:\Users\sethm\AppData\Local\Roblox\mcp.bat
```

The Codex config block is:

```toml
[mcp_servers.Roblox_Studio]
command = "cmd.exe"
args = ["/c", 'C:\Users\sethm\AppData\Local\Roblox\mcp.bat']
startup_timeout_sec = 120
```

This command starts the Roblox Studio MCP bridge:

```cmd
cmd.exe /c "%LOCALAPPDATA%\Roblox\mcp.bat"
```

Normally, Codex should launch it automatically after the MCP server is configured and Codex is restarted.

## Codex Project Configuration

The intended Codex project path is:

```text
C:\Users\sethm\RB\MOBI
```

The Codex config was updated to trust this path and include it as writable:

```toml
[sandbox_workspace_write]
writable_roots = ["C:/codex_work", "C:/Users/sethm/RB/MOBI"]

[projects.'C:\Users\sethm\RB\MOBI']
trust_level = "trusted"
```

If the current Codex thread is still rooted elsewhere, open or add this folder as a Codex project and start a new thread from it.

## Recommended Next Build Tasks

1. Open the `RB\MOBI` folder as the active Codex project.
2. Open Roblox Studio and create the basic blockout.
3. Add the five named interactable Parts.
4. Add `ProximityPrompt` objects.
5. Copy/sync the prototype service into `ServerScriptService`.
6. Playtest the first loop.
7. Replace Output-only feedback with simple UI.
8. Add visible passport/status UI.
9. Add room signage and first museum announcements.
10. Expand to Chinchilla Habitat after the first loop works.

## Design Source Of Truth

Use these files as the main design references:

```text
docs\GAME_DESIGN_OVERVIEW.md
docs\MVP_PLAN.md
```

The first milestone is a rough playable prototype. Do not start with all rooms, cosmetics, monetization, or live events.
