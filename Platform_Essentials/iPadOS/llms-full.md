# iPadOS Development Documentation - Full Reference

## Table of Contents
1. [iPadOS Platform Overview](#ipados-platform-overview)
2. [Designing for iPadOS](#designing-for-ipados)
3. [Supporting Multiple Windows on iPad](#supporting-multiple-windows-on-ipad)
4. [Pointer Interactions](#pointer-interactions)
5. [Keyboards and Input](#keyboards-and-input)
6. [Mac Catalyst](#mac-catalyst)
7. [Drag and Drop](#drag-and-drop)
8. [Document Interaction](#document-interaction)

---

## iPadOS Platform Overview

Source: https://developer.apple.com/ipados/

Build apps and games for the distinct iPad experience. Take advantage of the new design, which elevates the content users care about most. Create more customized apps that appear in more places across the system with controls, widgets, and Live Activities. And with Apple Intelligence, you can bring personal intelligence into your apps to deliver new capabilities, all with great performance and built-in privacy.

### Key Features

#### New Design - Liquid Glass
The latest design system that provides a fresh visual appearance for iPadOS apps.

#### Apple Intelligence
Tap into the on-device large language model to add intelligent features to your apps while maintaining user privacy.

#### App Intents
Core functions that integrate throughout the system, enabling deeper integration with system features.

#### Apple Pencil
Pixel-perfect precision and industry-leading low latency for creative and productivity apps.

#### Live Activities
Display important information right now, keeping users informed even when your app isn't running.

#### Notifications
Communicate with users even when your app isn't running.

#### Multitasking
Help people get more done with powerful multitasking capabilities.

### Developer Resources
- What's new in iPadOS: Dive into the latest key technologies and capabilities
- New to iPadOS development: Check out the iPadOS Pathway for easy-to-navigate resources
- Meet with Apple: Sharpen your skills through in-person and online activities
- Browse tools, documentation, sample code, and videos

---

## Designing for iPadOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados

People value the power, mobility, and flexibility of iPad as they enjoy media, play games, perform detailed productivity tasks, and bring their creations to life.

### Fundamental Device Characteristics

**Display**: iPad has a large, high-resolution display.

**Ergonomics**: People often hold their iPad while using it, but they might also set it on a surface or place it on a stand. Positioning the device in different ways can change the viewing distance, although people are typically within about 3 feet of the device as they interact with it.

**Inputs**: People can interact with iPad using Multi-Touch gestures and virtual keyboards, an attached keyboard or pointing device, Apple Pencil, or voice, and they often combine multiple input modes.

**App interactions**: Sometimes, people perform a few quick actions on their iPad. At other times, they spend hours immersed in games, media, content creation, or productivity tasks. People frequently have multiple apps open at the same time, and they appreciate viewing more than one app onscreen at once and taking advantage of inter-app capabilities like drag and drop.

**System features**: iPadOS provides several features that help people interact with the system and their apps in familiar, consistent ways:
- Multitasking
- Widgets
- Drag and drop

### Best Practices

Great iPad experiences integrate the platform and device capabilities that people value most. To help your experience feel at home in iPadOS, prioritize the following:

1. Take advantage of the large display to elevate the content people care about, minimizing modal interfaces and full-screen transitions, and positioning onscreen controls where they're easy to reach, but not in the way.

2. Use viewing distance and input mode to help you determine the size and density of the onscreen content you display.

3. Let people use Multi-Touch gestures, a physical keyboard or trackpad, or Apple Pencil, and consider supporting unique interactions that combine multiple input modes.

4. Adapt seamlessly to appearance changes — like device orientation, multitasking modes, Dark Mode, and Dynamic Type — and transition effortlessly to running in macOS, letting people choose the configurations that work best for them.

---

## Supporting Multiple Windows on iPad

Source: https://developer.apple.com/documentation/uikit/app_and_environment/scenes/supporting_multiple_windows_on_ipad

Support side-by-side instances of your app's interface and create new windows.

### Overview

This sample shows how to create multiple windows that give users the ability to create separate parts of your application with similar or varying content. Windows are managed by a scene or `UISceneSession` class. Your application uses `UISceneDelegate` and `UISceneConfiguration` to manage the life cycle of a window. Scenes have their own dedicated lifecycle that are managed separate from `UIApplication`.

When you adopt a multi-window architecture, the `UIApplicationDelegate` class that manages your application manages newly created scenes. Then, `UISceneDelegate` replaces the code in the delegate functions of `UIApplicationDelegate`.

UIKit provides a subclass of `UISceneDelegate` called `UIWindowSceneDelegate` designed specifically to help manage your windows. When adopting the multi-window architecture in an existing application running on iOS 12 or earlier, you move more responsibility from `UIApplicationDelegate` to `UIWindowSceneDelegate`.

### Add Multiple Scene Support

To support multiple windows, the app's `Info.plist` requires a manifest or `UIApplicationSceneManifest`, which contains information about the app's scene-based life-cycle support. Include the key `UIApplicationSupportsMultipleScenes`, with its Boolean value set to `true`, which indicates that the app support two or more scenes simultaneously.

### Add a Scene Delegate

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity {
        if !configure(window: window, with: userActivity) {
            Swift.debugPrint("Failed to restore from \(userActivity)")
        }
    }
    // The 'window' property will automatically be loaded with the storyboard's initial view controller.

    // Set the activation predicates, which operate on the 'targetContentIdentifier'.
    let conditions = scene.activationConditions
    let prefsPredicate = NSPredicate(format: "self == %@", mainSceneTargetContentIdentifier)
    // The main predicate, which expresses to the system what kind of content the scene can display.
    conditions.canActivateForTargetContentIdentifierPredicate = prefsPredicate
    // The secondary predicate, which expresses to the system that this scene is especially interested in a particular kind of content.
    conditions.prefersToActivateForTargetContentIdentifierPredicate = prefsPredicate
}
```

### Create Multiple Windows from Drag and Drop

This sample creates a separate window when the user drags an image from the collection view to the left or right side of the iPad screen:

```swift
func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    var dragItems = [UIDragItem]()
    let selectedPhoto = photos[indexPath.row]
    if let imageToDrag = UIImage(named: selectedPhoto.assetName) {
        let userActivity = selectedPhoto.detailUserActivity
        let itemProvider = NSItemProvider(object: imageToDrag)
        itemProvider.registerObject(userActivity, visibility: .all)

        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = selectedPhoto
        dragItems.append(dragItem)
    }
    return dragItems
}
```

### Create Multiple Windows Programmatically

```swift
class func openInspectorSceneSessionForPhoto(_ photo: Photo, requestingScene: UIWindowScene, errorHandler: ((Error) -> Void)? = nil) {
    let options = UIWindowScene.ActivationRequestOptions()
    options.preferredPresentationStyle = .prominent
    options.requestingScene = requestingScene

    // Look for an already open window scene session that matches the photo.
    if let foundSceneSession = InspectorSceneDelegate.activeInspectorSceneSessionForPhoto(photo.assetName) {
        // Inspector scene session already open, so activate it.
        UIApplication.shared.requestSceneSessionActivation(foundSceneSession,
                                                           userActivity: nil,
                                                           options: options,
                                                           errorHandler: errorHandler)
    } else {
        // No Inspector scene session found, so create a new one.
        let userActivity = photo.inspectorUserActivity

        UIApplication.shared.requestSceneSessionActivation(nil, // Pass nil means make a new one.
                                                           userActivity: userActivity,
                                                           options: options,
                                                           errorHandler: errorHandler)
    }
}
```

---

## Pointer Interactions

Source: https://developer.apple.com/documentation/uikit/pointer_interactions

Support pointer interactions in your custom controls and views.

### Overview

iPadOS 13.4 introduces dynamic pointer effects and behaviors that enhance the experience of using an external input device, like a trackpad or mouse, with iPad. As people use an input device, iPadOS automatically adapts the pointer to the current context, providing rich visual feedback and just the right level of precision needed to enhance productivity and simplify common tasks.

UIKit automatically handles pointer interactions if you're using `UIButton`, `UIBarButtonItem`, or `UISegmentedControl`. If you use custom views to display your content, you must define pointer effects and styles yourself.

### Specify Custom Pointer Styles

To add a custom pointer style effect to a view:

1. Create a `UIPointerInteraction` instance
2. Specify the pointer interaction's delegate
3. Add the interaction to the view's `interactions` property
4. Add the `pointerInteraction(_:styleFor:)` delegate method
5. Return `UIPointerStyle` from that delegate method

```swift
func customPointerInteraction(on view: UIView, pointerInteractionDelegate: UIPointerInteractionDelegate) {
    let pointerInteraction = UIPointerInteraction(delegate: pointerInteractionDelegate)
    view.addInteraction(pointerInteraction)
}

func pointerInteraction(_ interaction: UIPointerInteraction, styleFor region: UIPointerRegion) -> UIPointerStyle? {
    var pointerStyle: UIPointerStyle? = nil

    if let interactionView = interaction.view {
        let targetedPreview = UITargetedPreview(view: interactionView)
        pointerStyle = UIPointerStyle(effect: UIPointerEffect.lift(targetedPreview))
    }
    return pointerStyle
}
```

### Add Interaction Animations

```swift
func pointerInteraction(_ interaction: UIPointerInteraction, willEnter region: UIPointerRegion, animator: UIPointerInteractionAnimating) {
    if let interactionView = interaction.view {
        animator.addAnimations {
            interactionView.alpha = 0.5
        }
    }
}

func pointerInteraction(_ interaction: UIPointerInteraction, willExit region: UIPointerRegion, animator: UIPointerInteractionAnimating) {
    if let interactionView = interaction.view {
        animator.addAnimations {
            interactionView.alpha = 1.0
        }
    }
}
```

### Distinguish Pointing Device Input Events

If you want to distinguish between pointing device touch events and touch events from other sources, like the user's fingers or Apple Pencil, you can enable the `UIApplicationSupportsIndirectInputEvents` key in the `Info.plist` file. With this key enabled, your app can respond to specific gestures targeted at touches of `UITouch.TouchType.indirectPointer`.

---

## Keyboards and Input

Source: https://developer.apple.com/documentation/uikit/keyboards_and_input

Configure the system keyboard, create your own keyboards to handle input, or detect key presses on a physical keyboard.

### Key Topics

#### Text Input
- `UITextInput` protocol: A set of methods for interacting with the text input system
- `UITextInputDelegate` protocol: An intermediary between a document and the text input system
- `UIKeyInput` protocol: A set of methods a responder uses to implement simple text entry
- `UITextInputTraits` protocol: A set of methods that defines features for keyboard input

#### Text Interactions
- `UITextInteraction`: An interaction that provides text selection gestures and UI to custom text views
- `UITextInteractionDelegate`: An interface that an object implements to receive information about text interaction events
- `UITextInteractionMode`: Modes that determine the selection behaviors that a text interaction provides

#### Custom Text Selection
- `UITextSelectionDisplayInteraction`: An object that provides the system UI for displaying text selection
- `UITextSelectionHighlightView`: An interface you use to provide a custom highlight UI behind the selected text
- `UITextSelectionHandleView`: An interface you use to draw custom the selection handles for ranges of text
- `UITextCursorView`: An interface you use to draw the insertion point in a piece of text

#### Smart Reply for Messaging
Generate reply suggestions by using Apple Intelligence and put selected text into your text UI:
- `UIConversationContext`: A base class that represents a conversation between participants
- `UIMailConversationContext`: A class that represents an email conversation
- `UIMessageConversationContext`: A class that represents a message conversation
- `UISmartReplySuggestion`: A class you use to handle a Smart Reply suggestion

#### Keyboard Layout
```swift
// Adjusting your layout with keyboard layout guide
class UIKeyboardLayoutGuide: UILayoutGuide
// A layout guide that represents the space the keyboard occupies

class UITrackingLayoutGuide: UILayoutGuide
// A layout guide that automatically activates and deactivates layout constraints
```

#### Custom Keyboards
Create and manage custom input for a view:
- `UIInputViewController`: The primary view controller for a custom keyboard app extension
- `UIInputView`: An object that displays and manages custom input for a view
- `UILexicon`: A read-only array of term pairs for a custom keyboard
- `UITextDocumentProxy`: An object that provides textual context to a custom keyboard

#### Physical Keyboards
Handle key presses and navigate using a keyboard:
- `UIKey`: An object that provides information about the state of a keyboard key
- `UIKeyboardHIDUsage`: A set of HID usage codes that identify the keys of a USB keyboard

---

## Mac Catalyst

Source: https://developer.apple.com/documentation/uikit/mac_catalyst

Create a version of your iPad app that users can run on a Mac device.

### Overview

With Mac Catalyst, you can make a Mac version of your iPad app. Click the Mac checkbox in your iPad app's project settings to configure the project to build both Mac and iPad versions of your app. The two apps share the same project and source code, making it easy to change your code in one place.

### Key Features

#### App Support
- Build a native Mac app from the same codebase as your iPad app
- Choose between iPad or Mac user interface idiom
- Optimize your iPad app for Mac by taking advantage of system features in macOS
- Support automatic tabbing mode

#### User Interface
- Customize your app's user interface with views and controls
- Support native controls, multiple windows, sharing, printing, menus and keyboard shortcuts
- Display a checkbox in Mac-style when running in the Mac user interface idiom
- Remove the title bar to display content that fills the entire height of a window
- Provide a space for controls under a window's title bar with Toolbar
- Display interactive content and controls in the Touch Bar

#### User Interactions
- Navigate between UI elements using a keyboard
- Add menus and shortcuts to the menu bar
- Handle key presses made on a physical keyboard
- Use `UIHoverGestureRecognizer` for pointer movement over a view

#### User Preferences
```swift
// Provide a Preferences window so users can manage app preferences
// Listen for and respond to preference changes using Combine
```

#### Tooltips
```swift
// Show help tags for views and controls using tooltip interactions
class UIToolTipInteraction
// An interaction object that makes it possible to show a tooltip

protocol UIToolTipInteractionDelegate
// An interface that provides tooltip settings to an interaction
```

---

## Drag and Drop

Source: https://developer.apple.com/documentation/uikit/drag_and_drop

Bring drag and drop to your app by using interaction APIs with your views.

### Overview

With drag and drop in iOS, users can drag items from one onscreen location to another using continuous gestures. A drag-and-drop activity can take place in a single app, or it can start in one app and end in another.

The app from which an item is dragged is the source app. The app on which an item is dropped is the destination app. For drag and drop in a single app, that app plays both roles simultaneously.

When dragging is in progress, the source and destination apps continue to run normally and support user interaction. A user can invoke the Dock, return to the Home screen, open a second app in Split View, and even start another drag activity.

Unlike in macOS, iOS drag and drop supports multiple simultaneous drag activities—as many as the user's fingers can handle.

### Key Concepts

#### Making a View Into a Drag Source

```swift
class UIDragInteraction
// An interaction to enable dragging of items from a view

protocol UIDragInteractionDelegate
// The interface for configuring and controlling a drag interaction

// Example implementation
func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
    // Return drag items
}
```

#### Making a View Into a Drop Destination

```swift
class UIDropInteraction
// An interaction to enable dropping of items onto a view

protocol UIDropInteractionDelegate
// The interface for configuring and controlling a drop interaction

// Example implementation
func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    // Handle the drop
}
```

#### Spring-loaded Interactions

Enable spring loading to support drag and drop for your navigable UI:
- `UISpringLoadedInteraction`: Configure and control spring-loaded navigation during drag
- `UISpringLoadedInteractionBehavior`: Specify the behavior of a spring-loaded interaction
- `UISpringLoadedInteractionSupporting`: Determine if an object supports spring-loading

#### Custom Drag Item Previews

```swift
class UIDragPreviewParameters
// Parameters for adjusting the appearance of a drag item preview

class UIDragPreview
// A graphical preview for a single drag item

class UITargetedDragPreview
// A drag item preview used by the system during animations
```

---

## Document Interaction

Source: https://developer.apple.com/documentation/uikit/providing_access_to_directories

Use a document picker to access the content of a directory outside your app's container.

### Overview

In iOS 13, users can select a directory from any of the available file providers using a `UIDocumentPickerViewController`. The document picker returns a security-scoped URL for the directory that permits your app to access content outside its container. The URL lets your app recursively access the directory and all of its contents, which includes accessing any new items you add to the directory in the future.

### Ask the User to Select a Directory

```swift
// Create a document picker for directories.
let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.folder])
documentPicker.delegate = self

// Set the initial directory.
documentPicker.directoryURL = startingDirectory

// Present the document picker.
present(documentPicker, animated: true, completion: nil)
```

### Access the Directory's Content

When the user selects a directory, the system gives your app permission to access that directory and all of its contents:

```swift
func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
    // Start accessing a security-scoped resource.
    guard url.startAccessingSecurityScopedResource() else {
        // Handle the failure here.
        return
    }

    // Make sure you release the security-scoped resource when you finish.
    defer { url.stopAccessingSecurityScopedResource() }

    // Use file coordination for reading and writing any of the URL's content.
    var error: NSError? = nil
    NSFileCoordinator().coordinate(readingItemAt: url, error: &error) { (url) in

        let keys : [URLResourceKey] = [.nameKey, .isDirectoryKey]

        // Get an enumerator for the directory's content.
        guard let fileList = FileManager.default.enumerator(at: url, includingPropertiesForKeys: keys) else {
            Swift.debugPrint("*** Unable to access the contents of \(url.path) ***\n")
            return
        }

        for case let file as URL in fileList {
            // Start accessing the content's security-scoped URL.
            guard file.startAccessingSecurityScopedResource() else {
                // Handle the failure here.
                continue
            }

            // Do something with the file here.
            Swift.debugPrint("chosen file: \(file.lastPathComponent)")

            // Make sure you release the security-scoped resource when you finish.
            file.stopAccessingSecurityScopedResource()
        }
    }
}
```

### Save the URL as a Bookmark

To access the URL in the future, save it as a bookmark:

```swift
do {
    // Start accessing a security-scoped resource.
    guard url.startAccessingSecurityScopedResource() else {
        // Handle the failure here.
        return
    }

    // Make sure you release the security-scoped resource when you finish.
    defer { url.stopAccessingSecurityScopedResource() }

    let bookmarkData = try url.bookmarkData(options: .minimalBookmark, includingResourceValuesForKeys: nil, relativeTo: nil)

    try bookmarkData.write(to: getMyURLForBookmark())
}
catch let error {
    // Handle the error here.
}
```

### Respond to Permission Changes

Users can revoke or restore permission for each app at any time through Settings > Privacy > Files and Folders. Your app must be ready to handle failures when accessing a directory's content.

---

## Additional iPadOS Features

### Apple Pencil Integration
- PencilKit framework for digital ink experiences
- PKCanvasView for displaying and editing drawings
- UIPencilInteraction for handling double-tap and squeeze gestures
- Apple Pencil Hover detection

### Stage Manager
- UIWindowScene.ActivationConfiguration for window activation
- UIWindowScene.PresentationStyle for window presentation control
- UIWindowScene.SizeRestrictions for defining window size constraints
- Optimizing your app for Stage Manager compatibility

### External Display Support
- UIScreen for managing content on external displays
- UIScreenMode for configuring display modes
- AVRoutePickerView for display route selection
- Notifications for display connection/disconnection

### Multitasking Features
- UISplitViewController for master-detail interfaces
- Slide Over and Split View support
- Picture in Picture for video playback
- UITraitCollection for responding to size changes

### iPad-Specific UI Patterns
- UIPopoverPresentationController for popovers
- Large titles in navigation bars
- UICollectionView compositional layouts
- UIMenu and context menus
- UIDocumentBrowserViewController for document-based apps

### Performance Optimization
- ProMotion Display optimization for 120Hz displays
- Metal Performance Shaders for graphics acceleration
- Instruments for profiling and optimization
- Energy efficiency guidelines

### Accessibility
- VoiceOver support for screen reader navigation
- Dynamic Type for adjustable text sizes
- AssistiveTouch for alternative input methods
- Switch Control for switch-based navigation

---

## Conclusion

This comprehensive guide covers the essential aspects of iPadOS development, from platform fundamentals to advanced features like multiple windows, drag and drop, and Mac Catalyst. By leveraging these capabilities, developers can create powerful, intuitive apps that take full advantage of the iPad's unique capabilities and provide exceptional user experiences.

For the latest updates and additional resources, visit:
- [iPadOS Developer Portal](https://developer.apple.com/ipados/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/platforms/designing-for-ipados)
- [iPadOS Release Notes](https://developer.apple.com/documentation/ipados-release-notes)