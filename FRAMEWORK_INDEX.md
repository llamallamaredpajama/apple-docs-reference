# Framework Index 📑

Quick lookup table to find documentation for any Apple framework. Use Cmd+F (Mac) or Ctrl+F (Windows/Linux) to search for your framework.

## Core Frameworks

| Import Statement | Documentation File | Primary APIs | Use Case |
|-----------------|-------------------|--------------|----------|
| `import PencilKit` | [Core_Frameworks/PencilKit/llms.md](Core_Frameworks/PencilKit/llms.md) | PKCanvasView, PKDrawing, PKToolPicker, PKStroke | Drawing, handwriting, sketching |
| `import AVFoundation` | [Core_Frameworks/AVFoundation/llms.md](Core_Frameworks/AVFoundation/llms.md) | AVAudioEngine, AVAudioRecorder, AVCaptureSession | Audio/video recording, playback, processing |
| `import Vision` | [Core_Frameworks/Vision/llms.md](Core_Frameworks/Vision/llms.md) | VNRequest, VNImageRequestHandler, VNRecognizeTextRequest | Computer vision, OCR, face detection |
| `import Speech` | [Core_Frameworks/Speech/llms.md](Core_Frameworks/Speech/llms.md) | SFSpeechRecognizer, SFSpeechRecognitionRequest | Speech-to-text conversion |
| `import CoreML` | [Core_Frameworks/CoreML/llms.md](Core_Frameworks/CoreML/llms.md) | MLModel, MLModelConfiguration, MLFeatureValue | Machine learning model integration |
| `import CoreSpotlight` | [Core_Frameworks/CoreSpotlight/llms.md](Core_Frameworks/CoreSpotlight/llms.md) | CSSearchableItem, CSSearchableItemAttributeSet | App content search indexing |
| `import SwiftUI` | [Core_Frameworks/SwiftUI/llms.md](Core_Frameworks/SwiftUI/llms.md) | View, State, NavigationStack, List | Modern declarative UI |

## Platform Essentials

| Import Statement | Documentation File | Primary APIs | Use Case |
|-----------------|-------------------|--------------|----------|
| `import UIKit` | [Platform_Essentials/UIKit/llms.md](Platform_Essentials/UIKit/llms.md) | UIViewController, UIView, UITableView | Traditional iOS UI framework |
| `import Foundation` | [Platform_Essentials/Foundation/llms.md](Platform_Essentials/Foundation/llms.md) | URLSession, FileManager, UserDefaults | Core system services |
| `import Swift` | [Platform_Essentials/Swift/llms.md](Platform_Essentials/Swift/llms.md) | Language features, protocols, generics | Swift language essentials |

## Platform-Specific

| Platform | Documentation File | Key Topics | Target Devices |
|----------|-------------------|------------|----------------|
| iOS | [Platform_Essentials/iOS/llms.md](Platform_Essentials/iOS/llms.md) | App lifecycle, multitasking, permissions | iPhone |
| iPadOS | [Platform_Essentials/iPadOS/llms.md](Platform_Essentials/iPadOS/llms.md) | Split view, drag & drop, Apple Pencil | iPad |

## Data and Storage

| Import Statement | Documentation File | Primary APIs | Use Case |
|-----------------|-------------------|--------------|----------|
| `import SwiftData` | [Data_and_Storage/SwiftData/llms.md](Data_and_Storage/SwiftData/llms.md) | @Model, ModelContainer, FetchDescriptor | Modern persistence (iOS 17+) |
| `import CloudKit` | [Data_and_Storage/CloudKit/llms.md](Data_and_Storage/CloudKit/llms.md) | CKRecord, CKQuery, CKContainer | Cloud storage and sync |
| `import CoreData` | [Data_and_Storage/CoreData/llms.md](Data_and_Storage/CoreData/llms.md) | NSManagedObject, NSFetchRequest | Traditional persistence |
| Security | [Data_and_Storage/Security/llms.md](Data_and_Storage/Security/llms.md) | Keychain, encryption, authentication | Security best practices |

## User Experience

