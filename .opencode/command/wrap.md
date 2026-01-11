---
description: End-of-session summary and handoff
---

# Wrap Session

Create a comprehensive end-of-session summary for handoff.

## Steps

1. **Read current state**:
   - `PROJECT_STATUS.md`
   - Current task context doc (if active task)
   - Recent git log (last 5-10 commits)

2. **Summarize session**:

   **What was accomplished**:
   - List completed tasks/features
   - Note significant commits
   - Mention files changed

   **Current state**:
   - What's in progress
   - What's partially complete
   - Any uncommitted changes

   **Blockers/Questions**:
   - Issues encountered
   - Decisions needed
   - Questions for next session

   **Next steps**:
   - Immediate priorities
   - What to pick up next
   - Any setup needed

3. **Update context doc** (if active task):
   - Add session summary to Implementation Notes
   - Update Next Steps section

4. **Update PROJECT_STATUS.md**:
   - Ensure Current Focus is accurate
   - Update Recently Completed
   - Add any new blockers/questions
   - Update Last Updated timestamp

5. **Commit updates**:
   ```bash
   git add vault/pm/_context/*.md PROJECT_STATUS.md
   git commit -m "docs: wrap session - {brief summary}"
   ```

6. **Output handoff summary**:
   ```
   ## Session Summary

   ### Completed
   - {item 1}
   - {item 2}

   ### In Progress
   - {current task}: {state}

   ### Next Session
   1. {priority 1}
   2. {priority 2}

   ### Notes
   - {any important context}
   ```

## Important Rules

- Be comprehensive but concise
- Focus on actionable handoff info
- Don't leave uncommitted work without noting it
- Make it easy for next session to pick up
