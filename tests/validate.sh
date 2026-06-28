#!/bin/sh
# validate.sh — Structural validation for solana-gtm-skill
# Checks: file existence, frontmatter, cross-references, required sections
# Exit 0 = pass, Exit 1 = fail with diagnostic output

set -e

SKILL_DIR="$(cd "$(dirname "$0")/../skill" && pwd)"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; ERRORS=$((ERRORS + 1)); }
section() { printf "\n\033[1m%s\033[0m\n" "$1"; }

# ── 1. Required files exist ──────────────────────────────────────────

section "1. File existence"

REQUIRED_FILES="
  skill/SKILL.md
  skill/gtm-playbook.md
  skill/social-content-planner.md
  skill/pitch-deck-outline.md
  skill/founder-branding.md
  skill/competitor-analysis.md
  skill/metrics-dashboard.md
  agents/gtm-agent.md
  commands/gtm.md
  rules/grounded.md
  install.sh
  install-custom.sh
  LICENSE
  CLAUDE.md
  README.md
"

for f in $REQUIRED_FILES; do
  if [ -f "$ROOT_DIR/$f" ]; then
    pass "$f"
  else
    fail "$f missing"
  fi
done

# ── 2. Frontmatter validation ────────────────────────────────────────
# Only SKILL.md needs YAML frontmatter (entry point for skill discovery)
# Sub-skills are loaded by SKILL.md, not discovered independently

section "2. YAML frontmatter (SKILL.md only)"

SKILL_MD="$SKILL_DIR/SKILL.md"
first_line="$(head -1 "$SKILL_MD")"
if [ "$first_line" = "---" ]; then
  # Check closing --- exists within first 10 lines
  has_close=$(sed -n '2,10p' "$SKILL_MD" | grep -c "^---" || true)
  if [ "$has_close" -gt 0 ]; then
    # Check required fields
    has_name=$(sed -n '2,10p' "$SKILL_MD" | grep -c "^name:" || true)
    has_desc=$(sed -n '2,10p' "$SKILL_MD" | grep -c "^description:" || true)
    if [ "$has_name" -gt 0 ] && [ "$has_desc" -gt 0 ]; then
      pass "SKILL.md — valid frontmatter"
    else
      fail "SKILL.md — missing name or description in frontmatter"
    fi
  else
    fail "SKILL.md — unclosed frontmatter (no closing ---)"
  fi
else
  fail "SKILL.md — no opening --- for frontmatter"
fi

# ── 3. Cross-reference validation ────────────────────────────────────

section "3. Cross-references (sub-skill links in SKILL.md)"

# Extract linked files from SKILL.md routing table
refs=$(grep -oP '\[.*?\]\((.*?\.md)\)' "$SKILL_DIR/SKILL.md" | grep -oP '\(.*?\)' | tr -d '()' || true)

for ref in $refs; do
  # Handle relative paths from skill/
  target="$SKILL_DIR/$ref"
  if [ -f "$target" ]; then
    pass "SKILL.md → $ref"
  else
    fail "SKILL.md → $ref (file not found)"
  fi
done

# Check command references
cmd_refs=$(grep -oP '\.\./commands/.*?\.md' "$SKILL_DIR/SKILL.md" || true)
for ref in $cmd_refs; do
  resolved="$SKILL_DIR/$ref"
  if [ -f "$resolved" ]; then
    pass "SKILL.md → $ref"
  else
    fail "SKILL.md → $ref (file not found)"
  fi
done

# ── 4. Required sections per sub-skill ───────────────────────────────

section "4. Required sections in sub-skills"

check_section() {
  file="$1"
  section_name="$2"
  if grep -q "^## $section_name" "$file" 2>/dev/null; then
    pass "$(basename "$file") — has '## $section_name'"
  else
    fail "$(basename "$file") — missing '## $section_name'"
  fi
}

# GTM Playbook
check_section "$SKILL_DIR/gtm-playbook.md" "When to Use"
check_section "$SKILL_DIR/gtm-playbook.md" "Execution Mode"
check_section "$SKILL_DIR/gtm-playbook.md" "The Framework: 7-Step GTM Process"
check_section "$SKILL_DIR/gtm-playbook.md" "Key Principles"

# Social Content Planner
check_section "$SKILL_DIR/social-content-planner.md" "When to Use"
check_section "$SKILL_DIR/social-content-planner.md" "Execution Mode"
check_section "$SKILL_DIR/social-content-planner.md" "The Framework: 3-Phase Content Calendar"
check_section "$SKILL_DIR/social-content-planner.md" "Key Principles"

# Pitch Deck Outline
check_section "$SKILL_DIR/pitch-deck-outline.md" "When to Use"
check_section "$SKILL_DIR/pitch-deck-outline.md" "Execution Mode"
check_section "$SKILL_DIR/pitch-deck-outline.md" "The Framework: Two Pitch Variants"
check_section "$SKILL_DIR/pitch-deck-outline.md" "Key Principles"

# Founder Branding
check_section "$SKILL_DIR/founder-branding.md" "When to Use"
check_section "$SKILL_DIR/founder-branding.md" "Execution Mode"
check_section "$SKILL_DIR/founder-branding.md" "Key Principles"

# Competitor Analysis
check_section "$SKILL_DIR/competitor-analysis.md" "When to Use"
check_section "$SKILL_DIR/competitor-analysis.md" "Execution Mode"
check_section "$SKILL_DIR/competitor-analysis.md" "Key Principles"

# Metrics Dashboard
check_section "$SKILL_DIR/metrics-dashboard.md" "When to Use"
check_section "$SKILL_DIR/metrics-dashboard.md" "Execution Mode"
check_section "$SKILL_DIR/metrics-dashboard.md" "Key Principles"

# ── 5. Execution mode consistency ────────────────────────────────────

section "5. Execution mode presence"

for md in "$SKILL_DIR"/*.md; do
  fname="$(basename "$md")"
  if grep -q "Hackathon Mode" "$md" 2>/dev/null && grep -q "Founder Mode" "$md" 2>/dev/null; then
    pass "$fname — has both execution modes"
  else
    fail "$fname — missing execution mode(s)"
  fi
done

# ── 6. Solana case studies referenced ────────────────────────────────

section "6. Solana case study references"

for md in "$SKILL_DIR"/*.md; do
  fname="$(basename "$md")"
  refs=""
  if grep -qi "GMTrade\|PYUSD\|Tala\|Solana" "$md" 2>/dev/null; then
    pass "$fname — references Solana ecosystem"
  else
    fail "$fname — no Solana-specific references"
  fi
done

# ── Summary ──────────────────────────────────────────────────────────

section "Summary"
if [ "$ERRORS" -eq 0 ]; then
  printf "\n\033[32mAll checks passed.\033[0m\n"
  exit 0
else
  printf "\n\033[31m%d error(s) found.\033[0m\n" "$ERRORS"
  exit 1
fi
