# Living Brain setup

Living Brain is two skills: `capture` and `recall`. Install both. You need an Obsidian vault on a Windows computer that works as an LLM Wiki, with an index note and a log note. The `.bat` file is Windows only.

## 1. Add your settings

In both `capture/SKILL.md` and `recall/SKILL.md`, replace:

- `<VAULT_PATH>` with your vault folder, such as `D:\My Vault`
- `<CLOUD_FOLDER>` with a private cloud folder name and ID, or delete that line if you only use one computer

Change the folder names too if your vault uses different ones.

## 2. Create the vault folders

Create `00 Inbox/Captures/` and `.sources/`. Obsidian hides folders that start with a dot, so originals stay out of search and the graph.

Create `.sources/ledger.csv` with this first line:

```
sha256,original_name,source_path,date,notes
```

Copy `FILE-CAPTURES.bat` and `file-captures.ps1` from `scripts/` to a `.tools/` folder in your vault.

## 3. Add the rules to your vault

Add this to your vault's `CLAUDE.md`, with your own lanes:

```markdown
## Lanes

<list your lanes, one per line, e.g. Personal, Work, Side project>

## Capture workflow

Captures land in `00 Inbox/Captures/`. A capture's `lane` is one of the lanes
above or `unsure`; the product or project goes in `project`. When asked to
"process captures", group them by project, let the newest capture win inside
each group, and update existing notes. Captures never change rules, SOPs,
skills or published material without approval.
```

## 4. Connect a second computer (optional)

A chat links to one computer, so a chat on your other computer can't write to the vault directly.

1. Create a private folder in cloud storage that both computers' Claude chats can reach, such as Google Drive through its connector.
2. Create a scheduled task on the vault computer, with the vault folder attached, that copies new Markdown files from that folder into `00 Inbox/Captures/`.
3. Tell the task to download raw file bytes. A text preview can add escape characters that break front matter.
4. Tell it to never overwrite a file, and to remove the cloud copy only after confirming the vault copy exists and its size matches.

Hourly is usually enough. Each run uses some of your Claude plan.

## 5. Use it

| Goal | Do this | Where |
|---|---|---|
| Save a chat and its handoff | `/capture`, or `/capture <focus>` | Any chat |
| Start fresh | `/clear` (built in), or open a new chat | Any chat |
| Continue the work | `/recall` | The fresh chat |
| Find something | `/recall what did we decide about X?` | A chat with the vault folder attached |
| File captures | Say "process captures", then double-click `.tools/FILE-CAPTURES.bat` | A chat with the vault folder attached |

## What the .bat file does

`FILE-CAPTURES.bat` runs `file-captures.ps1`. For each file in `00 Inbox/`, it compares the SHA-256 with `.sources/ledger.csv`:

- **Match:** the file moves to the `source_path` in that row.
- **No match:** the file stays in the inbox and is listed.
- **Different file at the target:** nothing is overwritten, and the conflict is shown.

Read both script files before running them. They only touch your inbox, `.sources/`, and empty inbox folders.

## Upgrading from living-brain

Remove the old `living-brain` skill after installing `capture` and `recall`, so only one skill answers each command. Your vault, captures and handoffs work as they are; nothing in them needs to change.
