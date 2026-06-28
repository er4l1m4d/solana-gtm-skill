#!/bin/bash

# Solana GTM Skill Installer for Claude Code
# Usage: ./install-custom.sh [--project | --path <path>]

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GTM_SKILL_NAME="solana-gtm"
SOURCE_DIR="$SCRIPT_DIR/skill"

# Default paths
PERSONAL_SKILLS_DIR="$HOME/.claude/skills"
PROJECT_SKILLS_DIR=".claude/skills"

# Installation targets (set during prompts)
INSTALL_BASE=""
GTM_INSTALL_PATH=""
CLAUDE_MD_PATH=""

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
    echo "Solana GTM Skill Installer"
    echo ""
    echo "Usage: ./install-custom.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --project        Install to current project (.claude/skills/)"
    echo "  --path PATH      Install to custom path"
    echo "  -h, --help       Show this help message"
    echo ""
    echo "The installer will:"
    echo "  1. Install solana-gtm-skill"
    echo "  2. Ask about CLAUDE.md placement"
    echo ""
}

prompt_install_location() {
    echo ""
    echo -e "${CYAN}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${NC}  ${WHITE}Select Installation Location${NC}                               ${CYAN}│${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -e "  ${WHITE}[1]${NC} ${GREEN}Personal skills${NC} (~/.claude/skills/)"
    echo -e "      ${YELLOW}Available to all projects${NC}"
    echo ""
    echo -e "  ${WHITE}[2]${NC} ${GREEN}Current project${NC} (./.claude/skills/)"
    echo -e "      ${YELLOW}Only for this project${NC}"
    echo ""
    echo -e "  ${WHITE}[3]${NC} ${RED}Cancel${NC}"
    echo ""

    read -p "Select option [1-3]: " choice

    case $choice in
        1)
            INSTALL_BASE="$PERSONAL_SKILLS_DIR"
            ;;
        2)
            INSTALL_BASE="$PROJECT_SKILLS_DIR"
            ;;
        3)
            echo -e "${YELLOW}Installation cancelled${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Installation cancelled${NC}"
            exit 1
            ;;
    esac

    GTM_INSTALL_PATH="$INSTALL_BASE/$GTM_SKILL_NAME"
}

install_gtm_skill() {
    echo ""
    echo -e "${CYAN}━━━ Installing Solana GTM Skill ━━━${NC}"

    # Check if source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo -e "${RED}Error:${NC} Source directory '$SOURCE_DIR' not found"
        exit 1
    fi

    # Check if destination already exists
    if [ -d "$GTM_INSTALL_PATH" ]; then
        echo -e "${YELLOW}Warning:${NC} '$GTM_INSTALL_PATH' already exists"
        read -p "Overwrite? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Skipping GTM skill installation${NC}"
            return 0
        fi
        rm -rf "$GTM_INSTALL_PATH"
    fi

    # Create directory
    mkdir -p "$GTM_INSTALL_PATH"

    # Copy GTM skill files
    for item in "$SOURCE_DIR"/*; do
        local basename=$(basename "$item")
        cp -r "$item" "$GTM_INSTALL_PATH/"
    done

    echo -e "${GREEN}✓${NC} Installed solana-gtm-skill to: $GTM_INSTALL_PATH"

    # List installed files
    echo ""
    echo -e "${WHITE}Installed skill files:${NC}"
    find "$GTM_INSTALL_PATH" -type f -name "*.md" | sort | while read -r file; do
        echo -e "  ${BLUE}•${NC} $(basename "$file")"
    done
}

install_claude_md() {
    local claude_md_source="$SCRIPT_DIR/CLAUDE.md"
    local default_claude_md="$HOME/.claude/CLAUDE.md"

    echo ""
    echo -e "${CYAN}━━━ CLAUDE.md Configuration ━━━${NC}"
    echo ""
    echo -e "  ${WHITE}CLAUDE.md${NC} provides project-level Claude configuration."
    echo -e "  It includes stack decisions, workflow rules, and skill references."
    echo ""
    echo -e "  ${WHITE}[1]${NC} Copy to ${GREEN}home .claude${NC} (~/.claude/)"
    echo -e "  ${WHITE}[2]${NC} Copy to ${GREEN}current directory${NC} (.)"
    echo -e "  ${WHITE}[3]${NC} ${YELLOW}Skip${NC} CLAUDE.md installation"
    echo ""

    read -p "Select option [1-3]: " claude_choice

    case $claude_choice in
        1)
            mkdir -p "$HOME/.claude"
            if [ -f "$default_claude_md" ]; then
                echo -e "${YELLOW}Warning:${NC} CLAUDE.md already exists at ~/.claude/"
                read -p "Overwrite? (y/N) " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    echo -e "${YELLOW}Skipping CLAUDE.md${NC}"
                    return 0
                fi
            fi
            cp "$claude_md_source" "$default_claude_md"
            echo -e "${GREEN}✓${NC} Copied CLAUDE.md to ~/.claude/"
            ;;
        2)
            if [ -f "./CLAUDE.md" ]; then
                echo -e "${YELLOW}Warning:${NC} CLAUDE.md already exists in current directory"
                read -p "Overwrite? (y/N) " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    echo -e "${YELLOW}Skipping CLAUDE.md${NC}"
                    return 0
                fi
            fi
            cp "$claude_md_source" "./CLAUDE.md"
            echo -e "${GREEN}✓${NC} Copied CLAUDE.md to current directory"
            ;;
        3)
            echo -e "${YELLOW}Skipping CLAUDE.md installation${NC}"
            ;;
        *)
            echo -e "${YELLOW}Invalid option, skipping CLAUDE.md${NC}"
            ;;
    esac
}

print_success() {
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}                                                               ${GREEN}║${NC}"
    echo -e "${GREEN}║${NC}   ${WHITE}Installation Complete!${NC}                                     ${GREEN}║${NC}"
    echo -e "${GREEN}║${NC}                                                               ${GREEN}║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    if [ -d "$GTM_INSTALL_PATH" ]; then
        echo -e "${WHITE}GTM Skill:${NC} $GTM_INSTALL_PATH"
    fi

    echo ""
    echo -e "${CYAN}Try asking Claude about:${NC}"
    echo -e "  ${BLUE}•${NC} \"Help me build a GTM strategy for my lending protocol\""
    echo -e "  ${BLUE}•${NC} \"Create a 30-day content calendar for my NFT launch\""
    echo -e "  ${BLUE}•${NC} \"Help me build my personal brand as a Solana founder\""
    echo -e "  ${BLUE}•${NC} \"Analyze my competitors in the DeFi space\""
    echo -e "  ${BLUE}•${NC} \"What metrics should I track after launch?\""
    echo ""
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}            Powered by Superteam Brazil${NC}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --project)
            INSTALL_BASE="$PROJECT_SKILLS_DIR"
            shift
            ;;
        --path)
            INSTALL_BASE="$2"
            shift 2
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

# Main execution
print_banner

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Error:${NC} Source directory '$SOURCE_DIR' not found"
    exit 1
fi

# Check if SKILL.md exists
if [ ! -f "$SOURCE_DIR/SKILL.md" ]; then
    echo -e "${RED}Error:${NC} SKILL.md not found in '$SOURCE_DIR'"
    exit 1
fi

# Prompt for install location if not specified
if [ -z "$INSTALL_BASE" ]; then
    prompt_install_location
else
    GTM_INSTALL_PATH="$INSTALL_BASE/$GTM_SKILL_NAME"
fi

# Install GTM skill
install_gtm_skill

# Ask about CLAUDE.md
install_claude_md

# Print success message
print_success
