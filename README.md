# Airline Delay & Bottleneck Diagnostic - A Tool Mastery Series

## About This Series

This is a four-part analytics project where the same business problem is solved end-to-end using a single tool at a time. Excel, SQL, Power BI, and Python, on the exact same dataset. Rather than showcasing four different tools on four different problems, this series is designed to demonstrate depth: understanding how a single analytical question can be approached, validated, and visualized differently depending on the tool, while arriving at consistent, defensible conclusions.

Each folder in this repository represents one full pass at the same diagnostic, using only that tool's native capabilities from data cleaning through final dashboard.

## Business Problem

Flight delays are costly for airlines, airports, and passengers alike. This project investigates December 2015 U.S. domestic flight data to answer four core questions:

1. Which carriers have the worst on-time performance, and is it consistent across airports or carrier-specific?
2. What is the primary driver of delays? Weather, carrier operations, air traffic system congestion, or security?
3. Which airports and routes are the biggest operational bottlenecks?
4. Is there a predictable day-of-week or time-of-day pattern to delays?

## Dataset

Source: [2015 Flight Delays and Cancellations](https://www.kaggle.com/datasets/usdot/flight-delays) (U.S. DOT, via Kaggle), filtered to December 2015, covering all U.S. domestic carriers (~479,000 flights).

## Project Status

| Part | Tool | Status | Link |
|------|------|--------|------|
| 1 | Excel | ✅ Complete | [/excel](./excel) |
| 2 | SQL | ✅ Complete | [/sql](./sql) |
| 3 | Power BI | ✅ Complete | [/powerbi](./powerbi) |
| 4 | Python | 🔲 In Progress | [/python](./python) |

## Part 1: Excel Dashboard

![Excel Dashboard](./excel/dashboard_screenshot.png)

See [/excel/README.md](./excel/README.md) for full methodology and findings.

## Part 2: SQL Analysis

![Cascading Delay Analysis](./sql/screenshots/Cascading_Analysis_Part%20B.png)

Traced delays at the individual aircraft level using window functions, quantified the cascading effect (a late landing inflated the next flight's average departure delay by ~11x), and diagnosed carrier consistency, airport/route bottlenecks, and time-of-day escalation patterns.

See [/sql/README.md](./sql/README.md) for full methodology and findings.

## Part 3: Power BI Dashboard

![Power BI Dashboard](./powerbi/screenshots/Executive_Summary.png)

Built a 5-page interactive dashboard (plus a carrier-level drill-through page) connected live to the MySQL database — executive KPIs, carrier performance with route-level drill-through, a geographic delay-severity map, a cascading-delay visualization tracing individual aircraft, and a live What-If simulator with a dynamic delay-threshold parameter.

See [/powerbi/README.md](./powerbi/README.md) for full methodology and findings.

---
---
*This README is updated as each part of the series is completed.*
