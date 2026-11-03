# Claude Skills by BigFreq Audio

Free Claude skills, shared under the MIT License.

## Project Plan and Execute

Runs a whole project from your notes to final sign-off: software, marketing, web design, content or operations. It also works on projects already underway.

1. **Take in context:** lists what's known, missing or conflicting
2. **Interview:** asks one question at a time. You confirm.
3. **Spec:** defines the goal, deliverables and boundaries. You approve.
4. **Plan:** breaks the work into small, checkable tasks. You approve.
5. **Build:** completes one task at a time
6. **Challenge:** sends high-stakes decisions to a fresh agent
7. **QA test:** uses a method that fits the project
8. **Confirm:** shows what passed and what wasn't tested. You sign off.

The plan and progress live in project files, so a new chat can pick up where the last one stopped.

### Install

**With the skills CLI:**

```
npx skills add BigFreq-Audio/claude-skills --skill project-plan-and-execute
```

**In Claude Code, manually:** save [SKILL.md](skills/project-plan-and-execute/SKILL.md) to `~/.claude/skills/project-plan-and-execute/SKILL.md`.

**In the Claude app:** put `SKILL.md` in a folder named `project-plan-and-execute` and zip the folder. Go to Customize > Skills, click +, choose Create skill, then Upload a skill.

### Use it

```
Use project-plan-and-execute. New project: [name]. Here's what I have: [notes or files]
```

Inspired by the spec-first workflow in [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills). Not affiliated with Addy Osmani or Anthropic.
