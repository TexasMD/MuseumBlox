# Museum of Bad Ideas: Game Design Overview

## Project Goal

Museum of Bad Ideas is a Roblox comedy exploration game set inside a surreal museum that preserves terrible concepts with excessive institutional seriousness. The goal is to create a playable social experience where players explore exhibits, trigger absurd consequences, collect stamps, complete short quests, and gradually become part of the museum's strange bureaucracy.

The game should feel like a formal museum, a malfunctioning government office, and an interactive comedy sketch all operating under the same rulebook. The humor should come from systems, signage, NPC behavior, fake procedures, and player curiosity rather than long exposition alone.

## Creative Direction

The museum treats bad ideas as important cultural artifacts. Every exhibit has procedures, warnings, forms, stamps, and consequences. The tone is deadpan, bureaucratic, surreal, family-friendly, and self-aware.

Core creative principles:

- Treat nonsense as official policy.
- Let jokes escalate through mechanics.
- Reward players for touching, reading, testing, and disobeying things.
- Keep the humor strange but coherent.
- Avoid crude, mean-spirited, or exclusionary comedy.
- Make each room understandable quickly, even if it contains deeper jokes.

## Player Fantasy

Players are visitors who slowly become entangled in the museum's procedures. They start as ordinary guests, receive a Bad Idea Passport, sign forms they should not sign, survive exhibit consequences, collect official stamps, and earn increasingly ridiculous titles.

The intended player reaction is:

- "What happens if I press this?"
- "Why is there a form for that?"
- "That consequence was my fault, but also clearly policy."
- "I want to show this room to someone else."

## Core Gameplay Loop

1. Enter a museum room or wing.
2. Notice an exhibit, sign, NPC, kiosk, or suspicious object.
3. Interact with it using a ProximityPrompt.
4. Trigger a comedic consequence, quest step, status effect, or event.
5. Resolve the problem through another absurd interaction.
6. Earn a passport stamp, title, badge, or cosmetic.
7. Return to the lobby or continue into another wing.

The loop should be short, readable, and repeatable. A player should encounter something funny within the first minute.

## Main Progression Systems

### Bad Idea Passport

The passport is the central progress tracker. Each major exhibit awards a stamp when the player completes its core interaction or quest.

Example stamps:

- Waiver Signed Under Duress
- Petition Mishandled Properly
- Pun Hazard Cleared
- Chinchilla Incident Logged
- Spore Treaty Signed
- Metamorphosis Logged
- Not Nabokov
- Comedy Audit Completed

### Absurd Titles

Players unlock display titles that reflect their museum status.

Example titles:

- Temporary Visitor
- Assistant Visitor
- Person of Mild Concern
- Certified Bad Idea Handler
- Pun Hazard Survivor
- Acting Assistant Deputy Curator
- Legally Not the Exhibit

### Status Effects

Status effects are temporary consequences that create jokes and quest hooks.

Examples:

- Pocket Protector Required
- Pun Contaminated
- Administratively Damp
- Beetle Pending
- Potential Nabokov
- Legally Furniture
- Sanitization Required

### Quests

Quests should be short, state-aware, and intentionally bureaucratic. Most should involve 2-4 steps, not long fetch chains.

Example quest:

1. Sign a waiver.
2. Receive an unwanted requirement.
3. Visit the Bureaucracy Wing to appeal.
4. Submit the wrong form to the wrong clerk.
5. Receive a stamp because the mistake was filed correctly.

## Proposed Rooms and Wings

## Architecture and Environment

The museum is housed in a bold, strong, and heroic multi-level building.
- **Exterior:** The exterior features a curvy, whimsical, and fluid blob-like architecture, avoiding simple cubes and rectangles. It is designed to be captivating from the outside, accessible via one main entrance and one secondary entrance.
- **Interior:** The interior follows a contemporary museum layout across two main floors, featuring a grand central atrium and approximately 20 rooms of varying sizes. The walls display numerous procedural paintings in different sizes and styles.
- **Navigation:** The entire building, including all passageways, doorways, and stairs, is designed for smooth player navigation.
- **Landscaping:** The surrounding grounds feature lush grass and winding cobblestone paths that complement the organic, flowing design of the exterior architecture.

## Wings and Exhibits

### Grand Lobby of Poor Decisions

The lobby is the player's first impression and central hub.

Purpose:

- Establish the museum premise.
- Give the player the Bad Idea Passport.
- Introduce deadpan signage and announcements.
- Route players to the first major interactions.

Key elements:

- Giant "WELCOME TO THE MUSEUM OF BAD IDEAS" banner.
- Front desk NPC who is polite but unhelpful.
- Passport kiosk.
- Donor plaques with ridiculous names.
- Contradictory directional signs.
- Queue ropes that do not lead anywhere useful.
- Announcement system with calm but alarming messages.

