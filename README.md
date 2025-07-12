# Apple Docs Reference 🍎

A comprehensive, AI-friendly collection of Apple framework documentation designed to help Claude, Cursor, and other AI assistants write better iOS/macOS code that follows Apple's best practices.

## 🚀 Quick Start

### For Beginners (Recommended)
```bash
# Clone this repository into your project
cd YourSwiftProject
git clone https://github.com/yourusername/apple-docs-reference .apple-docs

# That's it! Your AI assistant will now reference these docs automatically
```

### As a Git Submodule (Advanced)
See [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed submodule instructions.

## 📖 What's Included

- **60+ Framework Documentation Files** covering:
  - Core Frameworks (PencilKit, AVFoundation, Vision, etc.)
  - Platform Essentials (SwiftUI, UIKit, Foundation)
  - Performance Tools (Instruments, MetricKit, XCTest)
  - Data & Storage (SwiftData, CloudKit, CoreData)
  - And much more!

- **AI Assistant Instructions** for:
  - Claude (.claude/CLAUDE.md)
  - Cursor (.cursor/rules.md)
  - VS Code (coming soon)

- **Helper Files**:
  - [FRAMEWORK_INDEX.md](FRAMEWORK_INDEX.md) - Quick lookup table
  - [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Condensed API reference
  - [HOW_TO_USE.md](HOW_TO_USE.md) - Detailed usage guide

## 🎯 Purpose

When building iOS/macOS apps, AI assistants often generate code that:
- Uses deprecated APIs
- Doesn't follow Apple's naming conventions
- Misses important delegate methods
- Ignores platform best practices

This repository solves that by providing AI assistants with immediate access to accurate, comprehensive Apple documentation.

## 🤖 How It Works

1. **Automatic Detection**: When your AI sees `import PencilKit`, it automatically checks the PencilKit documentation
2. **Best Practices**: The AI follows Apple's recommended patterns and conventions
3. **Up-to-date APIs**: Documentation includes the latest APIs and deprecation notices
4. **Zero Configuration**: Just add to your project and it works

## 📁 Repository Structure

```
apple-docs-reference/
├── Core_Frameworks/          # Core iOS/macOS frameworks
├── Platform_Essentials/      # SwiftUI, UIKit, Foundation
├── Performance_Tools/        # Profiling and testing
├── Data_and_Storage/        # Persistence frameworks
├── User_Experience/         # UI/UX frameworks
├── Developer_Tools/         # Xcode, TestFlight, etc.
├── Resources/               # HIG, App Store guidelines
├── Accessibility/           # Accessibility frameworks
├── .claude/                 # Claude AI instructions
└── .cursor/                 # Cursor AI instructions
```

## 🛠 Setup Options

### Option 1: Simple Clone (Easiest)
Best for single projects or trying it out.

### Option 2: Git Submodule (Recommended)
Best for multiple projects - update docs in one place.

### Option 3: Fork & Customize
Best if you want to add your own documentation.

See [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed instructions.

## 📚 Documentation

- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Complete setup instructions
- **[HOW_TO_USE.md](HOW_TO_USE.md)** - How to use with your AI assistant
- **[FRAMEWORK_INDEX.md](FRAMEWORK_INDEX.md)** - Find docs for any framework
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - Common APIs at a glance

## 🤝 Contributing

Found an error or want to add documentation? Please open an issue or submit a PR!

## 📄 License

This repository contains reformatted Apple documentation for AI assistance purposes. All documentation content remains the property of Apple Inc. and is subject to Apple's terms of use.

## 🙏 Acknowledgments

Documentation sourced from Apple's official developer documentation at https://developer.apple.com