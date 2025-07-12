#!/bin/bash

# Apple Docs Reference Setup Script
# This script automates the setup of apple-docs-reference in your project

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Default values
REPO_URL="https://github.com/llamallamaredpajama/apple-docs-reference"
DOCS_DIR=".apple-docs"

echo -e "${BLUE}🍎 Apple Docs Reference Setup${NC}"
echo "================================"

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: Not in a git repository!${NC}"
    echo "Please run this script from your project's root directory."
    exit 1
fi

# Check if .apple-docs already exists
if [ -d "$DOCS_DIR" ]; then
    echo -e "${RED}Error: $DOCS_DIR already exists!${NC}"
    echo "To reinstall, first remove the existing directory:"
    echo "  rm -rf $DOCS_DIR"
    echo "  git rm -r $DOCS_DIR (if tracked by git)"
    exit 1
fi

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --url)
            REPO_URL="$2"
            shift 2
            ;;
        --simple)
            SIMPLE_MODE=true
            shift
            ;;
        --help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  --url <repo_url>   Specify custom repository URL"
            echo "  --simple           Use simple copy mode (no submodule)"
            echo "  --help             Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                                              # Use submodule with default repo"
            echo "  $0 --url https://github.com/user/repo          # Use custom repo"
            echo "  $0 --simple                                     # Simple copy mode"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Function to copy instruction files
copy_instruction_files() {
    echo -e "${BLUE}📋 Copying instruction files...${NC}"
    
    # Copy Claude instructions
    if [ -d "$DOCS_DIR/.claude" ]; then
        cp -r "$DOCS_DIR/.claude" .claude
        echo -e "${GREEN}✓ Copied .claude/CLAUDE.md${NC}"
    fi
    
    # Copy Cursor instructions
    if [ -d "$DOCS_DIR/.cursor" ]; then
        cp -r "$DOCS_DIR/.cursor" .cursor
        echo -e "${GREEN}✓ Copied .cursor/rules.md${NC}"
    fi
}

# Main setup logic
if [ "$SIMPLE_MODE" = true ]; then
    echo -e "${BLUE}📦 Using simple copy mode...${NC}"
    
    # Clone temporarily to copy files
    echo "Downloading apple-docs-reference..."
    git clone "$REPO_URL" "$DOCS_DIR" --quiet
    
    # Remove .git to disconnect from repo
    rm -rf "$DOCS_DIR/.git"
    echo -e "${GREEN}✓ Downloaded documentation${NC}"
    
    # Copy instruction files
    copy_instruction_files
    
    echo -e "${GREEN}✅ Setup complete (simple mode)!${NC}"
else
    echo -e "${BLUE}🔗 Setting up as git submodule...${NC}"
    
    # Add submodule
    echo "Adding submodule from $REPO_URL..."
    git submodule add "$REPO_URL" "$DOCS_DIR"
    echo -e "${GREEN}✓ Added submodule${NC}"
    
    # Initialize submodule
    git submodule update --init --recursive
    echo -e "${GREEN}✓ Initialized submodule${NC}"
    
    # Copy instruction files
    copy_instruction_files
    
    echo -e "${GREEN}✅ Setup complete!${NC}"
    echo ""
    echo -e "${BLUE}📝 Next steps:${NC}"
    echo "1. Commit the changes:"
    echo "   git add ."
    echo "   git commit -m \"Add Apple docs reference\""
    echo ""
    echo "2. When others clone your project, they should run:"
    echo "   git submodule update --init --recursive"
fi

echo ""
echo -e "${BLUE}📚 Documentation available at:${NC}"
echo "- README: $DOCS_DIR/README.md"
echo "- Setup Guide: $DOCS_DIR/SETUP_GUIDE.md"
echo "- How to Use: $DOCS_DIR/HOW_TO_USE.md"
echo "- Quick Reference: $DOCS_DIR/QUICK_REFERENCE.md"
echo "- Framework Index: $DOCS_DIR/FRAMEWORK_INDEX.md"

echo ""
echo -e "${GREEN}🎉 Your AI assistant will now automatically use Apple documentation!${NC}"