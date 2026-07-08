# Usage Guide

## Invoking the skill

The skill activates automatically when a user's request matches its description (cryptocurrency research, market analysis, specific coin questions, investment opportunity questions). It can also be invoked explicitly as `/crypto-research` if exposed as a slash command in your Claude Code configuration.

## Choosing a workflow

| User says... | Workflow |
|---|---|
| "What's Bitcoin doing today?" | `lightweight` |
| "Quick check on SOL" | `lightweight` |
| "Give me a full research report on ETH before I decide" | `comprehensive` |
| "Find me some good crypto plays right now" | `comprehensive` |
| (scheduled/background trigger) | `output-only` |

When unsure, default to `lightweight` and offer to escalate to `comprehensive` — it's cheaper to upgrade than to over-deliver on a simple question.

## Ticker resolution

- Accept common tickers directly (BTC, ETH, SOL, ADA, DOT, AVAX, etc.).
- If the user names a project by full name ("Bitcoin", "Solana"), map it to its ticker before passing to agent prompts.
- If ambiguous (e.g. multiple coins share a name), ask the user to confirm.
- Default to `BTC` only when the user's request is clearly market-wide, not coin-specific.

## Reading results back to the user

- Lead with the synthesized call (bullish/bearish/neutral, or market regime), not a raw dump of every agent's output.
- Always surface the `RUN_DIR` path so the user can open the full markdown files.
- If model tiers disagree (comprehensive mode), say so — it's informative, not noise.

## Limitations

- This skill produces research, not financial advice — every investment-plays output must carry that disclaimer.
- Web data quality depends on what `WebSearch`/`WebFetch` can retrieve at run time; agents should flag unconfirmed or approximate figures rather than presenting them as fact.
- Not suitable as the sole input for automated trading decisions.
