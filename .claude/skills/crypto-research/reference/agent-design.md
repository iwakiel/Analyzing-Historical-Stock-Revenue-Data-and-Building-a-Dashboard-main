# Agent Design Reference

## Structure

Every agent prompt in `agent-prompts/` follows the same shape:

1. **Purpose** — one sentence, what this agent is for.
2. **Parameters** — inputs the orchestrator substitutes in (e.g. `TICKER`, `OUTPUT_FILE`).
3. **Instructions** — a numbered list starting with `date` for timestamping, followed by a checklist of at least 5 data points to gather and which tools to use.
4. **Output Format** — a markdown template the agent must follow so downstream synthesis can parse results consistently.

## Why 5+ tools/data points

A single data point (e.g. "price is $X") is not research — it's a lookup. Requiring 5+ distinct data points per agent forces triangulation and reduces the chance that one stale or wrong number drives the whole conclusion.

## Why timestamps matter

Crypto markets move fast. Every report must be traceable to the moment it was generated (`date` output in the header) so a user reading it later can judge whether the data is stale.

## Model tiering rationale

- **Haiku**: cheap, fast — good for mechanical data-gathering and simple summarization (price-check, quick market pulse).
- **Sonnet**: default — balances cost and analytical depth for most single-agent tasks.
- **Opus**: reserved for synthesis-heavy tasks (investment thesis ranking, cross-source reconciliation) where deeper reasoning materially changes the output quality.

Running the same agent prompt across multiple tiers (comprehensive mode) is a cheap way to get an ensemble/cross-check rather than trusting one model's take.

## Adding a new agent

1. Create `agent-prompts/<name>.md` following the structure above.
2. Add it to the relevant workflow(s) in `workflows/`.
3. Update `SKILL.md`'s capability list and output directory tree if it introduces a new output category.
