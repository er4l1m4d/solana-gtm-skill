#!/bin/sh
# run_against_colosseum_startup.sh — Test GTM skill against Colosseum startup scenario
# Simulates: "We're a Colosseum hackathon team. Help us pitch and launch."
# Verifies: hackathon mode, pitch deck, quick-launch strategy

set -e

SKILL_DIR="$(cd "$(dirname "$0")/../skill" && pwd)"
ERRORS=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; ERRORS=$((ERRORS + 1)); }
section() { printf "\n\033[1m%s\033[0m\n" "$1"; }

section "Colosseum Startup Scenario: Hackathon Team"

# ── 1. Hackathon mode in all sub-skills ─────────────────────────────

section "1. Hackathon mode presence"

for md in "$SKILL_DIR"/*.md; do
  fname="$(basename "$md")"
  if grep -q "Hackathon Mode" "$md" 2>/dev/null; then
    pass "$fname — has Hackathon Mode"
  else
    fail "$fname — missing Hackathon Mode"
  fi
done

# ── 2. Pitch deck hackathon variant ──────────────────────────────────

section "2. Hackathon pitch structure"

PITCH="$SKILL_DIR/pitch-deck-outline.md"

if grep -q "Variant A: Hackathon Pitch" "$PITCH" 2>/dev/null; then
  pass "Hackathon pitch variant present"
else
  fail "Hackathon pitch variant missing"
fi

if grep -q "5-7 slides" "$PITCH" 2>/dev/null; then
  pass "5-7 slide count specified"
else
  fail "5-7 slide count missing"
fi

# Check required hackathon slides
check_slide() {
  slide="$1"
  if grep -qi "$slide" "$PITCH" 2>/dev/null; then
    pass "Slide: $slide"
  else
    fail "Slide missing: $slide"
  fi
}

check_slide "Title Slide"
check_slide "The Problem"
check_slide "The Solution"
check_slide "Live Demo"
check_slide "How It Works"
check_slide "Traction"
check_slide "The Ask"

# ── 3. Quick-launch content strategy ────────────────────────────────

section "3. Quick-launch content"

CONTENT="$SKILL_DIR/social-content-planner.md"

if grep -qi "compress\|2-week\|quick" "$CONTENT" 2>/dev/null; then
  pass "Compressed timeline option present"
else
  fail "Missing compressed timeline option"
fi

# ── 4. Colosseum references ─────────────────────────────────────────

section "4. Colosseum references"

if grep -qi "Colosseum" "$SKILL_DIR/SKILL.md" 2>/dev/null; then
  pass "Colosseum referenced in SKILL.md"
else
  fail "Colosseum not referenced in SKILL.md"
fi

if grep -qi "Colosseum" "$PITCH" 2>/dev/null; then
  pass "Colosseum referenced in pitch deck"
else
  fail "Colosseum not referenced in pitch deck"
fi

if grep -qi "Colosseum" "$CONTENT" 2>/dev/null; then
  pass "Colosseum referenced in content planner"
else
  fail "Colosseum not referenced in content planner"
fi

# ── 5. Zero-budget option ───────────────────────────────────────────

section "5. Zero-budget hackathon option"

GTM="$SKILL_DIR/gtm-playbook.md"

if grep -qi "\$0\|zero.*budget\|no.*budget" "$GTM" 2>/dev/null; then
  pass "Zero-budget option present"
else
  fail "Zero-budget option missing"
fi

# ── 6. Demo-focused content ─────────────────────────────────────────

section "6. Demo-focused content"

if grep -qi "demo\|screenshots\|video" "$PITCH" 2>/dev/null; then
  pass "Demo content present in pitch"
else
  fail "Demo content missing from pitch"
fi

# ── 7. Agent routing for hackathon ──────────────────────────────────

section "7. Agent routing"

if grep -qi "gtm-strategist\|solana-researcher" "$SKILL_DIR/SKILL.md" 2>/dev/null; then
  pass "Agent routing present"
else
  fail "Agent routing missing"
fi

# ── Summary ──────────────────────────────────────────────────────────

section "Summary"
if [ "$ERRORS" -eq 0 ]; then
  printf "\n\033[32mColosseum startup scenario: all checks passed.\033[0m\n"
  exit 0
else
  printf "\n\033[31m%d error(s) in Colosseum scenario.\033[0m\n" "$ERRORS"
  exit 1
fi
