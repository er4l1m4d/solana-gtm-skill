# Metrics Dashboard — Post-Launch KPI Tracker

Define, track, and benchmark key metrics for Solana projects. Includes pre-launch, launch, and post-launch metrics with Solana-specific benchmarks.

---

## When to Use

Use this when a user says:
- "What metrics should I track?"
- "Post-launch KPIs for my project"
- "How to measure success for my protocol?"
- "What does good look like for [metric]?"
- "How do I know if I'm on track?"

## Execution Mode

**Hackathon Mode**
- Focus: Quick metrics for demo day
- Skip: Long-term tracking, complex dashboards
- Goal: Show traction in 2-3 weeks

**Founder Mode**
- Focus: Comprehensive metrics framework
- Include: Full dashboard, benchmarks, tracking tools
- Goal: Data-driven decision making

---

## The Framework: 3-Tier Metrics System

### Tier 1: Vanity Metrics (Nice to Have)

These look good on paper but don't drive business decisions.

| Metric | What It Measures | Why It's Vanity |
| :--- | :--- | :--- |
| Twitter Followers | Brand awareness | Followers don't equal users |
| Discord Members | Community size | Members don't equal engagement |
| GitHub Stars | Developer interest | Stars don't equal contributions |
| Press Mentions | Media coverage | Coverage doesn't equal adoption |

**When to Use Vanity Metrics:**
- Fundraising (investors like big numbers)
- Partnerships (partners like social proof)
- Hiring (candidates like popular projects)

**When to Ignore Vanity Metrics:**
- Product decisions (users matter, not followers)
- Revenue decisions (fees matter, not stars)
- Growth decisions (retention matters, not acquisition)

---

### Tier 2: Actionable Metrics (Must Track)

These directly impact business decisions and product development.

#### Pre-Launch Metrics

| Metric | What It Measures | How to Track | Good | Great |
| :--- | :--- | :--- | :--- | :--- |
| **Waitlist Signups** | Interest before launch | Landing page tool | 100 | 1,000+ |
| **Discord Members** | Early community | Discord analytics | 50 | 500+ |
| **X/Twitter Followers** | Social awareness | X/Twitter analytics | 200 | 2,000+ |
| **Newsletter Subscribers** | Email list | Email tool | 50 | 500+ |
| **Beta Testers** | Product feedback | Manual tracking | 10 | 100+ |

#### Launch Metrics (Day 1-7)

| Metric | What It Measures | How to Track | Good | Great |
| :--- | :--- | :--- | :--- | :--- |
| **Total Value Locked (TVL)** | Liquidity depth | DefiLlama | $10K | $100K+ |
| **Active Users** | Adoption | On-chain data | 50 | 500+ |
| **Transaction Volume** | Usage | On-chain data | $100K | $1M+ |
| **Fees Generated** | Revenue potential | On-chain data | $100 | $1,000+ |
| **New Wallets** | User acquisition | On-chain data | 20 | 200+ |

#### Post-Launch Metrics (Month 1-6)

| Metric | What It Measures | How to Track | Good | Great | Exceptional |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **TVL Growth** | Liquidity trend | DefiLlama | +50%/mo | +100%/mo | +200%/mo |
| **User Retention (D7)** | User stickiness | Analytics | 20% | 40% | 60%+ |
| **User Retention (D30)** | Long-term value | Analytics | 10% | 20% | 30%+ |
| **Transaction Volume** | Usage trend | On-chain data | $1M/mo | $10M/mo | $100M/mo |
| **Revenue (Fees)** | Business sustainability | On-chain data | $1K/mo | $10K/mo | $100K/mo |
| **Open Interest (Perps)** | Position size | On-chain data | $500K | $5M | $50M+ |
| **LP Yield** | Liquidity provider returns | DefiLlama | 5% APR | 15% APR | 30%+ APR |

---

### Tier 3: North Star Metric (The One Metric That Matters)

Your North Star Metric is the single metric that best captures the value you deliver to users.

**How to Choose Your North Star:**

| Project Type | North Star Metric | Why |
| :--- | :--- | :--- |
| **DEX / Perps** | Trading Volume | Revenue + usage + liquidity |
| **Lending** | Total Value Locked | Liquidity depth + user trust |
| **NFT Marketplace** | Volume | Sales + engagement + fees |
| **Wallet** | Active Users | Adoption + retention |
| **Infrastructure** | API Calls | Usage + dependency |

**Examples:**
- **GMTrade**: Trading Volume (drives fees, shows usage)
- **Kamino**: TVL (shows liquidity depth, user trust)
- **Phantom**: Active Users (adoption + retention)

---

## Solana-Specific Benchmarks

### By Category

| Category | Metric | Good | Great | Exceptional | Source |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **DEX** | Daily Volume | $100K | $1M | $10M+ | DefiLlama |
| **DEX** | TVL | $1M | $10M | $100M+ | DefiLlama |
| **Lending** | TVL | $1M | $10M | $100M+ | DefiLlama |
| **Perps** | Open Interest | $500K | $5M | $50M+ | On-chain |
| **Perps** | Daily Volume | $100K | $1M | $10M+ | On-chain |
| **NFT** | Daily Volume | $10K | $100K | $1M+ | Magic Eden |
| **Wallet** | Monthly Active Users | 1K | 10K | 100K+ | App analytics |

### By Stage

