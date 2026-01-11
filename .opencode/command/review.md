---
description: Review and address PR feedback
agent: build
---

# Review PR Feedback

Address feedback from pull request reviews.

## Steps

1. **Get PR context**:
   - Run `gh pr view` to get current PR details
   - Run `gh pr checks` to see CI status
   - Run `gh api repos/{owner}/{repo}/pulls/{pr}/comments` for review comments

2. **Categorize feedback**:
   - **Must fix**: Blocking issues, bugs, security concerns
   - **Should fix**: Code quality, best practices
   - **Consider**: Suggestions, preferences

3. **Address each item**:
   - For each piece of feedback:
     1. Read the comment and context
     2. Make the necessary change
     3. Commit with reference to feedback
     4. Mark as resolved if applicable

4. **Update PR**:
   - Push changes: `git push`
   - Reply to comments explaining changes
   - Request re-review if needed

5. **Report summary**:
   ```
   ## PR Review Addressed

   ### Fixed
   - Comment #1: Added error handling for null case
   - Comment #3: Renamed variable for clarity

   ### Discussed
   - Comment #2: Explained why current approach preferred

   ### Pending
   - None

   Ready for re-review.
   ```

## Important Rules

- Address all blocking feedback before requesting re-review
- Explain changes in commit messages
- Don't dismiss comments without response
- If you disagree, discuss rather than ignore
