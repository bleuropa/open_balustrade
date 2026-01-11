# Agent Packs

Agent packs are pre-configured sets of agents for specific project types.

## Available Packs

### SaaS Pack (`saas/`)

Agents for building SaaS products:

- **product-manager** - Product vision, prioritization, and specs
- **ui-ux-designer** - UX, visual design, and interaction patterns
- **user-tester** - Persona-driven user testing

## Using a Pack

1. Copy the pack directory to `.opencode/agent/`
2. Customize agents for your specific product
3. Reference agents via `@agent-name`

## Creating Custom Packs

1. Create a directory in `.opencode/agent/_packs/`
2. Add agent markdown files with frontmatter
3. Include a README explaining the pack's purpose
4. Share with others!

## Pack Guidelines

- Each agent should have a clear, focused role
- Include context-gathering instructions
- Define how agents work together
- Provide customization guidance