| Stage | Timeframe | Key Metrics | Benchmarks |
| :--- | :--- | :--- | :--- |
| **Pre-Launch** | -4 to 0 weeks | Waitlist, Discord, Followers | 100 waitlist, 50 Discord, 200 followers |
| **Launch** | Week 1 | TVL, Users, Volume | $10K TVL, 50 users, $100K volume |
| **Growth** | Month 1-3 | Retention, Growth Rate | 20% D7 retention, 50% TVL growth/mo |
| **Scale** | Month 3-6 | Revenue, Market Share | $10K revenue/mo, 1% market share |

---

## Metrics Tracking Tools

### Solana-Specific Tools

| Tool | Purpose | Cost |
| :--- | :--- | :--- |
| **DefiLlama** | TVL, fees, revenue tracking | Free |
| **Dune Analytics** | Custom on-chain queries | Free (community) |
| **Solscan** | Transaction/account explorer | Free |
| **Helius** | RPC + analytics | Free tier + paid |
| **Step Finance** | Portfolio tracking | Free |

### General Analytics Tools

| Tool | Purpose | Cost |
| :--- | :--- | :--- |
| **Mixpanel** | User analytics | Free tier + paid |
| **Amplitude** | Product analytics | Free tier + paid |
| **Google Analytics** | Web analytics | Free |
| **Hotjar** | User behavior | Free tier + paid |

### Dashboard Setup

**Recommended Dashboard Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│                    METRICS DASHBOARD                         │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   TVL       │  │   Users     │  │   Volume    │         │
│  │  $1.2M      │  │   1,234     │  │   $5.2M     │         │
│  │  +23% MoM   │  │   +45% MoM  │  │   +67% MoM  │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Fees      │  │   Retention │  │   NPS       │         │
│  │  $12.5K     │  │   42% D7    │  │   72        │         │
│  │  +18% MoM   │  │   +5% MoM   │  │   +8 MoM    │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │              TVL CHART (30 days)                    │    │
│  │  ▁▂▃▄▅▆▇████████████████████████████████████       │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

---

## Metrics Review Cadence

### Daily Metrics (Operational)
| Metric | Review | Action if Off-Track |
| :--- | :--- | :--- |
| Active Users | Daily | Investigate user drop-off |
| Transaction Volume | Daily | Check for issues |
| Fees Generated | Daily | Monitor revenue |

### Weekly Metrics (Tactical)
| Metric | Review | Action if Off-Track |
| :--- | :--- | :--- |
| TVL Growth | Weekly | Review liquidity incentives |
| User Retention | Weekly | Improve onboarding |
| Community Growth | Weekly | Adjust content strategy |

### Monthly Metrics (Strategic)
| Metric | Review | Action if Off-Track |
| :--- | :--- | :--- |
| Revenue | Monthly | Review business model |
| Market Share | Monthly | Adjust positioning |
| NPS | Monthly | Improve user experience |

---

## Metrics Reporting Template

### Weekly Report
```
# [PROJECT NAME] — Week [X] Metrics Report

## Key Metrics
- **TVL**: $[X] ([+/-X%] vs last week)
- **Active Users**: [X] ([+/-X%] vs last week)
- **Volume**: $[X] ([+/-X%] vs last week)
- **Fees**: $[X] ([+/-X%] vs last week)

## Highlights
- [Positive metric 1]
- [Positive metric 2]

## Concerns
- [Negative metric 1]
- [Negative metric 2]

## Action Items
- [Action 1]
- [Action 2]

## Next Week Focus
- [Focus area 1]
- [Focus area 2]
```

### Monthly Report
```
# [PROJECT NAME] — Month [X] Metrics Report

## Executive Summary
[1 paragraph summary of the month]

## Key Metrics (Month over Month)
| Metric | Last Month | This Month | Change |
| :--- | :--- | :--- | :--- |
| TVL | $[X] | $[X] | [+/-X%] |
| Users | [X] | [X] | [+/-X%] |
| Volume | $[X] | $[X] | [+/-X%] |
| Revenue | $[X] | $[X] | [+/-X%] |

## Highlights
- [Achievement 1]
- [Achievement 2]
- [Achievement 3]

## Challenges
- [Challenge 1]
- [Challenge 2]

## Lessons Learned
- [Lesson 1]
- [Lesson 2]

## Next Month Focus
- [Focus area 1]
- [Focus area 2]
- [Focus area 3]
```

---

## When to Pivot vs Persevere

### Persevere If:
- Metrics are improving (even slowly)
- Users are retained (D7 > 20%)
- You're learning from user feedback
- The market is growing
- You have runway

### Pivot If:
- Metrics are flat or declining
- Users don't come back (D7 < 10%)
- Users say they don't need your product
- The market is shrinking
- You're running out of runway

### Signs You Need to Pivot:
1. **No Growth**: TVL/users flat for 4+ weeks
2. **No Retention**: D7 retention < 10%
3. **No Revenue**: Zero fees after 3 months
4. **No Engagement**: Discord dead, Twitter silent
5. **No Interest**: Can't raise funding, can't hire

---

## Next Steps

After setting up the metrics dashboard, suggest:
1. "Want to define your North Star Metric using `gtm-playbook.md`?"
2. "Should we create a pitch deck that highlights your metrics using `pitch-deck-outline.md`?"
3. "Let's build content around your metrics using `social-content-planner.md`"
4. "Want to benchmark against competitors using `competitor-analysis.md`?"

---

## Key Principles

1. **Measure What Matters**: Vanity metrics are noise, actionable metrics are signal
2. **Track Consistently**: Same metrics, same cadence, every week
3. **Act on Data**: Metrics without action are useless
4. **Be Honest**: Bad metrics are better than no metrics
5. **Iterate**: Your metrics will change as you grow
