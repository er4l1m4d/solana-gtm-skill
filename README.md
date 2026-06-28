# Solana GTM Skill

> Turn your Solana project from product to market. A production-grade go-to-market co-pilot for founders and builders.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Solana AI Kit](https://img.shields.io/badge/Solana_AI_Kit-Compatible-blue)](https://github.com/solanabr/solana-ai-kit)

## The Problem

You built something incredible on Solana. Now what?

Founders consistently struggle with the non-technical side of launching:
- How do I position my project against competitors?
- What does a 30-day launch content calendar look like?
- How do I build my personal brand as a founder?
- What metrics should I track after launch?
- How do I create a pitch deck that VCs actually want to see?

**This skill answers all of those questions.**

## What This Skill Does

`solana-gtm-skill` is an AI co-pilot that guides Solana founders through every stage of go-to-market:

| Sub-Skill | What It Generates |
| :--- | :--- |
| **GTM Playbook** | Full go-to-market strategy: positioning, channels, timeline, budget |
| **Social Content Planner** | 30-day content calendar with Solana-specific hooks |
| **Pitch Deck Outline** | VC/hackathon pitch structure with slide-by-slide guidance |
| **Founder Branding** | Personal brand POV, content pillars, writing style, example posts |
| **Competitor Analysis** | Competitive positioning framework with real Solana ecosystem data |
| **Metrics Dashboard** | Post-launch KPIs: what to track, how to track it, what good looks like |

## How It Works

1. User invokes the skill (e.g., "Help me build a GTM strategy for my DeFi protocol")
2. AI reads `SKILL.md` and routes to the appropriate sub-skill
3. AI follows the framework, asking the user targeted questions
4. AI generates actionable, production-ready deliverables

## Installation

```bash
# Clone this repo
git clone https://github.com/YOUR_USERNAME/solana-gtm-skill.git

# Run the installer
cd solana-gtm-skill
./install.sh
```

Or manually copy the `skill/` folder into your Solana AI Kit's `skills/` directory.

### Custom Install (Full Control)

```bash
./install-custom.sh
```

The custom installer lets you:
- Choose install location (personal `~/.claude/skills/` or project `./.claude/skills/`)
- Choose where to place `CLAUDE.md`

## Example Usage

```
User: "I'm building a lending protocol on Solana called LendLens. Help me plan my go-to-market strategy."

AI: "Let's build your GTM strategy. I'll ask you a few questions about your target users,
     unique value proposition, timeline, and channels..."

[AI follows the GTM Playbook framework, asks 5-7 questions, then generates a complete strategy]
```

```
User: "Create a 30-day content calendar for my NFT launch."

AI: [Routes to social-content-planner.md and generates day-by-day calendar]
```

```
User: "Help me build my personal brand as a Solana founder."

AI: [Routes to founder-branding.md and generates POV, pillars, writing style, example posts]
```

## Who This Is For

- **Hackathon Participants**: Get a fast, scrappy GTM plan to win
- **Established Founders**: Build a sustainable, long-term brand strategy
- **Technical Builders**: No marketing expertise required — the skill guides you

## Execution Modes

The skill operates in two modes depending on your timeline:

| Mode | Timeline | Focus |
| :--- | :--- | :--- |
| **Hackathon Mode** | 2-3 weeks | Standout narrative, quick community setup, demo-ready GTM |
| **Founder Mode** | 3-6 months | Sustainable growth, investor readiness, long-term brand |

## Inspiration

This skill was built by analyzing successful Solana go-to-market strategies:

- **GMTrade** — "On-Chain Robinhood" positioning, RWA expansion, 0.5bps fees
- **PYUSD on Solana** — $700M TVL in 2 months via Sentora
- **Tala** — Financial inclusion through tokenized lending (13M customers)
- **Raposa Coffee** — NFT brand to real-world business (Miami Heat partner)

## Roadmap

- [x] GTM Playbook framework
- [x] Social Content Planner
- [x] Pitch Deck Outline
- [x] Founder Branding
- [x] Competitor Analysis
- [x] Metrics Dashboard
- [ ] Video demo
- [ ] Case study examples

## Contributing

We welcome PRs! If you have a successful Solana launch story, consider adding it as a case study.

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/my-feature-28-06-2026`
3. Make your changes
4. Submit a pull request

## License

MIT — use it, modify it, ship it.

---

Built for the [Superteam Brasil Solana AI Kit Hackathon](https://github.com/solanabr/skill-bounty)