| Import Statement | Documentation File | Primary APIs | Use Case |
|-----------------|-------------------|--------------|----------|
| `import StoreKit` | [User_Experience/StoreKit/llms.md](User_Experience/StoreKit/llms.md) | Product, Transaction, Storefront | In-app purchases, subscriptions |
| `import WidgetKit` | [User_Experience/WidgetKit/llms.md](User_Experience/WidgetKit/llms.md) | TimelineProvider, Widget, TimelineEntry | Home screen widgets |
| `import AppIntents` | [User_Experience/AppIntents/llms.md](User_Experience/AppIntents/llms.md) | AppIntent, AppShortcut, IntentParameter | Siri & Shortcuts integration |
| `import RealityKit` | [User_Experience/RealityKit/llms.md](User_Experience/RealityKit/llms.md) | Entity, AnchorEntity, ModelEntity | 3D/AR content |
| `import ARKit` | [User_Experience/ARKit/llms.md](User_Experience/ARKit/llms.md) | ARSession, ARConfiguration, ARAnchor | Augmented reality |
| `import UserNotifications` | [User_Experience/UserNotifications/llms.md](User_Experience/UserNotifications/llms.md) | UNNotificationRequest, UNNotificationContent | Push & local notifications |

## Performance Tools

| Import Statement | Documentation File | Primary APIs | Use Case |
|-----------------|-------------------|--------------|----------|
| `import XCTest` | [Performance_Tools/XCTest/llms.md](Performance_Tools/XCTest/llms.md) | XCTestCase, XCTAssert, XCTestExpectation | Unit & UI testing |
| `import MetricKit` | [Performance_Tools/MetricKit/llms.md](Performance_Tools/MetricKit/llms.md) | MXMetricManager, MXMetricPayload | Performance metrics |
| `import os` | [Performance_Tools/os_log/llms.md](Performance_Tools/os_log/llms.md) | Logger, OSSignpost | Logging & performance tracking |

## Developer Tools

| Tool | Documentation File | Key Features | Purpose |
|------|-------------------|--------------|----------|
| Xcode | [Developer_Tools/Xcode/llms.md](Developer_Tools/Xcode/llms.md) | Build settings, schemes, debugging | IDE features |
| TestFlight | [Developer_Tools/TestFlight/llms.md](Developer_Tools/TestFlight/llms.md) | Beta testing, feedback, distribution | Beta distribution |
| App Store Connect | [Developer_Tools/AppStoreConnect/llms.md](Developer_Tools/AppStoreConnect/llms.md) | App submission, metadata, review | App Store management |
| CreateML | [Developer_Tools/CreateML/llms.md](Developer_Tools/CreateML/llms.md) | Model training, data preparation | ML model creation |

## Resources

| Resource | Documentation File | Content | When to Use |
|----------|-------------------|---------|-------------|
| App Store Review | [Resources/AppStoreReview/llms.md](Resources/AppStoreReview/llms.md) | Guidelines, common rejections | Before submission |
| Human Interface Guidelines | [Resources/HIG/llms.md](Resources/HIG/llms.md) | Design principles, patterns | UI/UX design |
| Sample Code | [Resources/SampleCode/llms.md](Resources/SampleCode/llms.md) | Example projects, patterns | Learning & reference |

## Accessibility

| Import/Topic | Documentation File | Primary APIs | Purpose |
|-------------|-------------------|--------------|----------|
| `import Accessibility` | [Accessibility/AccessibilityFramework/llms.md](Accessibility/AccessibilityFramework/llms.md) | AXCustomContent, accessibility modifiers | Accessibility features |
| VoiceOver | [Accessibility/VoiceOver/llms.md](Accessibility/VoiceOver/llms.md) | Screen reader support | Vision accessibility |
| Voice Control | [Accessibility/VoiceControl/llms.md](Accessibility/VoiceControl/llms.md) | Voice commands | Motor accessibility |

## Future Features

| Technology | Documentation File | Status | Description |
|-----------|-------------------|--------|-------------|
| visionOS | [Future_Features/visionOS/llms.md](Future_Features/visionOS/llms.md) | Released | Spatial computing platform |
| CollaborationKit | [Future_Features/CollaborationKit/llms.md](Future_Features/CollaborationKit/llms.md) | Beta | Real-time collaboration |
| MCP Integration | [Future_Features/MCPIntegration/llms.md](Future_Features/MCPIntegration/llms.md) | Planned | Model Context Protocol |

## Quick Tips

1. **Can't find your framework?** 
   - Check if it's part of a larger framework (e.g., `CALayer` is in UIKit)
   - Some frameworks are platform-specific
   - New frameworks might be in Future Features

2. **Need specific API details?**
   - Check the linked documentation file
   - Look for `-full.md` versions for comprehensive docs
   - See QUICK_REFERENCE.md for common patterns

3. **Framework not listed?**
   - It might be a third-party framework
   - Check Apple's official docs for newer frameworks
   - Consider contributing to this index!

## File Naming Convention

- `llms.md` - Concise, AI-optimized documentation
- `llms-full.md` - Comprehensive documentation (where available)

---

💡 **Usage Tip**: Your AI assistant will automatically reference these docs when it sees the import statements in your code. You don't need to manually point to them!