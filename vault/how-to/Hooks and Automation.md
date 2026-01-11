# Hooks and Automation

This document describes the automated validation and workflow hooks in your-project.

## Overview

YourProject uses two types of automation:

1. **Git Hooks** - Run during Git operations (commit, etc.)
2. **OpenCode Plugins** - Run during OpenCode operations (compaction, etc.)

## Git Hooks

Git hooks provide deterministic validation of code quality and commit conventions.

### Installation

```bash
bash .opencode/hooks/install-hooks.sh
```

This creates symlinks in `.git/hooks/` pointing to `.opencode/hooks/` scripts.

### Available Git Hooks

#### pre-commit

**When it runs**: Before creating a commit (after `git commit`, before message is written)

**What it validates**:

**Code quality** (blocks):
- No `debugger` statements in code
- No merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)

**Code quality** (warns):
- `console.log/debug/info` statements (except in test/debug files)

**PM discipline** (blocks):
- No temporal language in evergreen docs (vault/product, vault/architecture, vault/features)
- Task files must have valid status (backlog, in-progress, completed, blocked)
- Task files must have required fields (status, priority, created, updated)

**PM discipline** (warns):
- Task size >7 checklist items (consider splitting)
- Branch-task alignment (modifying task from wrong branch)
- PROJECT_STATUS.md sync (task files changed but status not updated)

**Files checked**: `*.js`, `*.jsx`, `*.ts`, `*.tsx`, `*.md` (staged files only)

**Location**: `.opencode/hooks/pre-commit.sh`

**Example output** (success):
```
✅ Pre-commit checks passed
```

**Example output** (blocking error):
```
❌ Found temporal language in evergreen doc: vault/product/User Journeys.md
   Evergreen docs must describe current state, not temporal changes
   Blocked words: now, currently, recently, soon, will, planned, future, etc.

   See vault/_meta/Vault Writing Guidelines.md for details
```

**Example output** (warning):
```
⚠️  Warning: Task has 9 checklist items: vault/pm/tasks/T-2025-012-user-authentication.md
   Consider breaking this into smaller tasks (recommended max: 7 items)
   Large tasks are harder to complete in one session and track progress

✅ Pre-commit checks passed
```

#### commit-msg

**When it runs**: After commit message is written, before commit is created

**What it validates**:
- Conventional commit format: `type(scope): description`
- Valid types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`, `revert`
- Subject max length: 50 characters

**Location**: `.opencode/hooks/commit-msg.sh`

**Example output**:
```
✅ Commit message format valid
```

or

```
❌ Invalid commit message format!

Expected format: type(scope): description

Valid types: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert
Example: feat(auth): add login form
Example: fix: resolve dark mode toggle bug

Your message:
Added some stuff

See vault/how-to/Git Workflow.md for details
```

#### post-commit

**When it runs**: After commit is successfully created

**What it does**:
- Updates PROJECT_STATUS.md "Last Updated" timestamp
- Updates "Files Recently Modified" section with recent 10 files
- Stages PROJECT_STATUS.md (doesn't auto-commit)

**Location**: `.opencode/hooks/post-commit.sh`

**Example**:
```bash
git commit -m "feat: add user authentication"
# post-commit hook runs automatically
# PROJECT_STATUS.md is updated and staged
# Next commit will include the status update
```

**Note**: This hook keeps PROJECT_STATUS.md timestamps current without requiring manual updates.

## OpenCode Plugins

OpenCode plugins provide automation during AI-assisted development. They hook into OpenCode's event system to extend functionality.

### Plugin Location

Plugins are TypeScript or JavaScript files placed in:

- **Project-level**: `.opencode/plugin/` - Plugins specific to this project
- **Global**: `~/.config/opencode/plugin/` - Plugins available to all projects

Files in these directories are automatically loaded at startup.

### Available Plugins

#### context-preservation.ts

**When it runs**: Before OpenCode compacts conversation context (memory compression)

**What it does**:
- Detects active task from git branch (T-YYYY-NNN pattern)
- Injects task context references into the compaction summary
- Helps resumed sessions quickly locate relevant context docs

**Location**: `.opencode/plugin/context-preservation.ts`

**How it works**:

```typescript
import type { Plugin } from "@opencode-ai/plugin"

