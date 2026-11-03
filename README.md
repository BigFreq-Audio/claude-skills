<p align="center">
  <img src="banner.png" alt="BigFreq Skills: free Claude skills by BigFreq Audio" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/skills-1-2f81f7?style=flat-square" alt="1 skill">
  <img src="https://img.shields.io/badge/license-MIT-3fb950?style=flat-square" alt="MIT license">
  <img src="https://img.shields.io/badge/works%20with-Claude-e3b341?style=flat-square" alt="Works with Claude">
</p>

## Project Plan and Execute

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

---

Inspired by the spec-first workflow in [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills). Not affiliated with Addy Osmani or Anthropic.
