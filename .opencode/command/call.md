---
description: Invoke a specialized agent for a task
---

# Invoke Agent

Invoke a specialized agent for a specific task.

**Usage**: `/call <agent-name> <task-description>`

## Examples

- `/call full-stack-dev Implement user profile editing feature`
- `/call bug-hunter Debug why login fails intermittently`
- `/call code-reviewer Review authentication module for security`
- `/call coordinator Build notification system with email and push`

## Available Agents

**Included examples**:
- `coordinator` - Multi-domain tasks, strategic planning
- `full-stack-dev` - End-to-end feature implementation
- `code-reviewer` - Code quality and security review
- `bug-hunter` - Debugging and root cause analysis

**You should add**:
- Your language-specific agents (python-dev, rust-dev, etc.)
- Your domain-specific agents (mobile-dev, data-engineer, etc.)
- Your project-specific agents (frontend-dev, backend-dev, etc.)

## How It Works

Use `@agent-name` to invoke the agent with your task description.

The agent will receive your prompt and use its specialized tools and knowledge to complete the task.

## Tips

**Be specific**:
- Bad: `/call full-stack-dev fix the app`
- Good: `/call full-stack-dev Add JWT authentication to login endpoint`

**Use right specialist**:
- Clear domain -> specific agent
- Multi-domain -> coordinator
- Unclear -> coordinator (will delegate)

**Provide context**:
- Mention relevant docs if needed
- Reference task IDs
- Include acceptance criteria
