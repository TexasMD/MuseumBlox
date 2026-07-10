# Museum of Bad Ideas

Roblox prototype for a surreal comedy museum where bad ideas are preserved, regulated, stamped, sanitized, and occasionally negotiated with.

## Current Goal

Build a small playable vertical slice before expanding the full museum.

Initial loop:

1. Spawn in the Grand Lobby.
2. Get a Bad Idea Passport.
3. Sign an absurd liability waiver.
4. Receive a temporary status effect.
5. Visit the Bureaucracy Wing.
6. Trigger pun exposure.
7. Sanitize and earn a stamp.

## Repository Layout

```text
docs/
  GAME_DESIGN_OVERVIEW.md
  MVP_PLAN.md
  PROJECT_HANDOFF.md
  TECHNICAL_ARCHITECTURE.md
src/
  client/
  server/
    PrototypeInteractionService.server.lua
  shared/
  workspace/
default.project.json
rokit.toml
```

## Toolchain

The intended source workflow uses Rokit and Rojo:

```bash
rojo serve
```

Build a place file with:

```bash
rojo build -o "roblox.rbxlx"
```

`default.project.json` maps `src/server`, `src/client`, `src/shared`, and `src/workspace` into the Roblox DataModel.

## Roblox Studio Workflow

1. Open Roblox Studio.
2. Create or open the `Museum of Bad Ideas` place.
3. Build the prototype rooms with simple placeholder parts.
4. Add Parts named:
   - `PassportKiosk`
   - `WaiverKiosk`
   - `BureaucracyClerk`
   - `PunPlaque`
   - `SanitationBooth`
5. Put those Parts under `Workspace > Museum > Interactables`.
6. Add a `ProximityPrompt` to each Part.
7. Copy or sync `src/server/PrototypeInteractionService.server.lua` into `ServerScriptService`.
8. Press Play and verify the Output messages and player attributes.

## Notes

The first prototype should be rough and playable. Visual polish, cosmetics, badges, monetization, and additional wings come after the core interaction loop works.

## AI Workflow

For the recommended Jules, GitHub, Codex, and Roblox Studio MCP workflow, see `docs/AI_WORKFLOW.md`.
