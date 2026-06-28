#!/bin/bash

# Solana GTM Skill - Standard Installer
# Installs with recommended defaults. For custom options, use ./install-custom.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skill"

# Standard defaults
SKILLS_DIR="$HOME/.claude/skills"
GTM_SKILL_PATH="$SKILLS_DIR/solana-gtm"
CLAUDE_MD_PATH="$HOME/.claude/CLAUDE.md"

print_banner() {
    echo ""
    echo -e "${MAGENTA}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██████╗${GREEN} █████╗ ${YELLOW}███╗   ███╗${RED}██╗   ██╗${BLUE}███████╗${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██╔══██╗${GREEN}██╔══██╗${YELLOW}████╗ ████║${RED}██║   ██║${BLUE}██╔════╝${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██████╔╝${GREEN}███████║${YELLOW}██╔████╔██║${RED}██║   ██║${BLUE}███████╗${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██╔══██╗${GREEN}██╔══██║${YELLOW}██║╚██╔╝██║${RED}██║   ██║${BLUE}╚════██║${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██████╔╝${GREEN}██║  ██║${YELLOW}██║ ╚═╝ ██║${RED}╚██████╔╝${BLUE}███████║${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}╚═════╝ ${GREEN}╚═╝  ╚═╝${YELLOW}╚═╝     ╚═╝${RED} ╚═════╝ ${BLUE}╚══════╝${NC}  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${WHITE}Solana GTM & Brand Builder Skill for Claude Code${NC}          ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${GREEN}▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄${NC}      ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${YELLOW}              Superteam Brazil${NC}                            ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${GREEN}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${NC}      ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_help() {
    echo "Solana GTM Skill - Standard Installer"
    echo ""
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Installs with recommended defaults:"
    echo "  - Location: ~/.claude/skills/"
    echo "  - Copies CLAUDE.md to ~/.claude/"
    echo ""
    echo "Options:"
    echo "  -y, --yes      Skip confirmation prompt"
    echo "  -h, --help     Show this help"
    echo ""
    echo "For custom installation options, use: ./install-custom.sh"
    echo ""
}

# Parse arguments
SKIP_CONFIRM=false
while [[ $# -gt 0 ]]; do
    case $1 in
        -y|--yes)
            SKIP_CONFIRM=true
            shift
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Main
print_banner

echo -e "${WHITE}Standard Installation${NC}"
echo ""
echo -e "This will install:"
echo -e "  ${BLUE}•${NC} solana-gtm-skill  → ${CYAN}$GTM_SKILL_PATH${NC}"
echo -e "  ${BLUE}•${NC} CLAUDE.md          → ${CYAN}$CLAUDE_MD_PATH${NC}"
echo ""

if [ "$SKIP_CONFIRM" = false ]; then
    read -p "Proceed with installation? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo -e "${YELLOW}Installation cancelled${NC}"
        echo -e "For custom options, run: ${CYAN}./install-custom.sh${NC}"
        exit 0
    fi
fi

echo ""

# Create directories
mkdir -p "$SKILLS_DIR"
mkdir -p "$HOME/.claude"

# Install GTM skill
echo -e "${CYAN}[1/2]${NC} Installing solana-gtm-skill..."

if [ -d "$GTM_SKILL_PATH" ]; then
    echo -e "  ${YELLOW}→${NC} Removing existing installation"
    rm -rf "$GTM_SKILL_PATH"
fi

mkdir -p "$GTM_SKILL_PATH"
for item in "$SOURCE_DIR"/*; do
    basename=$(basename "$item")
    cp -r "$item" "$GTM_SKILL_PATH/"
done
echo -e "  ${GREEN}✓${NC} Installed to $GTM_SKILL_PATH"

# Install CLAUDE.md
echo -e "${CYAN}[2/2]${NC} Installing CLAUDE.md..."

if [ -f "$CLAUDE_MD_PATH" ]; then
    echo -e "  ${YELLOW}→${NC} Backing up existing CLAUDE.md"
    cp "$CLAUDE_MD_PATH" "$CLAUDE_MD_PATH.backup"
fi

cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD_PATH"
echo -e "  ${GREEN}✓${NC} Installed to $CLAUDE_MD_PATH"

# Done
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}  ${WHITE}Installation Complete!${NC}                                       ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${WHITE}Installed:${NC}"
echo -e "  ${GREEN}✓${NC} solana-gtm-skill  ${CYAN}$GTM_SKILL_PATH${NC}"
echo -e "  ${GREEN}✓${NC} CLAUDE.md          ${CYAN}$CLAUDE_MD_PATH${NC}"
echo ""
echo -e "${CYAN}Try asking Claude:${NC}"
echo -e "  ${BLUE}•${NC} \"Help me build a GTM strategy for my lending protocol\""
echo -e "  ${BLUE}•${NC} \"Create a 30-day content calendar for my NFT launch\""
echo -e "  ${BLUE}•${NC} \"Help me build my personal brand as a Solana founder\""
echo -e "  ${BLUE}•${NC} \"Analyze my competitors in the DeFi space\""
echo ""
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}            Powered by Superteam Brazil${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
