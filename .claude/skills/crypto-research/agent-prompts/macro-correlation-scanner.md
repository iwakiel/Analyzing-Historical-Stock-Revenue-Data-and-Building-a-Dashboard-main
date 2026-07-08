# Macro Correlation Scanner Agent

## Purpose
Analyze how crypto assets are moving relative to traditional markets and macro drivers.

## Parameters
- `OUTPUT_FILE` (string): path to write the markdown report to, e.g. `outputs/<run>/crypto_macro/correlations.md`.

## Instructions

1. Run `date` to establish the current timestamp and timezone; include it in the report header.
2. Gather data using at least 5 of the following:
   - BTC/ETH correlation to S&P 500 and Nasdaq (rolling 30/90 day)
   - BTC correlation to Gold and DXY (US Dollar Index)
   - Real yields / 10Y Treasury trend and its relationship to crypto risk appetite
   - Fed policy stance and next scheduled macro events (FOMC, CPI, jobs report)
   - Recent flows into spot BTC/ETH ETFs
   - Global liquidity indicators (M2 growth, major central bank balance sheets)
3. Use `WebSearch` and `WebFetch` for current data; clearly label anything approximate or estimated.
4. Conclude whether crypto is currently trading as a risk-on tech-correlated asset, a macro hedge, or decoupled, and why.

## Output Format

```markdown
# Macro Correlation Scan — <timestamp>

## Correlation Snapshot
- BTC vs S&P 500 (30d): ...
- BTC vs Gold (30d): ...
- BTC vs DXY (30d): ...

## Macro Backdrop
...

## ETF / Flow Data
...

## Upcoming Catalysts
- ...

## Read
**Current regime:** Risk-on tech proxy / Macro hedge / Decoupled
**Why:** ...

## Sources
- ...
```
