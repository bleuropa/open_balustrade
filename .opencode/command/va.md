---
description: Audit vault documentation quality
---

# Vault Audit

Audit vault documentation for quality and consistency.

## Steps

1. **Scan vault structure**:
   - Check all markdown files in `vault/`
   - Verify directory organization
   - Check for orphaned files

2. **Check evergreen docs** (product/, architecture/, features/):
   - Look for temporal language violations
   - Check for broken wiki links
   - Verify frontmatter consistency
   - Check for outdated information

3. **Check PM docs** (pm/):
   - Validate task file structure
   - Check status field validity
   - Verify parent-child links
   - Find orphaned context docs

4. **Check meta docs** (_meta/, how-to/):
   - Ensure guidelines are followed
   - Check for outdated procedures
   - Verify examples still work

5. **Report findings**:
   ```
   ## Vault Audit Report

   ### Structure
   - Files scanned: {count}
   - Directories: {list}

   ### Issues

   **Evergreen Docs**:
   - {file}: temporal language found ("will", "soon")
   - {file}: broken link to [[missing-doc]]

   **PM Docs**:
   - {task}: invalid status "pending" (should be "backlog")
   - {context}: orphaned (no matching task)

   **Links**:
   - {count} broken wiki links
   - {count} orphaned files

   ### Recommendations
   - Fix temporal language in {files}
   - Update broken links
   - Archive orphaned docs
   ```

6. **Offer to fix**:
   - "Would you like me to fix these issues?"
   - If yes, make corrections and commit

## Checks Performed

| Check | Scope | Description |
|-------|-------|-------------|
| Temporal language | Evergreen | No "will", "soon", "currently" |
| Broken links | All | Wiki links resolve |
| Frontmatter | PM | Required fields present |
| Status values | Tasks | Valid status enum |
| Orphans | All | Files are linked |

## Important Rules

- Report before fixing
- Preserve content when fixing format issues
- Don't delete without confirmation
- Run periodically (monthly recommended)
