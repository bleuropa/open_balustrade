---
description: Audit and sync project management state
---

# Groom Project State

Audit and synchronize project management artifacts.

## Steps

1. **Scan all task files** in `vault/pm/tasks/`

2. **Check for inconsistencies**:
   - Tasks marked `in-progress` but no matching branch
   - Tasks with unchecked acceptance criteria but marked `completed`
   - Orphaned context docs (no matching task)
   - Tasks not linked from PROJECT_STATUS.md
   - Stale `in-progress` tasks (no commits in 7+ days)

3. **Check PROJECT_STATUS.md sync**:
   - Does "Current Focus" match actual in-progress tasks?
   - Are "Recently Completed" tasks actually completed?
   - Are "Next Up" priorities still relevant?

4. **Report findings**:
   ```
   ## Grooming Report

   ### Issues Found
   - T-2025-003: marked in-progress but no branch exists
   - T-2025-005: completed but missing acceptance criteria checks

   ### Suggestions
   - Consider closing T-2025-003 (stale, 14 days)
   - Update PROJECT_STATUS.md Current Focus

   ### Actions Taken
   - None (review mode only)
   ```

5. **Offer to fix**:
   - "Would you like me to fix these issues?"
   - If yes, make corrections and commit

## Checks Performed

| Check | Description |
|-------|-------------|
| Branch alignment | In-progress tasks have matching branches |
| Status accuracy | Completed tasks have all criteria checked |
| Orphan detection | Context docs have matching tasks |
| Staleness | Flag tasks with no activity |
| Hierarchy | Parent-child relationships valid |
| PROJECT_STATUS sync | Entry point matches reality |

## Important Rules

- Report first, fix only with permission
- Don't auto-close stale tasks (user decision)
- Keep grooming commits separate from feature work
- Run periodically (weekly recommended)
