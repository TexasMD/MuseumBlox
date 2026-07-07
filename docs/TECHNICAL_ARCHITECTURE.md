# Technical Architecture

This document incorporates the external technical handoff from:

```text
C:\Users\sethm\.gemini\antigravity\brain\63945e90-4880-4762-90dd-5fa2148bd3bf\handoff_document.md
```

## Toolchain

The intended Roblox toolchain is:

- Rokit for tool management
- Rojo `7.6.1` for syncing source files into Roblox Studio
- Roblox Studio for playtesting, place editing, and publishing

Use Rojo from the project root:

```bash
rojo serve
```

Build a place file with:

```bash
rojo build -o "roblox.rbxlx"
```

## Rojo Mapping

`default.project.json` maps the project into the Roblox DataModel:

```text
src/server    -> ServerScriptService
src/client    -> StarterPlayer.StarterPlayerScripts
src/shared    -> ReplicatedStorage.Shared
src/workspace -> Workspace
```

`ReplicatedStorage.Remotes` is created as a folder. The longer-term architecture should generate or validate remotes from server init code rather than relying on manual Studio creation.

## Current Implementation State

The repo currently contains a deliberately simple prototype service:

```text
src/server/PrototypeInteractionService.server.lua
```

It expects these Workspace objects:

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

Each interactable Part must contain a `ProximityPrompt`.

The script manages early state with player attributes:

- `HasBadIdeaPassport`
- `PocketProtectorRequired`
- `PunContaminated`
- `CurrentQuest`
- `PassportStamps`

This is acceptable for the first vertical slice. It should be split into services after the basic Studio loop is proven.

## Target Framework Shape

The target architecture is a lightweight custom singleton pattern similar to Knit.

Server and client should each have an entry point:

```text
src/server/init.server.luau
src/client/init.client.luau
```

Startup should follow three phases:

1. Require all services/controllers.
2. Call `:Init()` on each module in deterministic order.
3. Start runtime behavior after dependencies and remotes exist.

Avoid hidden initialization side effects in modules. Require-time should define objects; `:Init()` should connect signals and allocate state.

## Planned Server Services

### DataService

Owns player session data, loading, defaults, dirty state, and save boundaries.

### PassportService

Owns passport stamps and progression. It should expose methods such as:

```lua
PassportService:AddStamp(player, stampId)
PassportService:HasStamp(player, stampId)
```

### QuestService

Tracks active and completed quests. It should validate objective progress rather than trusting clients.

Example objective types:

- `Talk`
- `Interact`
- `CollectSignatures`
- `Sanitize`

### DialogueService

Owns server-side dialogue validation and action dispatch. Dialogue choices can route to another node or trigger actions such as `GrantPassport`, `CollectSignature`, or `StartQuest`.

### StatusEffectService

Applies timed or persistent effects such as:

- `PocketProtector`
- `PunContaminated`
- `AdministrativelyDamp`
- `Metamorphosis`

The server owns truth. Clients render visuals from replicated updates.

### ChinchillaService

Owns Chinchilla Habitat behavior, including event start/stop, calming logic, and reward criteria.

## Planned Client Controllers

### ClientPassportController

Renders the player's passport, collected stamps, missing stamps, titles, and related progression.

### ClientQuestController

Renders active objectives and reacts to quest state updates.

### ClientDialogueController

Renders dialogue nodes and sends selected choices to the server.

### ClientEffectsController

Renders local visuals for status effects, such as glow, screen tint, particles, or movement feedback.

### ClientNewsTickerController

Displays rotating museum announcements and satirical alert text.

## Shared Definitions

Content should move toward declarative shared definitions in `src/shared`.

Recommended files:

```text
DialogueDefinitions.luau
QuestDefinitions.luau
StatusEffectDefinitions.luau
PassportDefinitions.luau
BadgeDefinitions.luau
ItemDefinitions.luau
```

Definitions should be stable content data. Services own validation and mutation.

## Workspace Integration

Workspace interactables should be managed through Rojo where practical. Server scripts can be colocated with specific workspace objects when they are tightly bound to a physical exhibit.

Expected interactables over time:

- `WaiverKiosk`
- `MetamorphosisBed`
- `Stapler`
- `BreadMoldCase`
- `ChinchillaHabitat`
- `LivingPaintingGallery`
- `ClosedWindow`

For MVP, keep the five basic interactables from the prototype loop.

## Development Rules

- Do not manually create production RemoteEvents in Studio. Define them in source or have server init create/validate them.
- Keep the server authoritative for quests, stamps, and status effects.
- Keep definitions declarative and side-effect free.
- Prefer small services/controllers over one large script once the MVP loop works.
- Keep the first prototype playable before adding architecture layers.
- Expand the codebase only when the prototype behavior demands it.

