# Solana GTM Skill for Claude Code

A Claude Code skill addon for Solana founders focused on go-to-market strategy, branding, and growth.

> **Extends**: Not a core skill — standalone skill for founder GTM needs

## Overview

This skill helps Solana founders bridge the gap between building products and launching them successfully. It provides structured frameworks for:

- Complete go-to-market strategy planning
- Social media and content calendar creation
- Pitch decks for VCs and hackathons
- Founder personal brand development
- Competitive analysis and positioning
- Post-launch metrics tracking

## Key Differentiators

1. **Founder-First Focus**: Written specifically for technical founders who need help with the non-technical side of launching
2. **Solana-Specific**: Framework uses real Solana projects (GMTrade, PYUSD, Tala) as examples
3. **Progressive Loading**: Only loads the sub-skill the user needs, saves tokens
4. **Two Execution Modes**: Hackathon Mode (2-3 weeks) vs Founder Mode (3-6 months)
5. **Production-Grade**: Templates, frameworks, and examples that work today

## Installation

### Quick One-Liner

```bash
curl -fsSL https://aikit.superteam.codes | bash
```

### Manual Install

```bash
git clone https://github.com/YOUR_USERNAME/solana-gtm-skill.git
cd solana-gtm-skill
cp -r skill/ ~/.claude/skills/
cp CLAUDE.md ~/.claude/
```

## Usage Examples

### When to Use

**Use this skill when you're asking Claude to help with:**
- Launching a new DeFi protocol or NFT project
- Building marketing material for investors
- Planning your founder narrative
- Setting up competitive analysis
- Preparing launch metrics

### How It Works

1. User asks for help: "Build me a GTM strategy for my lending protocol"
2. Claude reads skill/SKILL.md and routes to gtm-playbook.md
3. Claude confirms Hackathon vs Founder Mode
4. Claude follows the 7-step framework, asking targeted questions
5. Claude generates a complete, production-ready GTM plan

## Default Stack Preferences (2026)

### Platform Decisions

**Default:** Desktop/WebGL builds
- Unless explicitly specified, design for standard wallet adapters
- Use Phantom, Solflare, in-game, and Web3Auth wallets

**When to Change:**
- PSG1 console → Use PlaySolana.Unity.SDK, vertical 1240x1080, SvalGuard
- Mobile → React Native, Mobile Wallet Adapter, deep linking

### Framework Preferences

**Unity Games:**
- Unity 6.3 LTS
- Solana.Unity-SDK v1.2.9+ via UPM
- .NET 10 / C# 14
- Input: Unity Input System (new input), without PlaySolana when not PSG1

**Mobile (React Native):**
- React Native 0.86 with Expo SDK 56
- Zustand 5.x for state
- MMKV 4.x for storage
- TanStack Query 5.x for RPC

**Web Frontends:**
- Next.js 16 with App Router
- @solana/kit 6.10+ with @solana/react-hooks
- Zustand + React Query

## Progressive Skill Loading

### Skill Discovery

When a user asks for help, Claude fetches only the relevant sub-skill:

| User Request | Fetched Skill | Why |
|--------------|---------------|-----|
| "Build a GTM strategy" | skill/gtm-playbook.md | Core framework with 7 steps |
| "Create content calendar" | skill/social-content-planner.md | Day-by-day calendar generation |
| "Help with pitch deck" | skill/pitch-deck-outline.md | Slide-by-slide outline |
| "Build personal brand" | skill/founder-branding.md | POV + pillars + examples |
| "Analyze competitors" | skill/competitor-analysis.md | Matrix + SWOT |
| "Track metrics" | skill/metrics-dashboard.md | KPI framework |

### Why This Matters

- **Token Efficiency**: Only loads what the user needs
- **Fast Response**: Smaller context windows
- **Focused Work**: Claude can't drift to irrelevant topics

## Agent Routing

Spawn specialized agents for complex tasks:

**For Simple Sub-Skills:** Claude handles everything directly
**For Complex Plans:** Spawn additional agents:

| Task | Agent | When to Use |
|------|-------|-----|
| Unity game architecture | gtm-strategist (itself) + unity-engineer | When UX concerns affect GTM |
| Mobile strategy | gtm-strategist + mobile-engineer | When mobile target affects marketing |
| Research | gtm-strategist + solana-guide | Need ecosystem insights |
| Documentation | gtm-strategist + tech-docs-writer | Need detailed guides |

## Commands

### Custom GTM Commands

**Commands are context-aware based on user mode:**

| Command | Purpose | Mode |
|---------|---------|------|
| `/gtm build` | Generate comprehensive GTM plan | Both |
| `/gtm validate` | Review existing GTM plans | Founder |
| `/gtm summarize` | Extract key takeaways | Founder |

### Example Usage

```
"Use /gtm build to plan my launch"
"Use /gtm validate and help me improve"
"Use /gtm summarize for my investors"
```

## Development Workflow

### Two-Strike Rule

If the build or conversation fails twice on the same issue:
1. Claude will **STOP** immediately
2. Present error output and thought process
3. Ask for user guidance

