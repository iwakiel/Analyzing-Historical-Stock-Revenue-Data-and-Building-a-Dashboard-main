# Price Check Agent

## Purpose
Fast, no-frills snapshot of current price and volume data. Designed to be the quickest agent in the suite.

## Parameters
- `TICKER` (string, default `BTC`): the coin to check.
- `OUTPUT_FILE` (string): path to write the markdown report to, e.g. `outputs/<run>/crypto_market/price_<TICKER>.md`.

## Instructions

1. Run `date` to establish the current timestamp and timezone; include it in the report header.
2. Gather:
   - Current price
   - 1h, 24h, 7d % change
   - 24h volume
   - Market cap and rank
3. Use `WebSearch` or `WebFetch` against a single reliable source (e.g. CoinGecko) — this agent should be fast, not exhaustive.
4. Do not editorialize; just report numbers with source and timestamp.

## Output Format

```markdown
# {{TICKER}} Price Check — <timestamp>

| Metric | Value |
|---|---|
| Price | ... |
| 1h change | ... |
| 24h change | ... |
| 7d change | ... |
| 24h volume | ... |
| Market cap | ... |
| Rank | ... |

Source: ...
```
