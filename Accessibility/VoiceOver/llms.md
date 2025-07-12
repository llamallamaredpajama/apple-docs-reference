# Apple VoiceOver Documentation

## Overview

VoiceOver is Apple's built-in screen reader that enables people to experience and control their devices without seeing the screen. This comprehensive guide covers VoiceOver implementation, testing, best practices, and advanced features for iOS, iPadOS, macOS, tvOS, watchOS, and visionOS.

## Table of Contents

1. [VoiceOver Fundamentals](#voiceover-fundamentals)
2. [Key Gestures and Navigation](#key-gestures-and-navigation)
3. [Implementation Guidelines](#implementation-guidelines)
4. [Testing and Evaluation](#testing-and-evaluation)
5. [Advanced VoiceOver Features](#advanced-voiceover-features)
6. [Platform-Specific Considerations](#platform-specific-considerations)
7. [Best Practices](#best-practices)
8. [Common Issues and Solutions](#common-issues-and-solutions)

## VoiceOver Fundamentals

### What is VoiceOver?

VoiceOver is a gesture-based screen reader that provides auditory descriptions of onscreen elements and enables navigation through touch, keyboard, or voice commands. It's essential for users who are blind or have low vision, but also benefits users in various situations (e.g., motion sickness while in a vehicle).

### Core Principles

- **Everything accessible**: If you can tap, click, or drag something, it should work with VoiceOver
- **Clear labels**: Every element needs concise, meaningful descriptions
- **Logical navigation**: Elements should be navigable in a sensible order
- **Status communication**: Convey states and values through accessibility traits
- **Consistent behavior**: VoiceOver gestures should trigger expected actions

## Key Gestures and Navigation

### iOS/iPadOS Touch Gestures

#### Basic Navigation
- **Swipe left/right**: Navigate to previous/next element
- **Single tap**: Select and hear description of tapped element
- **Double tap**: Activate selected element
- **Two-finger tap**: Pause/resume speaking
- **Two-finger swipe up**: Read everything from top of screen
- **Three-finger triple tap**: Toggle Screen Curtain on/off

#### Advanced Navigation
- **Two-finger rotate**: Access rotor for navigation options
- **Swipe up/down**: Navigate rotor options or adjust values
- **Three-finger swipe**: Scroll pages
- **Four-finger tap**: Jump to first/last element

### macOS Keyboard Commands

- **VO+Space**: Activate selected element
- **VO+Right/Left Arrow**: Navigate next/previous element
- **VO+Shift+M**: Show context menu
- **Command+F5**: Toggle VoiceOver on/off
- **VO+F8**: VoiceOver Utility
- **VO+U**: Rotor menu

### VoiceOver Rotor

The rotor provides quick access to:
- Headings
- Links
- Form controls
- Tables
- Landmarks
- Custom rotors
- Text navigation options

## Implementation Guidelines

### Accessibility Labels

```swift
// UIKit
button.accessibilityLabel = "Play Song"
button.accessibilityHint = "Plays the selected song"

// SwiftUI
Button(action: playSong) {
    Image(systemName: "play.circle")
}
.accessibilityLabel("Play Song")
.accessibilityHint("Plays the selected song")
```

#### Label Best Practices
- Keep labels concise and informative
- Don't include control type (e.g., "button") - VoiceOver announces this
- Make labels understandable out of context
- For images, provide meaningful descriptions or mark decorative images as hidden
- Update labels dynamically when content changes

### Accessibility Traits

```swift
// UIKit
control.accessibilityTraits = [.button, .selected]

// SwiftUI
Toggle("Notifications", isOn: $notificationsEnabled)
    .accessibilityAddTraits(.isButton)
    .accessibilityRemoveTraits(.isToggle)
```

Common traits:
- `.button`: Interactive control
- `.selected`: Currently selected state
- `.adjustable`: Value can be adjusted
- `.updatesFrequently`: Content changes often
- `.startsMediaSession`: Starts audio/video
- `.header`: Section header

### Grouping Elements

```swift
// UIKit
let groupedElement = UIAccessibilityElement(accessibilityContainer: self)
groupedElement.accessibilityLabel = "\(nameLabel.text!), \(emailLabel.text!)"
groupedElement.accessibilityFrameInContainerSpace = nameLabel.frame.union(emailLabel.frame)
```

### Custom Actions

```swift
// UIKit
let deleteAction = UIAccessibilityCustomAction(
    name: "Delete",
    target: self,
    selector: #selector(deleteItem)
)
cell.accessibilityCustomActions = [deleteAction]

// SwiftUI
.accessibilityAction(named: "Delete") {
    deleteItem()
}
```

### Notifications

```swift
// Announce changes
UIAccessibility.post(notification: .announcement, argument: "Item deleted")

// Screen changed
UIAccessibility.post(notification: .screenChanged, argument: newFocusElement)

// Layout changed
UIAccessibility.post(notification: .layoutChanged, argument: nil)
```

## Testing and Evaluation

### Setting Up Testing Environment

1. **Enable VoiceOver**
   - iOS: Settings > Accessibility > VoiceOver
   - macOS: System Settings > Accessibility > VoiceOver
   - Set up Accessibility Shortcut for quick toggle

2. **Configure VoiceOver**
   - Adjust speaking rate
   - Enable Speak Hints
   - Configure verbosity settings

3. **Testing Checklist**
   - [ ] All interactive elements are accessible
   - [ ] Labels are clear and concise
   - [ ] Navigation order is logical
   - [ ] Custom controls behave like standard ones
   - [ ] Modal views trap focus appropriately
   - [ ] Dynamic content updates are announced
   - [ ] Complex gestures have accessible alternatives

### Screen Curtain Testing

Enable Screen Curtain (three-finger triple tap) to experience the app without visual feedback, ensuring the app is fully usable with audio alone.

### Common Testing Scenarios

1. **First Launch Experience**
   - Can complete onboarding without sight?
   - Are all options accessible?

2. **Form Input**
   - Text fields properly labeled?
   - Error messages announced?
   - Validation feedback accessible?

3. **Navigation**
   - Can navigate between screens?
   - Is back navigation clear?
   - Are tab bars and navigation bars accessible?

4. **Media Content**
   - Play/pause controls accessible?
   - Progress indicators readable?
   - Volume controls adjustable?

## Advanced VoiceOver Features

### Custom Rotors

```swift
// Create custom rotor for specific content
let customRotor = UIAccessibilityCustomRotor(name: "Headings") { predicate in
    // Return next/previous heading based on predicate.searchDirection
}
self.accessibilityCustomRotors = [customRotor]
```

### Direct Touch Areas

For areas requiring direct interaction (e.g., piano keyboard, drawing canvas):

```swift
pianoView.accessibilityTraits = .allowsDirectInteraction
pianoView.accessibilityDirectTouchOptions = [.silentOnTouch, .requiresActivation]
```

Options:
- `.silentOnTouch`: VoiceOver stays quiet during touch
- `.requiresActivation`: Requires double-tap before direct interaction

### Adjustable Elements

```swift
slider.accessibilityTraits = .adjustable

override func accessibilityIncrement() {
    value += 1
    updateDisplay()
}

override func accessibilityDecrement() {
    value -= 1
    updateDisplay()
}
```

### Accessibility Elements Container

```swift
override var accessibilityElementCount: Int {
    return items.count
}

override func accessibilityElement(at index: Int) -> Any? {
    return items[index]
}

override func index(of element: Any) -> Int {
    guard let item = element as? ItemType else { return NSNotFound }
    return items.firstIndex(of: item) ?? NSNotFound
}
```

## Platform-Specific Considerations

### iOS/iPadOS
- Support both portrait and landscape orientations
- Handle Dynamic Type for text sizing
- Consider iPad-specific layouts and split views
- Test with external keyboards

### macOS
- Implement keyboard navigation
- Support VoiceOver Commander
- Handle menu bar accessibility
- Consider trackpad gestures

### tvOS
- Focus engine integration
- Remote control navigation
- Limited gestures available
- Larger UI elements needed

### watchOS
- Crown navigation support
- Simplified interactions
- Brief, essential labels
- Consider smaller screen

### visionOS
- 3D spatial considerations
- Hand tracking gestures
- Eye tracking integration
- Immersive experiences

## Best Practices

### Label Writing Guidelines

**Do:**
- "Play" not "Play button"
- "Delete message" not "Trash icon"
- "2 of 5 stars" not "Star star empty star empty star empty star"
- Include state: "Notifications, on"

**Don't:**
- Use placeholder text as labels
- Include redundant information
- Use technical jargon
- Rely solely on visual position

### Navigation Patterns

1. **Linear Navigation**
   - Ensure all elements are reachable
   - Group related items
   - Provide skip options for repetitive content

2. **Custom Controls**
   - Mimic standard control behavior
   - Provide all expected gestures
   - Include proper traits and states

3. **Dynamic Content**
   - Announce important changes
   - Maintain focus position during updates
   - Provide loading states

### Performance Optimization

- Cache accessibility labels for complex calculations
- Avoid frequent layout changes
- Batch accessibility updates
- Use appropriate notification types

## Common Issues and Solutions

### Issue: Elements Not Accessible

**Solution:**
```swift
element.isAccessibilityElement = true
element.accessibilityLabel = "Descriptive label"
```

### Issue: Wrong Navigation Order

**Solution:**
```swift
view.accessibilityElements = [element1, element2, element3]
```

### Issue: Modal Dialogs Allow Background Access

**Solution:**
```swift
modalView.accessibilityViewIsModal = true
```

### Issue: Custom Gestures Not Accessible

**Solution:**
Provide alternative interactions through custom actions or standard controls

### Issue: Dynamic Content Not Announced

**Solution:**
```swift
UIAccessibility.post(notification: .announcement, argument: "Content updated")
```

### Issue: Complex Tables/Collections

**Solution:**
Implement proper accessibility container protocols and provide row/column information

## Evaluation Criteria Summary

To indicate "Supports VoiceOver" on the App Store:

1. **Complete Task Coverage**: All common tasks completable with VoiceOver alone
2. **Accurate Labels**: Every control has clear, concise labels
3. **Proper Traits**: Elements convey type and state correctly
4. **Logical Navigation**: Consistent, predictable navigation order
5. **Full Operability**: All interactions possible through VoiceOver
6. **Dynamic Feedback**: Changes and errors properly announced
7. **No Dead Ends**: Users can always navigate away from any element
8. **Custom Control Parity**: Custom elements work like standard ones

## Resources and References

### Official Documentation
- [Supporting VoiceOver in your app](https://developer.apple.com/documentation/uikit/supporting-voiceover-in-your-app)
- [UIAccessibility Protocol Reference](https://developer.apple.com/documentation/uikit/uiaccessibility)
- [Accessibility API Documentation](https://developer.apple.com/documentation/accessibility)

### WWDC Sessions
- "Writing Great Accessibility Labels"
- "VoiceOver efficiency with custom rotors"
- "Tailor the VoiceOver experience in data-rich apps"
- "Bring accessibility to charts in your app"

### Testing Guides
- [VoiceOver User Guide for iOS](https://support.apple.com/guide/iphone/welcome/ios)
- [VoiceOver User Guide for macOS](https://support.apple.com/guide/voiceover/welcome/mac)
- [Accessibility Inspector](https://developer.apple.com/documentation/accessibility/accessibility-inspector)

### Code Examples
- [Apple Accessibility Code Examples](https://developer.apple.com/documentation/accessibility)
- [Unity Accessibility Plugin](https://github.com/apple/unityplugins/tree/main)

## Conclusion

VoiceOver support is not just about compliance—it's about ensuring your app is usable by everyone. By following these guidelines and regularly testing with VoiceOver, you can create an inclusive experience that serves all users effectively. Remember that accessibility is an ongoing process; continue to gather feedback and improve your app's VoiceOver support with each release.