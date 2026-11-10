<p align="center">
  <img src="banner.png" alt="BigFreq Skills: free Claude skills by BigFreq Audio" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/skills-3-2f81f7?style=flat-square" alt="3 skills">
  <img src="https://img.shields.io/badge/license-MIT-3fb950?style=flat-square" alt="MIT license">
  <img src="https://img.shields.io/badge/works%20with-Claude-e3b341?style=flat-square" alt="Works with Claude">
</p>

## Skills

1. 🗂️ [Project Plan and Execute](#1-%EF%B8%8F-project-plan-and-execute)
2. 🧠 [Living Brain](#2--living-brain)

## 1. 🗂️ Project Plan and Execute

Runs a whole project from your notes to final sign-off: software, marketing, web design, content or operations. It also works on projects already underway.

<p align="center">
  <img src="stages.png" alt="Eight stages: take in context, interview, spec, plan, build, challenge, QA test, confirm. You confirm the interview, approve the spec and plan, and sign off at the end." width="100%">
</p>

The plan and progress live in project files, so a new chat can pick up where the last one stopped.

## Install

**With the skills CLI**

```
npx skills add BigFreq-Audio/claude-skills --skill project-plan-and-execute
```

**In Claude Code, manually**

Save [SKILL.md](skills/project-plan-and-execute/SKILL.md) to `~/.claude/skills/project-plan-and-execute/SKILL.md`.

**In the Claude app**

Put `SKILL.md` in a folder named `project-plan-and-execute` and zip the folder. Go to Customize > Skills, click +, choose Create skill, then Upload a skill.

## Use it

```
Use project-plan-and-execute. New project: [name]. Here's what I have: [notes or files]
```

## 2. 🧠 Living Brain

An original BigFreq workflow that turns your second brain into a living brain. Your decisions, finished work and open questions move from Claude chats into your Obsidian vault as you work, then become part of the wiki.

Living Brain is two skills, `capture` and `recall`, run as a three-command loop:

```
/capture   save this chat and write the handoff
/clear     empty the chat (built in)
/recall    pick the work up where it stopped
```

<p align="center">
  <img src="living-brain-stages.png" alt="The Living Brain stages: capture, collect, process, update, flag, tidy, recall. You run capture and process, decide on conflicts, and run the tidy step." width="100%">
</p>

A second brain only grows when you stop to feed it. Living Brain makes that one short command, so the thinking you do in chats keeps building your notes instead of disappearing into chat history. The handoff means a fresh chat starts with only what it needs, instead of a long, slow context.

### How it works

1. **Capture.** Type `/capture` at the end of a chat, or at any useful point in it. Claude writes a short note with what you decided, what you rejected and why, what you finished, what is still open, and anything worth keeping as a wiki page. It also writes a handoff: the current state of the work in under 1500 tokens.
2. **Clear and recall.** Run `/clear`, then `/recall`. Claude reads the newest handoff, confirms the goal and next step in three lines, and carries on, without retrying what already failed or reopening settled decisions.
3. **Collect.** On the computer with your vault, the note lands in `00 Inbox/Captures/` straight away. On a second computer, it waits in a private cloud folder until a scheduled task brings it in, hourly by default.
4. **Process.** Say "process captures" whenever you are ready. Claude groups the captures by project and lets the newest win inside each group, so a decision that was later replaced is filed as history, not as current.
5. **Update.** Claude improves the notes you already have, one pass per project, instead of leaving isolated pages. It adds links and updates your index and log.
6. **Flag.** If captures disagree with each other or with something settled, Claude records the conflict and asks you. It never overwrites settled knowledge, and it never changes your rules, SOPs or skills without your approval.
7. **Tidy.** Double-click `FILE-CAPTURES.bat`. It moves processed captures into a hidden `.sources/` folder, so your inbox is empty and the originals stay available to check.
8. **Look it up.** Ask `/recall what did we decide about X?` Claude answers from your notes and includes captures you haven't processed yet.

### What gets saved

Only your decisions, finished work, open items, reusable answers and the handoff.

Living Brain never saves sensitive information or full chat transcripts.

You choose what enters your vault, because a note is only written when you run the command.

### Install

Install both skills.

**With the skills CLI**

```
npx skills add BigFreq-Audio/claude-skills --skill capture
npx skills add BigFreq-Audio/claude-skills --skill recall
```

**In Claude Code, manually**

Save the [capture](skills/capture) and [recall](skills/recall) folders to `~/.claude/skills/capture/` and `~/.claude/skills/recall/`.

**In the Claude app**

Zip the `capture` folder and the `recall` folder separately. Go to Customize > Skills, click +, choose Create skill, then Upload a skill, once for each.

**Upgrading from living-brain:** remove the old `living-brain` skill after installing both, so only one skill answers each command. Your vault and captures work as they are.

### Set it up

You need an Obsidian vault with an index note and a log note. The `.bat` helper is for Windows.

1. Add your vault path to both `SKILL.md` files. The skills stop and ask until this is done.
2. Create `00 Inbox/Captures/` and `.sources/ledger.csv` in your vault.
3. Copy `FILE-CAPTURES.bat` and `file-captures.ps1` to a `.tools/` folder in your vault.
4. Add your lanes and the capture rule to your vault's `CLAUDE.md`.
5. Using a second computer? Set up the cloud folder and scheduled task.

[SETUP.md](skills/capture/SETUP.md) walks through every step.

### Use it

```
/capture
/capture the launch decisions
/clear
/recall
/recall what did we decide about the launch date?
process captures
```

---

Project Plan and Execute is inspired by the spec-first workflow in [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills). Living Brain is an original BigFreq workflow, built on ideas from [Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f). Not affiliated with Addy Osmani, Andrej Karpathy, Obsidian or Anthropic.
