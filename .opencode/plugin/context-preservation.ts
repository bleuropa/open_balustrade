import type { Plugin } from "@opencode-ai/plugin"

/**
 * Context Preservation Plugin
 *
 * Injects active task context into compaction summaries to help
 * resumed sessions quickly understand the current work state.
 *
 * This plugin hooks into OpenCode's compaction event and adds
 * references to the active task's context doc and task file.
 */
export const ContextPreservationPlugin: Plugin = async ({ $ }) => {
  return {
    "experimental.session.compacting": async (input, output) => {
      // Detect active task from git branch (format: type/T-YYYY-NNN-slug)
      const branch = await $`git branch --show-current 2>/dev/null`.text()
      const taskMatch = branch.trim().match(/T-\d{4}-\d{3}/)

      if (taskMatch) {
        const taskId = taskMatch[0]
        output.context.push(`## Active Task Context

- **Task ID**: ${taskId}
- **Context doc**: vault/pm/_context/${taskId}-context.md
- **Task file**: vault/pm/tasks/${taskId}-*.md

Resume work by checking the context doc for decisions and progress.`)
      }
    },
  }
}
