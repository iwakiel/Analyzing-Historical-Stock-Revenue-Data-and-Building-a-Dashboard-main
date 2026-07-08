# Output-Only (Silent) Workflow

**When to use:** background research, automated/scheduled runs, or when the user explicitly wants files without a conversational summary (e.g. from a Routine/cron trigger).

**Agents:** configurable — use the lightweight or comprehensive agent set depending on the request; the difference from the other workflows is purely in what gets surfaced to the conversation, not which agents run.

## Steps

1. Run `date` to get the current timestamp.
2. Run `scripts/setup-output-dir.sh` to create the run directory; capture the returned path as `RUN_DIR`.
3. Launch the chosen agent set via the `Task` tool with `run_in_background: true`, each writing to its file under `RUN_DIR`.
4. Do not stream per-agent commentary into the conversation as agents complete.
5. Once all agents finish, reply with only:
   - The `RUN_DIR` path
   - A one-line count of how many agents completed successfully vs. failed
   - Nothing else, unless a failure needs the user's attention

## Notes
- Useful when this skill is invoked from a Routine (`create_trigger`) for recurring scheduled research — pair with `send_later`/Routines so results land in `RUN_DIR` for later review rather than needing a live chat session.
- If any agent fails, note it in the output directory (e.g. an `ERRORS.md` file) rather than failing the whole run.
