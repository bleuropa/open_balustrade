---
description: Escape hatch - bypass PM hooks for this prompt
agent: build
---

# Escape Hatch

Bypass project management requirements for this prompt.

## Usage

Use `/x` when you need to:
- Make a quick fix without creating a task
- Experiment with something
- Do housekeeping work
- Skip the normal workflow temporarily

## How It Works

When you prefix a request with `/x`, the normal PM discipline checks are bypassed. You can:
- Make changes without an active task
- Skip context doc updates
- Commit without task references

## Examples

```
/x Fix typo in README
/x Add .gitignore entry for .DS_Store
/x Quick experiment with new library
```

## Important Rules

- Use sparingly - the PM workflow exists for good reasons
- Not for substantial feature work
- Not for multi-step implementations
- Good for: typos, config, experiments, cleanup
- Bad for: features, refactors, bug fixes

## Remember

The escape hatch is for exceptions, not the rule. If you're using `/x` frequently, consider whether the PM workflow needs adjustment.
