**Task**: $ARGUMENTS

## Choosing Your Approach

**For clear, single-domain tasks**, use the specialist directly:
- Full-stack feature → `subagent_type="full-stack-dev"` (primary code author)
- Frontend work → `subagent_type="frontend-dev"` (UI components, styling)
- Backend work → `subagent_type="backend-dev"` (API, database, business logic)
- Testing → `subagent_type="test-engineer"`
- Bug fixes → `subagent_type="bug-hunter"`
- Code review → `subagent_type="code-reviewer"`

**For complex or multi-domain tasks**, use the coordinator:
```
Use the Task tool with subagent_type="coordinator" and provide the task description as the prompt.
```

The coordinator orchestrates multiple specialists but adds overhead for simple tasks. Choose the most direct path.

**Or handle it yourself** following the standard workflow below:

## Standard Workflow (If Not Using Coordinator)

### 1. Explore and Understand
Search and read the codebase to understand relevant areas, patterns, and existing implementations.

### 2. Create a Context Document
Create a new Markdown file in `context/` (gitignored) with a descriptive name: `context/feature-name.md`

**Track**:
- Research findings and exploration notes
- Implementation plan and approach
- Progress updates as you work (CRITICAL: Update frequently!)
- Key decisions, tradeoffs, and architecture choices
- Code review feedback and responses

**Purpose**: Context docs are temporary working documents for active development. They maintain continuity, serve as scratchpads, and provide clear records for PR descriptions.

**Critical Rules**:
- ✅ Context docs are gitignored - never commit them
- ✅ Discard or archive after task completion
- ✅ For permanent docs (architecture, patterns), create in project docs instead
- ✅ Use root-level `context/` (NOT `.claude/context/`)
- 🔥 UPDATE AFTER EACH SIGNIFICANT STEP

### 3. Update Context Document Throughout
**Non-negotiable**: Update the context doc:
- After completing each significant step
- After making any important decision
- When encountering blockers
- Before delegating to agents
- After receiving agent feedback
- Every 30-60 minutes minimum

### 4. Present the Plan
Once research is complete and initial context doc created with proposed approach, present the plan for review before implementing.

## Remember
- Follow existing codebase patterns (check similar implementations)
- Consider both product and technical context
- **Update context document religiously** (most important!)
- Commit early and often
