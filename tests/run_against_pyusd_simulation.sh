#!/bin/sh
# run_against_pyusd_simulation.sh — Test GTM skill against PYUSD scenario
# Simulates: "We're launching PYUSD on Solana. Help us plan adoption strategy."
# Verifies: stablecoin-specific content, institutional strategy, metrics

set -e

SKILL_DIR="$(cd "$(dirname "$0")/../skill" && pwd)"
ERRORS=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; ERRORS=$((ERRORS + 1)); }
section() { printf "\n\033[1m%s\033[0m\n" "$1"; }

section "PYUSD Scenario: Stablecoin Adoption on Solana"

# ── 1. PYUSD case study in SKILL.md ─────────────────────────────────

section "1. Case study presence"

if grep -qi "PYUSD" "$SKILL_DIR/SKILL.md" 2>/dev/null; then
  pass "PYUSD referenced in SKILL.md"
else
  fail "PYUSD not referenced in SKILL.md"
fi

if grep -qi "Sentora" "$SKILL_DIR/SKILL.md" 2>/dev/null; then
  pass "Sentora execution partner referenced"
else
  fail "Sentora execution partner not referenced"
fi

if grep -qi "\$700M" "$SKILL_DIR/SKILL.md" 2>/dev/null; then
  pass "PYUSD $700M TVL metric present"
else
  fail "PYUSD $700M TVL metric missing"
fi

# ── 2. Stablecoin-relevant GTM content ──────────────────────────────

section "2. Stablecoin-relevant content in GTM playbook"

GTM="$SKILL_DIR/gtm-playbook.md"

if grep -qi "institutional\|partnership\|integration" "$GTM" 2>/dev/null; then
  pass "GTM playbook covers partnerships/integrations"
else
  fail "GTM playbook missing partnership content"
fi

if grep -qi "budget\|allocation" "$GTM" 2>/dev/null; then
  pass "GTM playbook covers budget planning"
else
  fail "GTM playbook missing budget planning"
fi

# ── 3. Protocol integration strategy ────────────────────────────────

section "3. Protocol integration references"

# Check across all skill files (ecosystem refs are in sub-skills, not SKILL.md)
found_integration=0
for md in "$SKILL_DIR"/*.md; do
  if grep -qi "Jupiter\|Raydium\|Orca" "$md" 2>/dev/null; then
    found_integration=1
    break
  fi
done

if [ "$found_integration" -eq 1 ]; then
  pass "Ecosystem integrations referenced (in sub-skills)"
else
  fail "Missing ecosystem integration references"
fi

# ── 4. Metrics for stablecoin adoption ──────────────────────────────

section "4. Stablecoin metrics in metrics-dashboard.md"

METRICS="$SKILL_DIR/metrics-dashboard.md"

if grep -qi "TVL\|Total Value Locked" "$METRICS" 2>/dev/null; then
  pass "TVL metric present"
else
  fail "TVL metric missing"
fi

if grep -qi "retention\|retention rate" "$METRICS" 2>/dev/null; then
  pass "Retention metric present"
else
  fail "Retention metric missing"
fi

if grep -qi "DAU\|daily active\|active users" "$METRICS" 2>/dev/null; then
  pass "Active users metric present"
else
  fail "Active users metric missing"
fi

# ── 5. Content calendar for launch ──────────────────────────────────

section "5. Content calendar coverage"

CONTENT="$SKILL_DIR/social-content-planner.md"

if grep -q "Phase 1: Pre-Launch" "$CONTENT" 2>/dev/null; then
  pass "Pre-launch phase present"
else
  fail "Pre-launch phase missing"
fi

if grep -q "Phase 2: Launch Week" "$CONTENT" 2>/dev/null; then
  pass "Launch week phase present"
else
  fail "Launch week phase missing"
fi

if grep -q "Phase 3: Post-Launch" "$CONTENT" 2>/dev/null; then
  pass "Post-launch phase present"
else
  fail "Post-launch phase missing"
fi

# ── 6. Solana ecosystem hooks ────────────────────────────────────────

section "6. Solana ecosystem hooks"

if grep -qi "@solana\|@SuperteamDAO\|@ColosseumHQ" "$CONTENT" 2>/dev/null; then
  pass "Solana ecosystem accounts referenced"
else
  fail "Missing Solana ecosystem account references"
fi

if grep -qi "#Solana\|#SolanaEcosystem" "$CONTENT" 2>/dev/null; then
  pass "Solana hashtags present"
else
  fail "Solana hashtags missing"
fi

# ── Summary ──────────────────────────────────────────────────────────

section "Summary"
if [ "$ERRORS" -eq 0 ]; then
  printf "\n\033[32mPYUSD scenario: all checks passed.\033[0m\n"
  exit 0
else
  printf "\n\033[31m%d error(s) in PYUSD scenario.\033[0m\n" "$ERRORS"
  exit 1
fi
