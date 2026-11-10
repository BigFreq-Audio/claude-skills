---
name: recall
description: Continues work in a fresh session from the latest handoff written by /capture, or answers what was decided from the Obsidian vault. Use when the user types /recall, says pickup, or asks to check the vault or what was decided.
---

# Recall

Part of Living Brain, an original BigFreq workflow. The loop is three commands: `/capture` saves the chat and writes the handoff, `/clear` (built in) empties the chat, `/recall` picks the work up again.

This skill has two actions:

- **Pickup:** `/recall` on its own, or "pickup". Continues the last session's work.
- **Lookup:** `/recall <question>`, or "check the vault: ...". Answers from the vault.

If this skill still shows `<VAULT_PATH>` or `<CLOUD_FOLDER>`, stop and point the user to the capture skill's `SETUP.md`.

## Settings

- Vault: `<VAULT_PATH>`
- Captures folder: `00 Inbox/Captures/`
- Cloud drop folder: `<CLOUD_FOLDER>` (optional)

If the vault's own rules file (`CLAUDE.md` or `AGENTS.md`) sets different folders or rules, follow the vault.

## Pickup

Continues the previous session's work with the smallest possible context. Only the newest handoff counts: it is the current state, and older captures are history.

1. Read `HANDOFF.md` in the project root. If it isn't there, use the newest capture with a `## Handoff` section in the captures folder or cloud drop folder.
2. If no handoff is found, say so in one line and ask what to work on. Don't scan the project to rebuild it.
3. Confirm in 3 lines max: the goal, the current version and the next step.
4. Start on the next step right away, unless an open question blocks it.

For the rest of the session:

- Treat "Decisions" as settled. Don't reopen them unless the user asks.
- Don't retry anything under "Tried and failed".
- Read only the files the current step needs. No full-project scans.
- Summarize long logs and file contents in one line instead of pasting them.
- At a natural breakpoint (a build passes, a version ships, the task changes, or the context gets large), remind the user to run `/capture`, then `/clear`, then `/recall`.

## Lookup

Runs when the user asks what was decided or asks you to check the vault.

1. Read the vault index, then the relevant notes.
2. Include unfiled files in the captures folder, because the index doesn't list them yet. When captures on the same project disagree, the newest wins; say what it replaced.
3. Answer with links to the notes, and separate what was decided from what is still open.

If nothing is found, say so.
