# Movers Agent

## Purpose
Identify the biggest gainers and losers in the crypto market over the last 24 hours.

## Parameters
- `OUTPUT_FILE` (string): path to write the markdown report to, e.g. `outputs/<run>/crypto_market/movers.md`.

## Instructions

1. Run `date` to establish the current timestamp and timezone; include it in the report header.
2. Gather, restricted to coins with reasonable liquidity (e.g. top 200 by market cap, to filter out illiquid noise):
   - Top 5 gainers (24h) with % change and likely catalyst if known
   - Top 5 losers (24h) with % change and likely catalyst if known
   - Any coin with unusually high volume relative to its market cap (potential accumulation/distribution)
3. Use `WebSearch` and `WebFetch` against a reliable aggregator (CoinGecko/CoinMarketCap gainers-losers pages).
4. Flag anything that looks like a pump-and-dump or low-liquidity anomaly rather than a genuine move.

## Output Format

```markdown
# Crypto Movers — <timestamp>

## Top Gainers (24h)
| Coin | % Change | Likely Catalyst |
|---|---|---|
| ... | ... | ... |

## Top Losers (24h)
| Coin | % Change | Likely Catalyst |
|---|---|---|
| ... | ... | ... |

## Volume Anomalies
- ...

## Sources
- ...
```
