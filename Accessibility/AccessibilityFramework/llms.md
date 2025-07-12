# Accessibility Framework - Core APIs

## Overview
This document covers the core accessibility APIs across Apple platforms, complementing the main Accessibility documentation.

## NSAccessibility (macOS)
- [NSAccessibility Protocol](https://developer.apple.com/documentation/appkit/nsaccessibility): Core accessibility protocol for macOS
- [NSAccessibilityElement](https://developer.apple.com/documentation/appkit/nsaccessibilityelement): Accessibility element for macOS
- [NSAccessibilityCustomRotor](https://developer.apple.com/documentation/appkit/nsaccessibilitycustomrotor): Custom rotors for macOS
- [NSAccessibilityProtocols](https://developer.apple.com/documentation/appkit/nsaccessibilityprotocols): Collection of accessibility protocols

## AXFoundation
- [AXCustomContent](https://developer.apple.com/documentation/accessibility/axcustomcontent): Custom accessibility content
- [AXChart](https://developer.apple.com/documentation/accessibility/axchart): Accessible chart data
- [AXDataSeries](https://developer.apple.com/documentation/accessibility/axdataseries): Data series for accessible charts
- [AXDataPoint](https://developer.apple.com/documentation/accessibility/axdatapoint): Individual data points in charts

## Accessibility Notifications
- [UIAccessibility.Notification](https://developer.apple.com/documentation/uikit/uiaccessibility/notification): All accessibility notifications
- [NSAccessibilityNotificationName](https://developer.apple.com/documentation/appkit/nsaccessibilitynotificationname): macOS notification names
- [UIAccessibilityPostNotification](https://developer.apple.com/documentation/uikit/1615194-uiaccessibilitypostnotification): Post accessibility notifications

## Accessibility Containers
- [UIAccessibilityContainer](https://developer.apple.com/documentation/uikit/accessibility/uiaccessibilitycontainer): Container protocol
- [UIAccessibilityContainerType](https://developer.apple.com/documentation/uikit/uiaccessibilitycontainertype): Container types
- [accessibilityElements](https://developer.apple.com/documentation/uikit/uiaccessibility/1615147-accessibilityelements): Container elements

## Focus and Navigation
- [UIAccessibilityFocus](https://developer.apple.com/documentation/uikit/accessibility/delivering_an_exceptional_accessibility_experience): Focus management
- [accessibilityScroll](https://developer.apple.com/documentation/uikit/uiaccessibility/1615165-accessibilityscroll): Scroll direction
- [UIAccessibilityNavigationStyle](https://developer.apple.com/documentation/uikit/uiaccessibilitynavigationstyle): Navigation styles

## Speech and Audio
- [AVSpeechSynthesizer](https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer): Text-to-speech
- [AVSpeechUtterance](https://developer.apple.com/documentation/avfaudio/avspeechutterance): Speech utterances
- [UIAccessibilitySpeechAttributeKey](https://developer.apple.com/documentation/uikit/uiaccessibilityspeechattributekey): Speech attributes

## Testing and Validation
- [XCUIAccessibility](https://developer.apple.com/documentation/xctest/xcuiaccessibility): UI testing accessibility
- [UIAccessibilityReadingContent](https://developer.apple.com/documentation/uikit/uiaccessibilityreadingcontent): Reading content protocol
- [Accessibility Inspector](https://developer.apple.com/library/archive/documentation/Accessibility/Conceptual/AccessibilityMacOSX/OSXAXTestingApps.html): Testing tool

## Platform-Specific APIs
- [WKAccessibility](https://developer.apple.com/documentation/watchkit/wkaccessibility): watchOS accessibility
- [TVUIKit Accessibility](https://developer.apple.com/documentation/tvuikit): tvOS specific features
- [visionOS Accessibility](https://developer.apple.com/documentation/visionos/improving-accessibility-support-in-your-app): Spatial computing accessibility

## Best Practices
- [Accessibility Programming Guide](https://developer.apple.com/library/archive/documentation/Accessibility/Conceptual/AccessibilityMacOSX/index.html): Comprehensive guide
- [Supporting VoiceOver](https://developer.apple.com/documentation/accessibility/supporting-voiceover-in-your-app): VoiceOver implementation
- [Accessibility for Developers](https://developer.apple.com/accessibility/): Main accessibility portal