# How to Use Apple Docs Reference 📚

This guide explains how the Apple Docs Reference works with AI assistants and how you can get the most out of it.

## How It Works Automatically 🤖

Once you've set up the documentation in your project, your AI assistant (Claude, Cursor, etc.) will automatically:

1. **Detect Framework Imports**
   ```swift
   import PencilKit  // AI checks .apple-docs/Core_Frameworks/PencilKit/llms.md
   import AVFoundation  // AI checks .apple-docs/Core_Frameworks/AVFoundation/llms.md
   ```

2. **Apply Best Practices**
   - Use correct delegate methods
   - Follow Apple's naming conventions
   - Implement proper error handling
   - Use recommended patterns

3. **Avoid Common Mistakes**
   - No deprecated APIs
   - Correct parameter types
   - Proper memory management
   - Platform-specific considerations

## Understanding the AI Instructions

### What's in .claude/CLAUDE.md and .cursor/rules.md?

These files contain instructions that tell the AI:
- Where to find documentation for each framework
- When to reference the docs (automatically on import)
- How to apply the information (best practices, patterns)
- What to prioritize (performance, safety, conventions)

### The Instructions Work Like This:

```
User: "Add a drawing canvas to my app"
↓
AI sees: Need PKCanvasView from PencilKit
↓
AI checks: .apple-docs/Core_Frameworks/PencilKit/llms.md
↓
AI generates: Correct code with proper setup, delegates, and error handling
```

## Manual Usage Tips 🎯

### 1. Ask for Best Practices
```
"Implement audio recording following Apple's best practices"
```
The AI will check AVFoundation docs and use recommended patterns.

### 2. Request Specific Patterns
```
"Show me the proper way to handle PKToolPicker visibility"
```
The AI will reference the exact documentation section.

### 3. Check for Modern APIs
```
"Update this code to use the latest SwiftUI navigation APIs"
```
The AI will check current documentation and suggest updates.

### 4. Verify Compatibility
```
"Will this code work on iOS 15?"
```
The AI can check version requirements in the docs.

## Directory Structure Explained 📁

```
.apple-docs/
├── Core_Frameworks/        # Essential frameworks for most apps
│   ├── PencilKit/         # Drawing and handwriting
│   ├── AVFoundation/      # Audio/video handling
│   ├── Vision/            # Computer vision
│   └── ...
├── Platform_Essentials/    # Core iOS/macOS APIs
│   ├── SwiftUI/           # Modern UI framework
│   ├── UIKit/             # Traditional iOS UI
│   └── ...
├── QUICK_REFERENCE.md      # Condensed API reference
└── FRAMEWORK_INDEX.md      # Import → Doc mapping
```

## Quick Reference Usage 🚀

The `QUICK_REFERENCE.md` file contains ultra-condensed information:
- Most common APIs for each framework
- Quick code snippets
- Parameter reminders
- Common patterns

Example from QUICK_REFERENCE.md:
```markdown
## PencilKit
- Canvas: `PKCanvasView` - drawing.dataRepresentation() for save
- Tools: `PKToolPicker.shared` - setVisible(_:forFirstResponder:)
```

## Framework Index Usage 🗂️

The `FRAMEWORK_INDEX.md` helps you (and the AI) quickly find docs:

| Import Statement | Documentation Path | Key Features |
|-----------------|-------------------|--------------|
| `import PencilKit` | Core_Frameworks/PencilKit/llms.md | PKCanvasView, PKDrawing, PKToolPicker |
| `import AVFoundation` | Core_Frameworks/AVFoundation/llms.md | AVAudioEngine, AVAudioRecorder |

## Common Scenarios 💡

### Scenario 1: Building a Drawing Feature
```swift
import PencilKit
```
AI automatically references:
- PKCanvasView setup
- PKToolPicker configuration  
- Drawing persistence
- Gesture handling

### Scenario 2: Adding Audio Recording
```swift
import AVFoundation
```
AI automatically checks:
- AVAudioSession configuration
- Proper permissions handling
- Recording settings
- Error handling patterns

