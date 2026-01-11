---
description: Plan a new work item (Epic/Story/Task/Bug)
agent: build
---

# Plan Work Item

Create a new task, bug, story, or epic based on the user's description.

## Steps

1. **Parse the description** from user input after `/p`

2. **Determine work item type**:
   - **Bug**: If description mentions "fix", "broken", "error", "issue", "bug"
   - **Task**: Default for most implementation work
   - **Story**: If description focuses on user value ("as a user...")
   - **Epic**: If scope is large (multiple stories/tasks)
   - When in doubt, ask the user

3. **Generate ID**:
   - Format: `{TYPE}-{YEAR}-{NNN}`
   - TYPE: T (Task), B (Bug), US (Story), E (Epic)
   - YEAR: Current year (e.g., 2025)
   - NNN: Next available number (check existing files)
   - Example: `T-2025-003`

4. **Create slug** from title:
   - Kebab-case, 3-5 words max
   - Example: "Add user authentication" -> "add-user-auth"

5. **Create file** at `vault/pm/{type}s/{ID}-{slug}.md`:
   - Use appropriate template from `vault/_templates/`
   - Fill in title, description, dates
   - Set status to `backlog`
   - Set reasonable priority (default: medium)

6. **Update PROJECT_STATUS.md**:
   - Add to "Next Up" section if high priority
   - Update "Last Updated" timestamp

7. **Commit the new work item**:
   ```bash
   git add vault/pm/{type}s/{ID}*.md PROJECT_STATUS.md
   git commit -m "chore: plan {ID} - {title}"
   ```

8. **Output summary**:
   ```
   Created {ID}: {title}
   Type: {Task/Bug/Story/Epic}
   Priority: {priority}
   File: vault/pm/{type}s/{ID}-{slug}.md

   Start with: /s {ID}
   ```

## Templates

### Task (vault/_templates/Task.md)
```markdown
---
id: {ID}
title: {title}
status: backlog
priority: medium
created: {today}
updated: {today}
parent: null
children: []
tags: [task]
---

# {title}

## Description
{description}

## Acceptance Criteria
- [ ] {criterion 1}
- [ ] {criterion 2}

## Technical Notes
-

## Review Checklist
- [ ] Code reviewed
- [ ] Tests pass
- [ ] Documentation updated
```

### Bug (vault/_templates/Bug.md)
```markdown
---
id: {ID}
title: {title}
status: backlog
priority: high
created: {today}
updated: {today}
tags: [bug]
---

# {title}

## Description
{description}

## Steps to Reproduce
1.

## Expected Behavior
-

## Actual Behavior
-

## Fix Verification
- [ ] Bug no longer reproduces
- [ ] No regressions introduced
```

## Important Rules

- Generate sensible acceptance criteria from description
- Don't over-complicate simple tasks
- For bugs, try to infer reproduction steps
- Keep descriptions concise but complete
- Always commit the new file
