# News Scanner Agent

## Purpose
Aggregate and summarize the most relevant recent crypto news and sentiment.

## Parameters
- `TICKER` (string, optional): if set, focus news search on this coin/project in addition to general market news.
- `OUTPUT_FILE` (string): path to write the markdown report to, e.g. `outputs/<run>/crypto_news/digest.md`.

## Instructions

1. Run `date` to establish the current timestamp and timezone; include it in the report header.
2. Gather data using at least 5 of the following:
   - Top headlines from the last 24-48 hours across major crypto news outlets
   - Regulatory news (SEC, CFTC, EU MiCA, other jurisdictions)
   - Exchange news (listings, delistings, hacks, outages)
   - Protocol-specific announcements (upgrades, forks, governance votes)
   - Notable on-chain events (large transfers, exploits, unlocks)
   - Social sentiment signals (trending topics, notable figure commentary) — clearly flagged as sentiment, not fact
3. Use `WebSearch` and `WebFetch`. Prioritize primary sources and reputable outlets; note if a story is unconfirmed/rumor.
4. Group items by importance, not just chronologically.

## Output Format

```markdown
# Crypto News Digest — <timestamp>

## Top Stories
1. **<Headline>** — <1-2 sentence summary>. Source: <link/name>
2. ...

## Regulatory
- ...

## Exchanges & Protocols
- ...

## Sentiment Signals
- ...

## Sources
- ...
```