### Scenario 3: Implementing Computer Vision
```swift
import Vision
```
AI automatically uses:
- VNRequest setup
- Image processing pipeline
- Results handling
- Performance considerations

## Advanced Usage 🔧

### 1. Cross-Framework Integration
When using multiple frameworks, the AI will check all relevant docs:
```swift
import PencilKit
import Vision
// AI checks both PencilKit and Vision docs for integration patterns
```

### 2. Version-Specific Features
Ask for version-specific implementations:
```
"Implement this for iOS 16+ only using the latest APIs"
```

### 3. Performance Optimization
Request optimized implementations:
```
"Implement this with performance in mind per Apple's guidelines"
```

### 4. Accessibility
Ensure accessible implementations:
```
"Make this view fully accessible following Apple's guidelines"
```

## Tips for Best Results 🎯

1. **Be Specific About Requirements**
   - "Add a drawing canvas that supports Apple Pencil"
   - Not just: "Add drawing to my app"

2. **Mention Platform Targets**
   - "This needs to work on iOS 15 and later"
   - "Mac Catalyst compatible implementation"

3. **Ask for Complete Implementations**
   - "Include proper error handling"
   - "Add necessary delegates and extensions"

4. **Request Documentation**
   - "Explain why this approach is recommended"
   - "What are the alternatives?"

## Checking What the AI Knows 🔍

You can verify the AI is using the docs:
```
"What PKCanvasView properties are available according to the documentation?"
```

The AI should list properties from the actual documentation, not generic knowledge.

## Troubleshooting 🛠️

### AI Not Using the Docs?

1. **Check the instruction files exist:**
   - `.claude/CLAUDE.md` for Claude
   - `.cursor/rules.md` for Cursor

2. **Verify folder structure:**
   - Docs should be in `.apple-docs/`
   - Maintain the exact folder structure

3. **Test with direct question:**
   ```
   "What does the PencilKit documentation say about PKToolPicker?"
   ```

### Getting Generic Responses?

- Be more specific about wanting Apple's approach
- Reference the framework explicitly
- Ask for "Apple's recommended pattern for X"

## Workflow Examples 🔄

### Example 1: Starting a New Feature
```
You: "I need to add audio recording to my app"

AI will:
1. Check AVFoundation documentation
2. Suggest proper AVAudioSession setup
3. Include permission handling
4. Add error handling per Apple's guidelines
5. Use modern APIs from the docs
```

### Example 2: Refactoring Old Code
```
You: "Update this UIKit code to SwiftUI"

AI will:
1. Check both UIKit and SwiftUI docs
2. Find equivalent SwiftUI components
3. Use modern SwiftUI patterns
4. Maintain functionality while modernizing
```

### Example 3: Debugging Issues
```
You: "Why isn't my PKCanvasView responding to touches?"

AI will:
1. Check PencilKit documentation
2. Look for common setup issues
3. Verify delegate requirements
4. Check drawingPolicy settings
5. Suggest fixes based on docs
```

## Making Custom Additions 📝

You can add your own documentation:

1. **Add new framework docs:**
   ```bash
   # Add to appropriate folder
   .apple-docs/Core_Frameworks/YourFramework.md
   ```

2. **Update FRAMEWORK_INDEX.md:**
   ```markdown
   | `import YourFramework` | Core_Frameworks/YourFramework.md | Your key APIs |
   ```

3. **Update instruction files:**
   - Add mapping in `.claude/CLAUDE.md`
   - Add mapping in `.cursor/rules.md`

## Best Practices Summary ✅

1. **Let the AI work automatically** - It will check docs when it sees imports
2. **Be specific about requirements** - Platform, version, features
3. **Ask for complete implementations** - Including error handling
4. **Reference frameworks explicitly** - When you want specific patterns
5. **Update regularly** - Keep docs current with Apple's updates

## Getting Help 🆘

- Check `FRAMEWORK_INDEX.md` to find specific docs
- Read `QUICK_REFERENCE.md` for common patterns
- Look at the actual framework docs for deep dives
- Open an issue on GitHub for problems

Remember: The more specific you are about what you want, the better the AI can use these docs to help you write great code that follows Apple's best practices!