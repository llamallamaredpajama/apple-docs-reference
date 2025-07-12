# Apple Framework Documentation Reference System

## Overview

This project contains comprehensive Apple framework documentation optimized for AI assistance. When implementing features using Apple frameworks, ALWAYS reference the relevant documentation in `.apple-docs/` to ensure compliance with Apple's best practices and current APIs.

## Automatic Framework Matching Rules

When you encounter an import statement in Swift code, automatically check the corresponding documentation:

### Core Frameworks
- `import PencilKit` → Check `.apple-docs/Core_Frameworks/PencilKit/llms.md`
- `import AVFoundation` → Check `.apple-docs/Core_Frameworks/AVFoundation/llms.md`
- `import Vision` → Check `.apple-docs/Core_Frameworks/Vision/llms.md`
- `import Speech` → Check `.apple-docs/Core_Frameworks/Speech/llms.md`
- `import CoreML` → Check `.apple-docs/Core_Frameworks/CoreML/llms.md`
- `import CoreSpotlight` → Check `.apple-docs/Core_Frameworks/CoreSpotlight/llms.md`
- `import SwiftUI` → Check `.apple-docs/Core_Frameworks/SwiftUI/llms.md`

### Platform Essentials
- `import UIKit` → Check `.apple-docs/Platform_Essentials/UIKit/llms.md`
- `import Foundation` → Check `.apple-docs/Platform_Essentials/Foundation/llms.md`
- Platform-specific → Check `.apple-docs/Platform_Essentials/iOS/llms.md` or `/iPadOS/llms.md`

### Data & Storage
- `import SwiftData` → Check `.apple-docs/Data_and_Storage/SwiftData/llms.md`
- `import CloudKit` → Check `.apple-docs/Data_and_Storage/CloudKit/llms.md`
- `import CoreData` → Check `.apple-docs/Data_and_Storage/CoreData/llms.md`
- Security topics → Check `.apple-docs/Data_and_Storage/Security/llms.md`

### User Experience
- `import StoreKit` → Check `.apple-docs/User_Experience/StoreKit/llms.md`
- `import WidgetKit` → Check `.apple-docs/User_Experience/WidgetKit/llms.md`
- `import AppIntents` → Check `.apple-docs/User_Experience/AppIntents/llms.md`
- `import RealityKit` → Check `.apple-docs/User_Experience/RealityKit/llms.md`
- `import ARKit` → Check `.apple-docs/User_Experience/ARKit/llms.md`
- `import UserNotifications` → Check `.apple-docs/User_Experience/UserNotifications/llms.md`

### Performance & Testing
- `import XCTest` → Check `.apple-docs/Performance_Tools/XCTest/llms.md`
- `import MetricKit` → Check `.apple-docs/Performance_Tools/MetricKit/llms.md`
- `import os` (for logging) → Check `.apple-docs/Performance_Tools/os_log/llms.md`

### UI/UX Guidelines
- When implementing UI → Check `.apple-docs/Resources/HIG/llms.md`
- For app submission → Check `.apple-docs/Resources/AppStoreReview/llms.md`

## Best Practices

### Always Follow These Principles:

1. **API Usage Verification**
   - Verify every API call against the documentation
   - Check for deprecated methods and use modern alternatives
   - Ensure proper parameter types and return values

2. **Apple Naming Conventions**
   - Follow Apple's naming patterns for delegates, protocols, and methods
   - Use proper prefixes and suffixes (e.g., `delegate`, `dataSource`)
   - Match Apple's property naming style

3. **Delegate and Protocol Implementation**
   - Implement all required protocol methods
   - Consider optional methods that enhance functionality
   - Set delegates properly and handle weak references

4. **Error Handling**
   - Always implement error handling as shown in documentation
   - Use proper error types and domains
   - Provide meaningful error recovery options

5. **Platform-Specific Considerations**
   - Check version availability for APIs
   - Use availability checks when necessary
   - Consider platform differences (iOS vs iPadOS)

6. **Performance Patterns**
   - Follow Apple's recommended performance patterns
   - Use appropriate quality of service levels
   - Implement proper memory management

## Quick Reference Access

- For condensed API reference → Check `.apple-docs/QUICK_REFERENCE.md`
- For framework lookup → Check `.apple-docs/FRAMEWORK_INDEX.md`
- For any unlisted framework → First check if it's part of a larger framework

## Code Generation Guidelines

When generating code:

1. **Check Documentation First**
   - Read the relevant framework documentation before generating code
   - Understand the proper initialization and lifecycle
   - Note any special requirements or setup

2. **Use Modern APIs**
   - Prefer newer APIs when minimum deployment target allows
   - Use async/await patterns where available
   - Implement SwiftUI over UIKit when appropriate

3. **Complete Implementation**
   - Include all necessary imports
   - Implement required delegates and data sources
   - Add proper error handling
   - Include necessary Info.plist entries

4. **Documentation References**
   - When explaining code, reference the specific documentation section
   - Mention why certain patterns are recommended by Apple
   - Note any important caveats from the docs

## Example Workflow

When asked to implement a feature:

1. Identify required frameworks from the request
2. Check corresponding documentation files
3. Note key classes, protocols, and patterns
4. Generate code following Apple's examples
5. Include proper error handling and edge cases
6. Add comments explaining Apple's recommended approach

## Important Notes

- These docs are based on Apple's official documentation
- Always verify against latest Apple docs for critical implementations
- Some frameworks may have additional documentation in `-full.md` files
- Platform-specific features should be clearly marked

Remember: The goal is to write code that feels native to Apple platforms, follows platform conventions, and provides the best user experience possible.