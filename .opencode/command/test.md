---
description: Run user testing with a persona
agent: plan
---

# User Test with Persona

Run user testing simulation with a specific persona.

## Steps

1. **Identify persona**:
   - Check `vault/product/Personas and Use Cases.md` if exists
   - Or ask user which persona to embody
   - Default personas: power user, new user, admin

2. **Get test context**:
   - What feature/flow to test?
   - What's the expected outcome?
   - Any specific scenarios to focus on?

3. **Embody persona**:
   - Think from their perspective
   - Consider their goals, frustrations, technical level
   - What would confuse them? Delight them?

4. **Walk through flow**:
   - Step through the UI/feature as the persona
   - Note friction points
   - Identify unclear elements
   - Check error handling
   - Test edge cases

5. **Report findings**:
   ```
   ## User Test Report

   **Persona**: {name} - {description}
   **Flow Tested**: {feature/flow}

   ### Positive
   - {what worked well}

   ### Issues
   - {friction point 1}: {suggestion}
   - {confusion point}: {suggestion}

   ### Suggestions
   - {improvement 1}
   - {improvement 2}
   ```

## Important Rules

- Stay in character as the persona
- Focus on user experience, not implementation
- Prioritize findings by impact
- Suggest concrete improvements