Prototype gameplay:

- Player talks to the clerk.
- Player receives passport.
- Player is directed to the waiver kiosk.

### Hall of Absurd Liability

This wing turns fake legal agreements into real gameplay consequences.

Purpose:

- Teach players that interactions can have strange effects.
- Start the first quest chain.
- Introduce the museum's legal/bureaucratic tone.

Key elements:

- Liability waiver kiosk.
- Oversized terms and conditions display.
- "Agree" button that is much more visible than "Read First."
- Signs warning that the museum is not responsible for ideas that follow visitors home.

Prototype gameplay:

- Player signs waiver.
- Player receives `PocketProtectorRequired`.
- Player earns stamp: `Waiver Signed Under Duress`.
- Player is sent to the Bureaucracy Wing to appeal.

### Kafkaesque Bureaucracy Department

This wing is a government-office parody inside the museum.

Purpose:

- Convert problems into paperwork.
- Create short circular quest chains.
- Make the museum feel like it has internal rules, even when those rules are absurd.

Key elements:

- Filing cabinets.
- Queue ropes.
- Ticket machine reading "Now Serving: Yesterday."
- Windows labeled Information, Misinformation, Pre-Information, and Post-Information.
- Doors labeled Exit Pending Review and Department of Redundant Departments.
- Bureaucracy Clerk NPC.

Prototype gameplay:

- Player asks to remove the pocket protector requirement.
- Clerk explains that the appeal requires a petition authorizing the petition.
- Player receives a quest objective.
- Wrong submissions may still be accepted if filed in the correct wrong place.

### Pun Sanitation Chamber

This room treats bad puns as hazardous contamination.

Purpose:

- Create a clear cause-and-effect comedy event.
- Introduce status cleanup.
- Add sound, light, and visual feedback.

Key elements:

- Pun plaque.
- Contamination alarm.
- Decontamination booth.
- Sanitizer levers.
- Incident report station.

Prototype gameplay:

- Player reads a pun plaque.
- Player receives `PunContaminated`.
- Alarm message appears: "PUN EXPOSURE DETECTED."
- Player uses the sanitation booth.
- Player clears the status and earns stamp: `Pun Hazard Cleared`.

### Chinchilla Overreaction Habitat

A contained exhibit where adorable chinchillas behave with excessive procedural aggression.

Purpose:

- Add physical comedy and light movement gameplay.
- Create a memorable optional event.
- Provide an early social moment for groups of players.

Key elements:

- Glass habitat.
- Warning signs.
- Tiny complaint forms.
- Soft blankets or snacks used to calm the habitat.

Gameplay:

- Player enters or approaches the habitat.
- Chinchillas swarm in a harmless slapstick way.
- Player calms them using a small task.
- Player earns stamp: `Fluff Containment Maintained`.

### Sentient Bread Mold Exhibit

A mold colony on bread has become politically aware and wants recognition.

Purpose:

- Add negotiation-based comedy.
- Introduce a non-hostile NPC/object interaction.
- Support longer dialogue and branching choices.

Key elements:

- Display case with old bread.
- Tiny office furniture.
- Protest signs.
- Glowing mold eyes or speech bubbles.
- Janitor NPC who may try to discard the exhibit.

Gameplay:

- Player speaks with the mold.
- Player retrieves a petition, microphone, or humidity permit.
- Player helps classify the mold as Food, Exhibit, Staff, or Threat.
- Player earns stamp: `Spore Treaty Signed`.

### Metamorphosis Exhibit

A bedroom exhibit that temporarily transforms the player into a beetle-like version of themselves.

Purpose:

- Create a visually memorable transformation.
- Add movement variation.
- Use literary parody without requiring players to know the source.

Key elements:

- Museum bedroom display.
- Bed interaction.
- Low camera/movement mode.
- Small beetle-only crawlspace.
- Species Reconsideration Form.

Gameplay:

- Player lies on the bed.
- Screen briefly fades.
- Player receives `BeetlePending` or beetle movement.
- Player files paperwork to restore normal status.
- Player earns stamp: `Metamorphosis Logged`.

### Security Office / Wanted Author Posters

A running-gag wing where security is searching for Nabokov for unclear literary reasons.

Purpose:

- Add recurring worldbuilding.
- Create identity confusion and clearance mechanics.
- Provide a lightweight collectible/cosmetic path.

Key elements:

- Wanted posters.
- Butterfly net props.
- Security NPC.
- "Not Nabokov" clearance station.

Gameplay:

- Player is accused of being suspiciously literary.
- Player retrieves or earns a fake clearance.
- Player earns stamp: `Not Nabokov`.

### Mistaken Identity Gallery

NPCs confuse the player for employees, exhibits, maintenance problems, or other NPCs.

Purpose:

