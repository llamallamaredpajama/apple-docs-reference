# Complete Setup Guide 🛠️

This guide will walk you through setting up the Apple Docs Reference in your projects. Don't worry if you're new to Git or submodules - we'll explain everything!

## Table of Contents
1. [Choose Your Setup Method](#choose-your-setup-method)
2. [Method 1: Simple Copy (Easiest)](#method-1-simple-copy-easiest)
3. [Method 2: Git Submodule (Recommended)](#method-2-git-submodule-recommended)
4. [Understanding Git Submodules](#understanding-git-submodules)
5. [Common Tasks](#common-tasks)
6. [Troubleshooting](#troubleshooting)

## Choose Your Setup Method

### 🟢 Method 1: Simple Copy
**Best for:**
- Single projects
- Trying out the system
- If you don't need updates
- Complete beginners

### 🟡 Method 2: Git Submodule  
**Best for:**
- Multiple projects
- Want automatic updates
- Team collaboration
- Long-term use

## Method 1: Simple Copy (Easiest)

This is the simplest way to get started:

```bash
# 1. Go to your project directory
cd /path/to/YourSwiftProject

# 2. Clone this repository as .apple-docs
git clone https://github.com/llamallamaredpajama/apple-docs-reference .apple-docs

# 3. Remove the .git folder (this disconnects it from the original repo)
rm -rf .apple-docs/.git

# 4. Copy the AI instruction files to your project
cp -r .apple-docs/.claude .claude
cp -r .apple-docs/.cursor .cursor

# Done! Your AI assistant will now use these docs
```

**Pros:** Super simple, no Git knowledge needed
**Cons:** No easy updates, takes up space in your repo

## Method 2: Git Submodule (Recommended)

### What is a Git Submodule?

Think of a submodule as a "link" to another repository that lives inside your project. It's like having a folder that stays synchronized with another Git repository.

**Visual Representation:**
```
YourProject/
├── YourApp/
├── YourApp.xcodeproj
├── .apple-docs/          <-- This is the submodule (linked folder)
│   └── (contents from apple-docs-reference repo)
├── .claude/
│   └── CLAUDE.md         <-- Copied from .apple-docs
└── .cursor/
    └── rules.md          <-- Copied from .apple-docs
```

### Step-by-Step Submodule Setup

#### Step 1: First-Time Setup (You only do this once)

```bash
# 1. Go to your project directory
cd /path/to/YourSwiftProject

# 2. Add the submodule
git submodule add https://github.com/llamallamaredpajama/apple-docs-reference .apple-docs

# What this does:
# - Creates a .apple-docs folder
# - Links it to the apple-docs-reference repository
# - Creates a .gitmodules file to track this link

# 3. Copy the AI instruction files
cp -r .apple-docs/.claude .claude
cp -r .apple-docs/.cursor .cursor

# 4. Commit everything
git add .
git commit -m "Add Apple docs reference as submodule"

# 5. Push to your repository
git push
```

#### Step 2: When Your Teammates Clone Your Project

When someone else (or you on another computer) clones your project:

```bash
# Clone the project
git clone https://github.com/llamallamaredpajama/YourSwiftProject
cd YourSwiftProject

# Initialize and update submodules
git submodule update --init --recursive

# What this does:
# - Downloads the apple-docs content
# - Sets up the link properly
```

### Understanding Git Submodules

#### What Actually Happens?

1. **`.gitmodules` file is created:**
```ini
[submodule ".apple-docs"]
    path = .apple-docs
    url = https://github.com/llamallamaredpajama/apple-docs-reference
```

2. **Git tracks the exact version:**
   - Your project remembers which exact version of the docs it uses
   - This ensures everyone on your team has the same docs

3. **The folder works normally:**
   - You can browse and read files like any other folder
   - Your AI assistant can access all the documentation

## Common Tasks

### Updating to Latest Documentation

To get the latest documentation updates:

```bash
# 1. Go to your project
cd /path/to/YourSwiftProject

# 2. Update the submodule
cd .apple-docs
git pull origin main
cd ..

# 3. Commit the update
git add .apple-docs
git commit -m "Update Apple docs to latest version"
git push
```

### Checking Current Version

```bash
# See which version you're using
cd .apple-docs
git log -1 --oneline
```

### Removing the Submodule

If you want to remove it:

```bash
# Remove the submodule
git rm .apple-docs
rm -rf .git/modules/.apple-docs
git commit -m "Remove apple-docs submodule"
```

## Setting Up Your Own Repository

### Step 1: Create a GitHub Account
1. Go to https://github.com
2. Click "Sign up"
3. Follow the instructions

### Step 2: Fork This Repository
1. Go to the original apple-docs-reference repository
2. Click the "Fork" button (top right)
3. This creates your own copy

### Step 3: Or Create From Scratch
```bash
# 1. Go to the apple-docs-reference folder
cd /Users/username/folder/apple-docs-reference

# 2. Initialize Git
git init

# 3. Add all files
git add .

# 4. Create first commit
git commit -m "Initial commit: Apple documentation reference"

# 5. Create repository on GitHub (via website)
# Then connect it:
git remote add origin https://github.com/yourusername/apple-docs-reference
git push -u origin main
```

## Automated Setup Script

For convenience, use our setup script:

```bash
# In your project directory
curl -s https://raw.githubusercontent.com/llamallamaredpajama/apple-docs-reference/main/setup.sh | bash
```

This script:
1. Adds the submodule
2. Copies instruction files
3. Shows success message

## Troubleshooting

### "Permission denied" Error
```bash
# Make sure you have the right GitHub URL
# Use HTTPS (not SSH) if you haven't set up SSH keys:
git submodule add https://github.com/llamallamaredpajama/apple-docs-reference .apple-docs
```

### Submodule Folder is Empty
```bash
# Initialize and update
git submodule update --init --recursive
```

### Can't See Changes in Submodule
```bash
# Make sure you're in the right directory
cd .apple-docs
git status
git pull origin main
```

### Want to Use Different Branch
```bash
cd .apple-docs
git checkout branch-name
cd ..
git add .apple-docs
git commit -m "Switch apple-docs to branch-name"
```

## Best Practices

1. **Always Commit Submodule Changes**
   - When you update the submodule, commit that change
   - This ensures your team uses the same version

2. **Document Which Version You're Using**
   - In your project README, mention that you use apple-docs
   - Help teammates know to run `git submodule update --init`

3. **Regular Updates**
   - Check for updates monthly
   - Read what changed before updating

4. **Team Communication**
   - Let your team know when you update the docs
   - Share any new features or important changes

## Need Help?

- Check [HOW_TO_USE.md](HOW_TO_USE.md) for usage instructions
- Open an issue on GitHub for problems
- The community is here to help!

## Quick Command Reference

```bash
# Add submodule (first time)
git submodule add https://github.com/llamallamaredpajama/apple-docs-reference .apple-docs

# Update submodule (get latest)
git submodule update --remote

# Clone project with submodules
git clone --recursive https://github.com/llamallamaredpajama/YourProject

# If forgot --recursive
git submodule update --init --recursive

# See submodule status
git submodule status
```

Remember: Git submodules might seem complex at first, but they're just linked folders that can be updated independently. Once set up, they work seamlessly!