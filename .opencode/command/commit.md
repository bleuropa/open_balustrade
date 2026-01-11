---
description: Create a git commit with current changes
---

# Commit Changes

Create a git commit with the current changes.

## Steps

1. **Review changes** with `git status` and `git diff`

2. **Stage appropriate files**
   - Stage related files together
   - Don't stage unrelated changes

3. **Create commit message** following conventional commits format:
   ```
   <type>: <description>

   [optional body]
   ```

4. **Commit the changes**

## Commit Types

- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code style (formatting, no logic change)
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Maintenance tasks

## Important Rules

- Keep description concise (50 chars or less)
- Use present tense ("add feature" not "added feature")
- Don't end with period
- Body explains "why" not "what"