- Generate short comedy quests.
- Support replayable dialogue.
- Add fourth-wall jokes without breaking the game world completely.

Key elements:

- NPCs with mistaken-identity dialogue.
- Sysadmin or museum tech support NPC.
- "Hello, My Name Is Someone Else" sticker.

Gameplay:

- NPC assigns the player the wrong role.
- Player resolves or worsens the confusion.
- One NPC reports that they believe they are a real player.
- Player earns stamp: `Identity Temporarily Resolved`.

### Rehearsal Theater

NPCs forget lines, reset scenes, and treat the exhibit as a staged production.

Purpose:

- Add repeatable scene variation.
- Let players trigger escalating dialogue.
- Create a room that rewards repeated interaction.

Key elements:

- Stage.
- Clapperboard prompt.
- NPC actors.
- Script pages.
- Backstage area.

Gameplay:

- Player triggers a scene.
- NPCs forget lines.
- Player restarts the take.
- Each restart changes the scene.
- Player earns stamp: `Continuity Error Preserved`.

### Land of No Longer Acceptable Jokes

A museum wing for stale, retired, or lazy joke formats. It should not display offensive jokes; it should satirize weak joke machinery.

Purpose:

- Comment on comedy without reproducing harmful content.
- Create sorting or cleanup gameplay.
- Reinforce the museum's preservation-and-sanitization theme.

Key elements:

- Broken punchline machines.
- Redacted plaques.
- Cliche recycling bin.
- Laugh track disposal unit.
- Comedy audit desk.

Gameplay:

- Player sorts joke artifacts into harmless, lazy, needs context, please retire, or requires gloves.
- Player repairs a joke machine that only prints apology forms.
- Player earns stamp: `Comedy Audit Completed`.

### Living Painting Gallery

Paintings leak, steam, argue, or contain miniature worlds.

Purpose:

- Add visual spectacle.
- Provide environmental event gameplay.
- Expand the museum beyond bureaucracy into surreal exhibit spaces.

Key elements:

- Leaking waterfall painting.
- Tiny biplane painting.
- Painting frames with interactable portals or effects.
- Maintenance signs.

Gameplay:

- Player handles a painting malfunction.
- Player collects repair approval or hazard signage.
- Player earns a painting-related stamp.

### Spaghetti Exhibit

A room where spaghetti can mean pasta, code, policy, or hallway layout.

Purpose:

- Build a navigational joke into the environment.
- Support maze-like but short gameplay.
- Connect food, programming, and bureaucracy jokes.

Key elements:

- Tangled corridors.
- Pasta signage.
- Code warning plaques.
- Policy documents shaped like noodles.

Gameplay:

- Player untangles a route or files a spaghetti classification form.
- Player learns that the hallway is not badly designed; it is officially al dente.

## MVP Scope

The first playable version should include only:

- Grand Lobby
- Hall of Absurd Liability
- Bureaucracy Wing
- Pun Sanitation Chamber
- Basic passport state
- Basic status effects
- Basic ProximityPrompt interactions
- Debug output before polished UI

MVP success criteria:

- Player can complete the first loop.
- Player gets at least two stamps.
- Player experiences at least three humorous consequences.
- The prototype can be tested in Roblox Studio without additional services.

## Longer-Term Scope

After the MVP loop works, expand in this order:

1. Add better UI for passport, quest, and status effects.
2. Add Chinchilla Habitat as the first physical event room.
3. Add Bread Mold Exhibit for dialogue/quest depth.
4. Add Metamorphosis Exhibit for transformation gameplay.
5. Add Security Office and Mistaken Identity Gallery for running jokes.
6. Add Theater, Comedy Audit, Living Painting, and Spaghetti rooms.
7. Add cosmetics, titles, badge integration, sound, and live events.

## Implementation Priorities

Highest priority:

- Playable interaction loop.
- Clear object names and hierarchy.
- Simple state attributes.
- Funny feedback in Output/temporary UI.
- Readable code that can be debugged inside Roblox Studio.

Medium priority:

- Passport UI.
- Quest UI.
- Dialogue tables.
- Basic sounds.
- Visual status effects.
- Room-specific props and signs.

Later priority:

- Persistent player data.
- Badge service integration.
- Monetization.
- Live events.
- Complex animations.
- Advanced NPC behavior.

## Safety and Content Guardrails

The game should remain family-friendly and Roblox-appropriate.

Avoid:

- Realistic violence.
- Crude sexual content.
- Hate, harassment, or protected-class jokes.
- Offensive joke reproduction in the retired-jokes wing.
- Gambling mechanics.
- Pay-to-win monetization.
- Dark patterns aimed at young players.

Prefer:

- Slapstick consequences.
- Bureaucratic absurdity.
- Visual comedy.
- Clear opt-in interactions.
- Short readable text.
- Non-punitive failure.
