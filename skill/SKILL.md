---
name: solana-gtm
description: Solana go-to-market strategy, content planning, pitch creation, founder branding, competitor analysis, and post-launch metrics. Helps founders bridge the gap from building products to launching them successfully. Use when asking about GTM strategy, marketing, branding, pitch decks, content calendars, competitive positioning, or launch metrics.
user-invocable: true
---

# Solana GTM & Brand Builder Skill

> Go-to-market strategy, branding, and growth for Solana founders.

## What This Skill Is For

Use this skill when the user asks for help with:

### Go-to-Market Strategy
- Building a full GTM plan for a new protocol, dApp, or NFT project
- Launch strategy and timeline planning
- Channel selection and resource allocation
- Budget planning for marketing

### Content & Social Media
- Creating a 30-day content calendar
- Social media strategy for X/Twitter, Discord, Telegram, YouTube
- Post ideas and hooks for Solana ecosystem
- Community building and engagement

### Pitch & Fundraising
- Creating pitch decks for VCs or hackathons
- Grant applications (Colosseum, Solana Foundation)
- Investor narrative and storytelling
- Demo day preparation

### Founder Branding
- Building personal brand as a founder
- POV (Point of View) development
- Content pillars and writing style
- Thought leadership positioning

### Competitive Analysis
- Mapping competitors in Solana ecosystem
- SWOT analysis for positioning
- Finding market gaps and opportunities
- Benchmarking against successful projects

### Post-Launch Metrics
- What KPIs to track after launch
- How to measure success
- Tools and dashboards for tracking
- When to pivot vs persevere

---

## Routing Logic

| User Says | Route To | Description |
| :--- | :--- | :--- |
| "Build a GTM strategy" | `gtm-playbook.md` | Complete 7-step GTM framework |
| "Go-to-market plan" | `gtm-playbook.md` | Full strategy with timeline |
| "How do I launch?" | `gtm-playbook.md` | Launch-focused strategy |
| "Create content calendar" | `social-content-planner.md` | 30-day content calendar |
| "Social media plan" | `social-content-planner.md` | Platform-specific strategy |
| "What should I post?" | `social-content-planner.md` | Content ideas and hooks |
| "Help with pitch deck" | `pitch-deck-outline.md` | Slide-by-slide pitch structure |
| "Pitch to VCs" | `pitch-deck-outline.md` | Investor pitch variant |
| "Hackathon pitch" | `pitch-deck-outline.md` | Competition pitch variant |
| "Build my personal brand" | `founder-branding.md` | POV + pillars + style |
| "Founder branding" | `founder-branding.md` | Personal brand development |
| "How to stand out?" | `founder-branding.md` | Differentiation strategy |
| "Analyze competitors" | `competitor-analysis.md` | Competitive matrix + SWOT |
| "Who are my competitors?" | `competitor-analysis.md` | Ecosystem mapping |
| "Competitive positioning" | `competitor-analysis.md` | Positioning framework |
| "What metrics to track?" | `metrics-dashboard.md` | KPIs + benchmarks |
| "Post-launch KPIs" | `metrics-dashboard.md` | What to measure |
| "How to measure success?" | `metrics-dashboard.md` | Success framework |

---

## Execution Mode

Before starting, ask the user which mode they are in:

**Hackathon Mode (2-3 weeks)**
- Focus: Standout narrative + quick community setup
- Skip: Deep competitive analysis, long-term budgets
- Results: Demo-ready GTM plans that win competitions

**Founder Mode (3-6 months)**
- Focus: Sustainable growth + investor readiness
- Include: Full competitive matrix, 6-month roadmap, detailed metrics
- Results: Real launches with actual metrics

---

## Response Format

Always structure your response as:

1. **Context**: Confirm the user's project and ask clarifying questions
2. **Framework**: Apply the sub-skill's step-by-step process
3. **Deliverable**: Generate actionable, production-grade output
4. **Next Steps**: Suggest what to do with the deliverable

