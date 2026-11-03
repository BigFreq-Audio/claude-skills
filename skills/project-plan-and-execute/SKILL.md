---
name: "project-plan-and-execute"
description: "Use to run any project end to end, new or already underway, including software, marketing and web design: take in context, interview the user, spec, plan, build task by task, challenge, QA and sign off."
---

# Project Plan and Execute

Run any project through eight stages in order: software, marketing campaigns, web design, content or operations. Never skip a stage or an approval stop unless the user says to. This skill is self-contained. Where `writing-plans`, `executing-plans` or `verification-before-completion` are available, use them for that stage. Otherwise follow the instructions here.

## Start or resume

Check the project for `STATE.md`.

- If it exists, read `STATE.md`, `SPEC.md`, `PLAN.md` and `DECISIONS.md`. Tell the user the current stage and next task in two lines, then continue from there.
- If it does not exist and the project is already underway, start at Stage 1 in existing-project mode.
- If it does not exist and the project is new, start at Stage 1.

## Project files

Keep these with the project:

- `CONTEXT.md`: what the user supplied, what is missing, and conflicts
- `SPEC.md`: the approved definition of the project
- `PLAN.md`: ordered tasks with acceptance criteria
- `STATE.md`: current stage, last finished task, next task, blockers
- `DECISIONS.md`: dated decisions with the reason for each
- `QA-REPORT.md`: what was tested, how, and the results

Update `STATE.md` after every finished task or stage, so a new session can resume with no chat history.

In an existing project, do not overwrite, move or rename existing files. Add these files alongside them. If a file with the same name already exists, ask the user how to handle it.

## Stage 1: Take in context

1. Ask the user to share everything relevant: briefs, files, links, notes and past decisions.
2. Read all of it.
3. Write `CONTEXT.md` with three sections: Known, Missing, Conflicts.
4. Where sources conflict, treat the newest explicit decision as current and list the conflict for the user to confirm.

In existing-project mode, the user may say the context is already there, so find it yourself in the project files, and read what they point to. Check the real current state, such as live data, the code or the working site, rather than trusting older documents. Add a Done so far section to `CONTEXT.md` covering what is finished, in progress, stalled or out of date.

## Stage 2: Interview (always runs)

Ask one question at a time, and wait for each answer. Start with Missing and Conflicts, then cover goals, audience, constraints, deadline, definition of done and what is out of scope. Ask what the user actually wants, not only what they first described. Offer a recommended answer when that helps them decide. Add each answer to `CONTEXT.md`.

In existing-project mode, do not ask what the project files already answer. Focus on gaps, stale decisions, what is blocking progress, and what should change from here.

Continue until no open question would change the scope, or the user says to move on. Then summarise the sharpened context.

**STOP: the user confirms the context is complete.**

## Stage 3: Spec

Write `SPEC.md` with these sections:

- Objective: what this achieves, and for whom
- Success measures: how we will know it worked
- Deliverables: exactly what will exist at the end
- Structure: how the work is organised
- Standards: code style, brand voice, or design system, as relevant
- Testing: how Stage 7 will check it
- Boundaries: always do, ask first, never do
- Out of scope

In existing-project mode, base the spec on the project as it stands. Separate what already exists from what is still to be delivered.

**STOP: the user approves `SPEC.md`.**

## Stage 4: Plan

Turn the approved spec into `PLAN.md`. Each task must be small, independently checkable, and have clear acceptance criteria. Order tasks by dependency. Mark high-stakes tasks: hard to reverse, security or licensing, payments, customer data, live systems, public publishing, or sends to customers.

In existing-project mode, plan forward from the current state. List finished work once as done, and do not plan it again.

**STOP: the user approves `PLAN.md`.**

## Stage 5: Build, one task at a time

For each task:

1. Do only that task.
2. Check it against its acceptance criteria, with evidence.
3. Update `PLAN.md` and `STATE.md`.
4. Log any decision in `DECISIONS.md`.

If a decision changes the scope or the spec, update `SPEC.md` at that moment and tell the user.

Stop and ask the user when a task fails twice, the plan no longer fits, or a step is risky or irreversible. Never publish, send, deploy to live or spend money without the user's explicit approval.

## Stage 6: Challenge high-stakes decisions

For every high-stakes task, at the point of decision and before moving on:

1. State the decision or claim plainly.
2. Give it to a fresh agent, where possible, without your reasoning.
3. Ask it to find what is wrong, missing or unsupported.
4. Reconcile the result: fix real problems and record why others were dismissed.

Log the result in `DECISIONS.md`. Only interrupt the user if it finds a real problem.

## Stage 7: QA test

Pick the methods that fit the project, as set in `SPEC.md`:

- Website or web app: test real user flows in a browser. Check console errors, forms, links, mobile width and key journeys.
- Web design: compare the result with the approved design at desktop, tablet and phone widths. Check layout, images, fonts, contrast, spacing and consistency with the brand.
- Marketing campaign: check every link, offer, price, date and CTA. Check tracking and UTM tags, copy against brand voice and claims against evidence, and each asset's size and format per channel. For email, send a test to the user only, and check the subject, preview, rendering and unsubscribe link.
- Desktop app: run automated tests, then use computer use to open the app and exercise its main flows.
- Audio plugin: run pluginval at strictness level 5 or higher, then use computer use to operate every control in a host. Check it responds and nothing crashes. The user judges the sound.
- API or backend: run the tests and call the endpoints in a test environment.
- Documents or content: have a fresh agent check facts against sources, links, and the spec.

Rules:

- Test on local, staging or draft versions, not live ones, unless the user explicitly approves it.
- Use test accounts and test data only. The user enters any real keys or passwords.
- Test against the acceptance criteria in `PLAN.md` and `SPEC.md`, not against what was built.
- Do not pass anything that was not actually tested. List it as not tested, with the reason.

Write `QA-REPORT.md` with each check, method, result and evidence. Add every failure to `PLAN.md` as a fix task, return to Stage 5, then retest it.

## Stage 8: Confirm

Show the user:

- what was delivered against each goal in `SPEC.md`
- the QA results, including anything not tested
- open risks and decisions they should know about

**STOP: the user signs off.** Only then mark the project complete in `STATE.md`.
