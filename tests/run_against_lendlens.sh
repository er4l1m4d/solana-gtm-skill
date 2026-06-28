#!/bin/sh
# run_against_lendlens.sh — Test GTM skill against LendLens scenario
# Simulates: "I'm building a lending protocol called LendLens. Help me plan my GTM strategy."
# Verifies: routing, framework steps, Solana-specific content, deliverables

set -e

SKILL_DIR="$(cd "$(dirname "$0")/../skill" && pwd)"
ERRORS=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; ERRORS=$((ERRORS + 1)); }
section() { printf "\n\033[1m%s\033[0m\n" "$1"; }

section "LendLens Scenario: Lending Protocol GTM"

# ── 1. Routing check ────────────────────────────────────────────────

section "1. Routing"

# SKILL.md should route "GTM strategy" to gtm-playbook.md
if grep -q "gtm-playbook.md" "$SKILL_DIR/SKILL.md"; then
  pass "SKILL.md routes to gtm-playbook.md"
else
  fail "SKILL.md missing route to gtm-playbook.md"
fi

# LendLens example should exist in SKILL.md
if grep -qi "LendLens" "$SKILL_DIR/SKILL.md"; then
  pass "LendLens referenced in SKILL.md"
else
  fail "LendLens not referenced in SKILL.md"
fi

# ── 2. GTM Playbook 7-step framework ────────────────────────────────

section "2. 7-Step GTM Framework"

GTM="$SKILL_DIR/gtm-playbook.md"

check_step() {
  step="$1"
  if grep -q "$step" "$GTM" 2>/dev/null; then
    pass "Step found: $step"
  else
    fail "Step missing: $step"
  fi
}

check_step "Step 1: Define Your Unique Value Proposition"
check_step "Step 2: Understand Your Competition"
check_step "Step 3: Define Your Channels"
check_step "Step 4: Build Your Content Calendar"
check_step "Step 5: Plan Your Budget"
check_step "Step 6: Define Your Success Metrics"
check_step "Step 7: Create Your 6-Month Roadmap"

# ── 3. LendLens-specific content in playbook ────────────────────────

section "3. LendLens content in GTM playbook"

if grep -qi "lending" "$GTM" 2>/dev/null; then
  pass "GTM playbook references lending"
else
  fail "GTM playbook missing lending references"
fi

# Check for LendLens example output
if grep -qi "LendLens" "$GTM" 2>/dev/null; then
  pass "GTM playbook includes LendLens example"
else
  fail "GTM playbook missing LendLens example"
fi

# ── 4. Final deliverable template ───────────────────────────────────

section "4. Final deliverable structure"

if grep -q "Executive Summary" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Executive Summary"
else
  fail "Deliverable missing Executive Summary"
fi

if grep -q "Positioning" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Positioning"
else
  fail "Deliverable missing Positioning"
fi

if grep -q "Competitive Analysis" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Competitive Analysis"
else
  fail "Deliverable missing Competitive Analysis"
fi

if grep -q "Channel Strategy" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Channel Strategy"
else
  fail "Deliverable missing Channel Strategy"
fi

if grep -q "Content Calendar" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Content Calendar"
else
  fail "Deliverable missing Content Calendar"
fi

if grep -q "Budget Allocation" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Budget Allocation"
else
  fail "Deliverable missing Budget Allocation"
fi

if grep -q "Success Metrics" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Success Metrics"
else
  fail "Deliverable missing Success Metrics"
fi

if grep -q "Roadmap" "$GTM" 2>/dev/null; then
  pass "Deliverable includes Roadmap"
else
  fail "Deliverable missing Roadmap"
fi

# ── 5. Solana-specific benchmarks ───────────────────────────────────

section "5. Solana benchmarks"

if grep -q "TVL" "$GTM" 2>/dev/null; then
  pass "TVL benchmark present"
else
  fail "TVL benchmark missing"
fi

if grep -q "Active Users" "$GTM" 2>/dev/null; then
  pass "Active Users benchmark present"
else
  fail "Active Users benchmark missing"
fi

# ── 6. Cross-references to sub-skills ───────────────────────────────

section "6. Sub-skill cross-references"

if grep -q "social-content-planner.md" "$GTM" 2>/dev/null; then
  pass "References social-content-planner.md"
else
  fail "Missing reference to social-content-planner.md"
fi

if grep -q "pitch-deck-outline.md" "$GTM" 2>/dev/null; then
  pass "References pitch-deck-outline.md"
else
  fail "Missing reference to pitch-deck-outline.md"
fi

if grep -q "metrics-dashboard.md" "$GTM" 2>/dev/null; then
  pass "References metrics-dashboard.md"
else
  fail "Missing reference to metrics-dashboard.md"
fi

if grep -q "competitor-analysis.md" "$GTM" 2>/dev/null; then
  pass "References competitor-analysis.md"
else
  fail "Missing reference to competitor-analysis.md"
fi

# ── Summary ──────────────────────────────────────────────────────────

section "Summary"
if [ "$ERRORS" -eq 0 ]; then
  printf "\n\033[32mLendLens scenario: all checks passed.\033[0m\n"
  exit 0
else
  printf "\n\033[31m%d error(s) in LendLens scenario.\033[0m\n" "$ERRORS"
  exit 1
fi