### .claude/rules/

Auto-loading code rules based on file patterns:

```bash
.claude/rules/
├── typescript.md           # For React Native mobile work
├── dotnet.md               # For Unity/C# integration
└── rust.md                 # For Solana program considerations
```

### Build -> Respond -> Iterate

1. **Understand**: Analyze minimum sub-skill needed
2. **Change**: Surgical edit within sub-skill framework
3. **Build**: Verify output compiles/integrates
4. **Test**: Apply to real example (e.g., LendLens)
5. **If Fails**: Retry once if obvious pattern, then **STOP**

## Platform-Specific Considerations

### Hackathon Mode (< 2 weeks)

- **Focus**: Standout narrative + quick community setup
- **Skip**: Deep competitive analysis, long-term budgets
- **Results**: Demo-ready GTM plans that win competitions

### Founder Mode (3-6 months)

- **Focus**: Sustainable growth + investor readiness
- **Include**: Full competitive matrix, 6-month roadmap, detailed metrics
- **Results**: Real launches with actual metrics

## Key Patterns

### Social Media Hooks

Leverage what already works in Solana ecosystem:

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

## Document Generation

When completing a sub-skill, always generate output in these formats:

1. **Complete Framework**: Walkthrough of all questions
2. **Real-World Example**: Application to a known Solana project
3. **Action Items**: What to do next with the deliverable

## Related Skills

### Through solana-dev-skill (if installed)

- **Frontend**: use frontend-framework-kit.md for wallet UX
- **Programs**: use programs-anchor.md for web3 integration
- **Security**: use security.md for regulatory compliance concerns
- **Testing**: use testing.md for GTM validation metrics

### External Resources

- **solana-ai-kit**: Main platform this skill integrates with
- **solana-game-skill**: Example of skill addon structure
- **Colosseum Copilot**: Startup research and idea validation
- **Solana Foundation**: Ecosystem data and partnerships

## Performance Optimization

### Token Efficiency

- **CLAUDE.md is user message**: Shorter = better adherence
- **Skills load progressively**: No duplicate content loading
- **Smart routing**: Always load least needed sub-skill first

### Caching Patterns

1. **User Profiles**: Cache founder's background and preferences
2. **Project Templates**: Save successful GTM plan structures
3. **Competitor Data**: Store updated Solana ecosystem positioning
4. **Metric Benchmarks**: Cache real project success metrics

## Best Practices

### Developer DOs

1. **Understand GTM**: Resist the urge to skip "non-tech" questions
2. **Be concrete**: Use real Solana examples (GMTrade, PYUSD, Tala)
3. **Follow framework**: Always use the 7-step process
4. **Validate**: Check deliverables are production-ready
5. **Iterate**: Refine examples based on user feedback

### Developer DON'Ts

1. **Skip execution mode**: Always ask Hackathon vs Founder
2. **Give generic advice**: Cite specific Solana ecosystem data
3. **Over-engineer**: Stay within 6 sub-skill boundaries
4. **Avoid feedback**: Ask for user input at each step

### Security Reminders

1. **Data Validation**: Always verify founder input before building plans
2. **Privacy**: Handle sensitive project details securely
3. **Accuracy**: Never make up or guess Solana ecosystem data
4. **Attribution**: Cite real projects when using examples

## Debug Workflow

### When Things Go Wrong

**Two-Strike Rule**: Run `/gtm validate` to check existing plans before starting over

1. **STOP immediately**
2. **Present the full error output**
3. **Show what Claude changed**
4. **Ask for clear direction**
5. **Retry once only if the fix is obvious**

## Common Issues & Solutions

**Issue**: User wants detailed competitive analysis
**Solution**: Route to `competitor-analysis.md` and use its matrix template with real Solana ecosystem data

**Issue**: User asks for blockchain metrics
**Solution**: Delegate to solana-dev-skill via core skill references

**Issue**: User wants marketing headline ideas
**Solution**: Use `founder-branding.md`'s POV worksheet to generate authentic narratives

## Branch Workflow

```bash
git checkout -b feat/gtm-enhancement-DD-MM-YYYY
# Fix formatting, update examples, add test cases
# Never manually create .claude/rules files - they auto-load
```

## Testing

**Always verify with real scenarios:**

```
bash run_against_lendlens.sh
bash run_against_pyusd_simulation.sh
bash run_against_colosseum_startup.sh
```

## Code Quality

### Before Merging

1. **Two-strike rule**: `/gtm validate` and review response
2. **Docs**: Ensure README includes all usage examples
3. **Format**: Use consistent YAML frontmatter
4. **Links**: Verify all skill references are correct

### Quality Gates

- [ ] Build passes with no errors
- [ ] References real Solana ecosystem data
- [ ] Example outputs are production-ready
- [ ] Follows two-strike workflow
- [ ] Progressive loading works correctly
- [ ] Story integrates with solana-dev-skill when present

---

**Main skill entry**: [skill/SKILL.md](skill/SKILL.md)
