# Close Task

You are closing out a task. Follow this workflow:

## Steps

1. **Identify current task**:
   - Run `git branch --show-current` to get branch name
   - Extract task ID from branch name (format: `type/T-YYYY-NNN-slug`)
   - If not on a task branch (i.e., on `main`), ask user which task to close

2. **Read task file** at `vault/pm/tasks/{TASK-ID}-*.md`

3. **Review completion**:
   - Check acceptance criteria - are they all checked?
   - Check review checklist - is it complete?
   - If not all done, show user what's missing and ask if they want to continue

4. **Update task file**:
   - Change status from `in-progress` to `completed`
   - Set `completed` field to today's date
   - Update `updated` field to today
   - Ensure all acceptance criteria boxes are checked (if user confirmed complete)
   - Ensure all review checklist boxes are checked

5. **Update context doc** (if exists):
   - Add final entry to context doc at `vault/pm/_context/{TASK-ID}-context.md`
   - Append to "Next Steps" or create "Completion Notes" section:
     ```markdown
     ## Completion Notes
     **Completed**: {today}
     **Outcome**: {1-sentence summary}

     All acceptance criteria met. Task closed.
     ```

6. **Update PROJECT_STATUS.md**:
   - Move task from "Current Focus" to "Recently Completed" (keep last 3)
   - Update "Current Focus" to: "(No active task - use /s to start next task)"
   - Remove task from "Next Up" if it was there
   - Update "Last Updated" timestamp to today
   - Clear "Task Breakdown (Active Task)" section

7. **Commit task completion**:
   ```bash
   git add vault/pm/tasks/{TASK-ID}*.md \
           vault/pm/_context/{TASK-ID}*.md \
           PROJECT_STATUS.md
   git commit -m "chore: complete {TASK-ID}

   {Brief summary of what was accomplished}

   ```

8. **Ask about PR**:
   - "Create pull request? (yes/no)"
   - If yes:
     - Generate PR title from task name
     - Generate PR body with summary and link to task
     - Run: `gh pr create --title "{title}" --body "{body}"`
     - Show PR URL to user
   - If no, remind user to merge manually when ready

8. **Remind about cleanup**:
   - After PR is merged, delete branch: `git branch -d {branch-name}`
   - Switch back to main: `git checkout main && git pull`

## Important Rules
- DO check completion status before marking as done
- DO ask user if criteria aren't met
- DO create comprehensive commit message
- ASK user about PR creation (don't assume)
- Keep output concise and clear

## Example

User: `/c`

You:
1. Current branch: `feat/T-2025-003-study-sessions`
2. Task ID: T-2025-003
3. Read task file, check acceptance criteria (all ✓)
4. Update status to completed, completed: 2025-11-18
5. Update context doc with completion notes
6. Commit changes
7. Ask: "Create pull request? (yes/no)"
8. Output: "✓ Task T-2025-003 completed and committed"