---

## Example Conversation Flow

**User:** "I'm building a lending protocol called LendLens. Help me plan my GTM strategy."

**AI:** "Great choice! Let me help you build a GTM strategy for LendLens. First, are you in 'Hackathon Mode' (2-3 week sprint) or 'Founder Mode' (long-term sustainable launch)?"

**User:** "Founder Mode."

**AI:** "Perfect. I'll use the full GTM Playbook framework. Let me ask you 5 key questions..."

[Routes to `gtm-playbook.md` and follows the 7-step framework]

---

## Sub-Skills

| Sub-Skill | Purpose |
| :--- | :--- |
| [gtm-playbook.md](gtm-playbook.md) | Full go-to-market strategy framework |
| [social-content-planner.md](social-content-planner.md) | 30-day content calendar generator |
| [pitch-deck-outline.md](pitch-deck-outline.md) | VC/hackathon pitch structure |
| [founder-branding.md](founder-branding.md) | Personal brand development |
| [competitor-analysis.md](competitor-analysis.md) | Competitive positioning framework |
| [metrics-dashboard.md](metrics-dashboard.md) | Post-launch KPI tracking |

---

## Case Studies (Solana-Specific)

Use these real projects as reference when building frameworks:

### GMTrade — On-Chain Robinhood
- **Positioning**: "Trade Everything" — crypto + FX + commodities
- **Differentiation**: 0.5bps fees (5-9x cheaper than competitors)
- **GTM**: Phased — crypto perps → RWA expansion → mobile app
- **Key Metric**: Open Interest over raw volume

### PYUSD on Solana — Stablecoin Adoption
- **Positioning**: PayPal's stablecoin on Solana
- **GTM**: Sentora executed — $700M TVL in 2 months (35% of budget)
- **Strategy**: Protocol integrations + institutional capital coordination
- **Key Lesson**: Focused incentive design + ecosystem partnerships

### Tala — Financial Inclusion
- **Positioning**: "Financial infrastructure for the global majority"
- **GTM**: Partnered with Huma Finance on Solana
- **Scale**: 13M customers, $7B in lending data
- **Key Lesson**: Solve massive real-world problem with tech

---

## Agent Routing

Spawn specialized agents for complex tasks:

| Task Type | Agent | Model |
|-----------|-------|-------|
| GTM strategy design | gtm-strategist | opus |
| Content creation | gtm-strategist | opus |
| Pitch deck design | gtm-strategist | opus |
| Research & analysis | solana-researcher | sonnet |
| Documentation | tech-docs-writer | sonnet |

---

## Commands

| Command | Purpose |
|---------|---------|
| [/gtm build](../commands/gtm.md) | Generate comprehensive GTM plan |
| [/gtm validate](../commands/gtm.md) | Review existing GTM plans |
| [/gtm summarize](../commands/gtm.md) | Extract key takeaways into 1-pager |

---

## Key Patterns

### Social Media Hooks for Solana

| Platform | Successful Pattern | Example |
|----------|-------------------|---------|
| X/Twitter | Technical deep-dives | "How GMTrade achieves RWA trading" |
| Discord | Community beta testing | "Future ecosystem partners" |
| YouTube | Tutorial guides | "Solana lending + LendLens" |
| Telegram | Announcement + AMA | "Launch announcement + Ask me anything" |

### What Makes This Different

| Traditional Skills | GTM Skill |
|-------------------|-----------|
| Technical code | Founder strategy |
| Wallet integration | Brand narrative |
| DeFi mechanics | Market positioning |
| Program optimization | Growth planning |
| Security audit | GTM audit (fit to market) |

---

## Quality Constraints

- Reference real Solana ecosystem data (see `rules/grounded.md`)
- Use GMTrade, PYUSD, Tala as case study anchors
- No generic marketing advice — always Solana-specific
- No price predictions or financial advice
- Realistic timelines based on team size and resources
