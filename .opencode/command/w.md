---
description: Wrap session (alias for /wrap)
agent: build
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

   **Current state**:
   - What's in progress
   - Any uncommitted changes

   **Next steps**:
   - Immediate priorities
   - What to pick up next

3. **Update context doc and PROJECT_STATUS.md**

4. **Commit updates**

5. **Output handoff summary**

## Important Rules

- Be comprehensive but concise
- Focus on actionable handoff info
- Make it easy for next session to pick up
