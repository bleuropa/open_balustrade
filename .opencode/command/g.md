---
description: Groom project state (alias for /groom)
---

# Groom Project State

Audit and synchronize project management artifacts.

## Steps

1. **Scan all task files** in `vault/pm/tasks/`

2. **Check for inconsistencies**:
   - Tasks marked `in-progress` but no matching branch
   - Tasks with unchecked acceptance criteria but marked `completed`
   - Orphaned context docs (no matching task)
   - Stale `in-progress` tasks (no commits in 7+ days)

3. **Check PROJECT_STATUS.md sync**

4. **Report findings**

5. **Offer to fix** with permission

## Important Rules

- Report first, fix only with permission
- Don't auto-close stale tasks
- Run periodically (weekly recommended)