export const ContextPreservationPlugin: Plugin = async ({ $ }) => {
  return {
    "experimental.session.compacting": async (input, output) => {
      const branch = await $`git branch --show-current 2>/dev/null`.text()
      const taskMatch = branch.trim().match(/T-\d{4}-\d{3}/)

      if (taskMatch) {
        const taskId = taskMatch[0]
        output.context.push(`## Active Task Context
- **Task ID**: ${taskId}
- **Context doc**: vault/pm/_context/${taskId}-context.md
- **Task file**: vault/pm/tasks/${taskId}-*.md

Resume work by checking the context doc for decisions and progress.`)
      }
    },
  }
}
```

**Result**: After compaction, the resumed session knows which task was active and where to find context.

## Plugin Events Available

OpenCode supports these plugin events:

### Session Events
- **session.compacting** (experimental) - Before context compaction
- **session.created** - When a new session starts
- **session.idle** - When session becomes idle
- **session.error** - When an error occurs

### Tool Events
- **tool.execute.before** - Before any tool is called
- **tool.execute.after** - After any tool is called

### File Events
- **file.edited** - When a file is modified
- **file.watcher.updated** - When file watcher detects changes

### Message Events
- **message.updated** - When a message is updated
- **message.removed** - When a message is removed

See [OpenCode Plugin Documentation](https://opencode.ai/docs/plugins/) for the complete event list.

## Deterministic Activities

The hooks and plugins system ensures these activities happen automatically:

### Code Quality (Git Hooks)
- ✅ No debug statements reach production
- ✅ No merge conflicts in commits
- ✅ Consistent commit message format
- ✅ Searchable commit history

### Context Preservation (OpenCode Plugins)
- ✅ Task context injected into compaction summaries
- ✅ Resumed sessions know where to find context
- ✅ Reduced token burn from re-exploration

## Bypassing Hooks

### Git Hooks

**Not recommended**, but possible:

```bash
# Skip pre-commit (validation still happens on commit-msg)
git commit --no-verify -m "feat: emergency fix"
```

**When to bypass**:
- Emergency hotfixes (fix first, clean later)
- Committing intentional debug code (mark with TODO)
- Temporary WIP commits on feature branch

**Always clean before merging to main!**

### OpenCode Plugins

Plugins run automatically when their events fire. To disable a plugin:

1. Remove or rename the plugin file in `.opencode/plugin/`
2. Or comment out the export in the plugin file

## Maintenance

### Adding New Git Hooks

1. Create script in `.opencode/hooks/`
2. Make executable: `chmod +x .opencode/hooks/new-hook.sh`
3. Update `install-hooks.sh` to symlink it
4. Document in this file
5. Run `bash .opencode/hooks/install-hooks.sh`

### Adding New OpenCode Plugins

1. Create a TypeScript file in `.opencode/plugin/`
2. Export a Plugin function that returns event handlers
3. Document in this file
4. Restart OpenCode to load the plugin

**Example plugin structure**:

```typescript
import type { Plugin } from "@opencode-ai/plugin"

export const MyPlugin: Plugin = async ({ $, directory }) => {
  return {
    "session.idle": async () => {
      // Do something when session becomes idle
    },
    "tool.execute.before": async (input, output) => {
      // Modify tool behavior before execution
    },
  }
}
```

## Troubleshooting

### Git Hooks Not Running

**Check installation**:
```bash
ls -l .git/hooks/pre-commit
ls -l .git/hooks/commit-msg
```

Should show symlinks to `.opencode/hooks/` scripts.

**Reinstall**:
```bash
bash .opencode/hooks/install-hooks.sh
```

### OpenCode Plugins Not Loading

**Check plugin location**:
```bash
ls -l .opencode/plugin/
```

Plugin files should be `.ts` or `.js` files with exported Plugin functions.

**Check for syntax errors**:
OpenCode logs plugin loading errors at startup. Check the terminal output when starting OpenCode.

**Verify exports**:
Plugins must export a function that returns an object with event handlers. The export can be named or default.

### Hooks Failing in Dev Container

Ensure scripts use portable paths:
- ✅ Use `git rev-parse --show-toplevel` for git root
- ✅ Use relative paths from git root
- ❌ Don't use absolute paths like `/Users/...`
- ❌ Don't use `~` for home directory

## Philosophy

### Why Hooks?

**Consistency**: Ensure conventions are followed automatically, not manually remembered.

**Speed**: Catch issues immediately, not during code review.

**Determinism**: Same validation runs every time, regardless of who (human or AI) writes the code.

**Token Efficiency**: Context preservation plugin reduces need for the agent to re-explore context after memory compression.

### What NOT to Hook

**Avoid hooks/plugins that**:
- Take more than 2-3 seconds to run
- Require network access (flaky, slow)
- Make code changes automatically (surprising, hard to debug)
- Duplicate existing tools (linters, formatters - run those separately)

**Good hooks**: Fast, deterministic, read-only validation

**Bad hooks**: Slow, network-dependent, auto-fixing

## Related Documentation

- [[Git Workflow]] - Commit and branch conventions
- [[Development Setup]] - Initial setup including hooks
- [[Code Philosophy]] - Coding standards enforced by hooks
- [OpenCode Plugins](https://opencode.ai/docs/plugins/) - Official plugin documentation
