# Balustrade - OpenCode Meta-Framework

> Opinionated rails for OpenCode development

## Quick Context

- Read `PROJECT_STATUS.md` first for current state (~500 tokens)
- Use `/status` for quick status checks
- Use custom commands for consistent workflows
- Check `vault/` for documentation

## Project Structure

```
.opencode/          # OpenCode configuration
  command/          # Custom commands (/p, /s, /c, etc.)
  agent/            # Agent definitions (subagents)
  skill/            # Reusable skills
  hooks/            # Git hooks (standard)
vault/              # Documentation (Obsidian-style)
  product/          # Product vision
  architecture/     # System design
  features/         # Feature specs
  pm/               # Project management
opencode.json       # OpenCode configuration
PROJECT_STATUS.md   # Current project state
```

## Key Commands

- `/status` - Quick status check
- `/s <task-id>` - Start a task
- `/c` - Close current task
- `/p <description>` - Plan new task
- `/ctx` - Update context doc
- `/wrap` - End-of-session summary

## Agents

All agents in this project are **subagents** (invoked via Task tool or @mention):

- `@coordinator` - Multi-domain coordination
- `@full-stack-dev` - Feature implementation
- `@code-reviewer` - Code review
- `@bug-hunter` - Debugging

## Conventions

1. **Read PROJECT_STATUS.md first** - Single source of truth
2. **Use custom commands** - Maintain consistency
3. **Update context docs** - Track decisions
4. **Commit incrementally** - Small, focused commits
5. **Follow conventional commits** - type(scope): message

## Vault Documentation

- **Evergreen docs** (product/, architecture/, features/) - No temporal language
- **PM docs** (pm/) - Tasks, context, temporal OK
- Use `[[wiki links]]` for connections

## Task Workflow

1. `/p` to plan a task
2. `/s T-YYYY-NNN` to start
3. Work on implementation
4. `/ctx` to track decisions
5. `/c` to close and create PR

## External References

Load these documents on a need-to-know basis:

**Documentation Standards**
- `vault/_meta/Vault Writing Guidelines.md` - How to write vault docs

**Task Context**
- `vault/pm/_context/{TASK-ID}-context.md` - Working notes for active task
- `vault/pm/tasks/{TASK-ID}-*.md` - Task acceptance criteria

**How-To Guides**
- `vault/how-to/Hooks and Automation.md` - Git hooks and OpenCode plugins
- `vault/how-to/Git Workflow.md` - Branch and commit conventions
