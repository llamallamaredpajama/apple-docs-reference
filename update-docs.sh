#!/bin/bash

# Apple Docs Reference Update Script
# This script helps update the documentation across all your projects

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🍎 Apple Docs Reference Updater${NC}"
echo "================================="

# Function to update a single project
update_project() {
    local project_path="$1"
    echo -e "\n${BLUE}📁 Updating: $project_path${NC}"
    
    cd "$project_path"
    
    # Check if .apple-docs exists and is a submodule
    if [ ! -d ".apple-docs" ]; then
        echo -e "${YELLOW}⚠️  No .apple-docs directory found, skipping...${NC}"
        return
    fi
    
    # Check if it's a submodule
    if [ -f ".gitmodules" ] && grep -q ".apple-docs" ".gitmodules"; then
        echo "Found submodule, updating..."
        
        # Update the submodule
        cd .apple-docs
        git fetch origin
        git pull origin main
        cd ..
        
        # Check if there are changes
        if git diff --quiet .apple-docs; then
            echo -e "${GREEN}✓ Already up to date${NC}"
        else
            echo -e "${GREEN}✓ Updated to latest version${NC}"
            
            # Update instruction files if they exist
            if [ -d ".apple-docs/.claude" ] && [ -d ".claude" ]; then
                cp -r .apple-docs/.claude/* .claude/
                echo -e "${GREEN}✓ Updated .claude instructions${NC}"
            fi
            
            if [ -d ".apple-docs/.cursor" ] && [ -d ".cursor" ]; then
                cp -r .apple-docs/.cursor/* .cursor/
                echo -e "${GREEN}✓ Updated .cursor instructions${NC}"
            fi
            
            echo -e "${YELLOW}📝 Remember to commit these changes!${NC}"
            echo "   git add ."
            echo "   git commit -m \"Update Apple docs to latest version\""
        fi
    else
        echo -e "${YELLOW}⚠️  .apple-docs is not a submodule (might be a simple copy)${NC}"
        echo "   To update, manually re-run setup.sh or convert to submodule"
    fi
}

# Parse command line arguments
if [ $# -eq 0 ]; then
    # No arguments, update current directory
    update_project "."
elif [ "$1" == "--all" ]; then
    # Find and update all projects in parent directory
    echo -e "${BLUE}🔍 Searching for projects with apple-docs...${NC}"
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    # Search for projects (up to 3 levels deep)
    found_projects=false
    while IFS= read -r -d '' project; do
        if [ -d "$project/.apple-docs" ]; then
            found_projects=true
            update_project "$project"
            cd "$ORIGINAL_DIR"  # Return to original directory
        fi
    done < <(find .. -maxdepth 3 -name ".apple-docs" -type d -print0 | xargs -0 dirname | sort -u)
    
    if [ "$found_projects" = false ]; then
        echo -e "${YELLOW}No projects with .apple-docs found${NC}"
    fi
elif [ "$1" == "--help" ]; then
    echo "Usage: $0 [options] [project_path]"
    echo ""
    echo "Options:"
    echo "  (no args)          Update apple-docs in current directory"
    echo "  --all              Find and update all projects in parent directory"
    echo "  --help             Show this help message"
    echo "  <path>             Update specific project at path"
    echo ""
    echo "Examples:"
    echo "  $0                          # Update current project"
    echo "  $0 --all                    # Update all projects"
    echo "  $0 /path/to/project         # Update specific project"
else
    # Update specific project
    if [ -d "$1" ]; then
        update_project "$1"
    else
        echo -e "${RED}Error: Directory not found: $1${NC}"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}✅ Update check complete!${NC}"
echo ""
echo -e "${BLUE}💡 Tips:${NC}"
echo "- Run this script periodically to keep docs up to date"
echo "- Use --all flag to update multiple projects at once"
echo "- Always review changes before committing"