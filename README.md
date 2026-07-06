# Stock Revenue Dashboard — Tesla & GameStop

Extracting stock prices from the yfinance API, scraping quarterly revenue
tables from the web with BeautifulSoup, and combining both into interactive
Plotly dashboards that compare share price against actual revenue.

Built as part of the IBM Data Science Professional Certificate. The premise:
an investment firm wants to see whether price action tracks fundamentals —
Tesla and GameStop make a nice contrast, one where the divergence between
revenue and price (GME, 2021) is the entire story.

## What it demonstrates

- **API extraction** — historical price data via `yfinance` ticker objects
- **Web scraping** — parsing HTML revenue tables with `requests` + `BeautifulSoup`
- **Data cleaning** — stripping currency formatting, handling empty quarters
- **Visualization** — dual-pane Plotly dashboards (price vs. revenue, shared timeline)

## Run it

```bash
pip install yfinance bs4 plotly pandas requests
jupyter notebook stock_revenue_dashboard.ipynb
```

Run all cells; the two dashboards render at the bottom of the notebook.

## Files

| File | Purpose |
|---|---|
| `stock_revenue_dashboard.ipynb` | Full extraction → cleaning → dashboard workflow |
