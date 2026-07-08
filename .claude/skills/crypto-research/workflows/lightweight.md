# Lightweight Workflow

**When to use:** the user asks a quick question about a coin or the market and doesn't need deep analysis.

**Agents:** 4, all on the `haiku` model:
1. `price-check` (haiku)
2. `market-agent` (haiku)
3. `news-scanner` (haiku)
4. `coin-analyzer` (haiku) — only if a specific ticker was named; otherwise substitute a second `movers` (haiku) run.

**Duration:** ~30-60 seconds.

## Steps

1. Run `date` to get the current timestamp.
2. Run `scripts/setup-output-dir.sh` to create the run directory; capture the returned path as `RUN_DIR`.
3. Determine `TICKER` from the user's message (default `BTC` if none named).
4. Launch the 4 agents in parallel via the `Task` tool, `model: haiku`, each pointed at its prompt file in `agent-prompts/` and its own `OUTPUT_FILE` under `RUN_DIR`.
5. Once all agents return, synthesize a short (under ~200 words) summary directly in the conversation, and point to `RUN_DIR` for full detail.

## Notes
- Do not upgrade to sonnet/opus unless the user asks for deeper analysis or the haiku output is clearly insufficient.
- If a ticker isn't recognized, ask the user to confirm rather than guessing.
