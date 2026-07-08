# Comprehensive Workflow

**When to use:** the user wants deep, multi-perspective research — e.g. before making an investment decision, or when asked explicitly for "comprehensive" or "full" research.

**Agents:** up to 12, spread across three model tiers for cross-checking:
1. `market-agent` — haiku, sonnet, opus (3 runs)
2. `coin-analyzer` — haiku, sonnet, opus (3 runs, parameterized by `TICKER`)
3. `macro-correlation-scanner` — sonnet, opus (2 runs)
4. `investment-plays` — sonnet, opus (2 runs)
5. `news-scanner` — haiku, sonnet (2 runs)

Adjust the exact mix down if the user only cares about one ticker or one dimension (e.g. skip `investment-plays` if they only asked "is X a good buy right now" about a specific narrow question — use judgment).

**Duration:** ~2-5 minutes.

## Steps

1. Run `date` to get the current timestamp.
2. Run `scripts/setup-output-dir.sh` to create the run directory; capture the returned path as `RUN_DIR`.
3. Determine `TICKER`(s) from the user's message (default `BTC` if none named; support multiple tickers by running `coin-analyzer` per ticker).
4. Launch all agents in parallel via the `Task` tool, each with its assigned model and prompt file, writing to distinct files under `RUN_DIR/<category>/`.
5. After all agents complete, read back the output files and reconcile across model tiers — note where haiku/sonnet/opus agree and where they diverge.
6. Produce a synthesized executive summary (bullish/bearish/neutral call, key risks, top opportunities) in the conversation, with a full breakdown available in `RUN_DIR`.

## Notes
- This mode is expensive (12 agent calls). Confirm with the user if they didn't explicitly ask for "comprehensive"/"full"/"deep" research and the request seems like it could be answered with the lightweight workflow instead.
- Divergence between model tiers on the same question is itself a useful signal — call it out rather than silently picking one.
