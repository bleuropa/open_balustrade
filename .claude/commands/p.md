# Plan Task

You are planning a new task. This creates the task document and optionally breaks down the work.

## Steps

1. **Get task details** from user input:
   - Task ID (if provided) or generate next: T-{YEAR}-{next-number}
   - Task title/description
   - Priority (p0/p1/p2/p3)
   - Linked story or epic (if any)

2. **Determine task ID**:
   - If user provided ID, use it
   - Otherwise, find highest existing task number:
     ```bash
     ls vault/pm/tasks/ | grep -o 'T-2025-[0-9]*' | sort -u | tail -1
     ```
   - Increment by 1 for new task ID

3. **Create task file** at `vault/pm/tasks/{TASK-ID}-{slug}.md`:
   - Use template from `vault/_templates/Task.md`
   - Fill in frontmatter: tags, status (backlog), priority, created date
   - Fill in task details section with ID, priority, created date
   - Add description from user input
   - Generate acceptance criteria (3-5 items based on description)
   - Leave other sections as placeholders

4. **Create context doc** at `vault/pm/_context/{TASK-ID}-context.md`:
   - Start with basic structure:
     ```markdown
     # Context: {TASK-ID} {Title}

     **Task**: [[{TASK-ID}-{slug}]]
     **Created**: {today}
     **Status**: Planning

     ## Overview
     {Expand on task description}

     ## Key Decisions
     -

     ## Implementation Plan
     {If user wants breakdown, add steps here}

     ## Open Questions
     -

     ## Next Steps
     1. Review plan with user
     2. Run `/s {TASK-ID}` to start work
     ```

5. **Break down work** (if requested):
   - Add implementation steps to context doc
   - Identify files that will need changes
   - List dependencies
   - Estimate complexity

6. **Update PROJECT_STATUS.md**:
   - Add task to "Next Up" section (unless explicitly backlog)
   - Update "Last Updated" timestamp to today
   - Don't change "Current Focus" (planning != working)

7. **Commit task creation**:
   ```bash
   git add vault/pm/tasks/{TASK-ID}*.md \
           vault/pm/_context/{TASK-ID}*.md \
           PROJECT_STATUS.md
   git commit -m "chore: create task {TASK-ID}

   {Task title}

   ```

8. **Summary output**:
   - Show task ID and file location
   - Show context doc location
   - Suggest next step: `/s {TASK-ID}` to start work

## Usage Patterns

### Quick task creation
```
User: /p Add dark mode toggle
You: Create T-2025-004-dark-mode-toggle.md with basic structure
```

### Detailed planning
```
User: /p T-2025-005 Implement study session algorithm - needs breakdown
You: Create task and context docs, add detailed implementation plan
```

### From existing epic/story
```
User: /p Create login form for US-2025-001
You: Create task linked to US-2025-001 in frontmatter
```

## Important Rules
- ALWAYS create both task file AND context doc
- Generate clear acceptance criteria
- Keep task doc structured (use template)
- Context doc can be more free-form for planning
- Commit immediately after creation
- Be efficient - don't overthink the initial plan

## Example

User: `/p Add user authentication with JWT`

You:
1. Check existing tasks → highest is T-2025-002
2. New task ID: T-2025-003
3. Create vault/pm/tasks/T-2025-003-user-authentication.md
4. Create vault/pm/_context/T-2025-003-context.md
5. Commit both files
6. Output:
   ```
   ✓ Created task T-2025-003-user-authentication

   Files:
   - vault/pm/tasks/T-2025-003-user-authentication.md
   - vault/pm/_context/T-2025-003-context.md

   Next: /s T-2025-003 to start work
   ```
