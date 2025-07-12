# Stage Manager Documentation

## Overview
Stage Manager is a window management system for iPadOS and macOS that enables flexible multitasking with overlapping, resizable windows.

## Core Documentation
- [Stage Manager Overview](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking_on_ipad/introducing_stage_manager): Introduction to Stage Manager
- [iPadOS Multitasking](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking_on_ipad): Multitasking features
- [Scene-Based App Design](https://developer.apple.com/documentation/uikit/app_and_environment/scenes): Scene architecture

## Window Management

### UIWindowScene
- [UIWindowScene](https://developer.apple.com/documentation/uikit/uiwindowscene): Window scene class
- [UIWindowScene.ActivationConfiguration](https://developer.apple.com/documentation/uikit/uiwindowscene/activationconfiguration): Window activation
- [requestSceneSessionActivation](https://developer.apple.com/documentation/uikit/uiapplication/3295948-requestscenesessionactivation): Activate scenes
- [Window Presentation](https://developer.apple.com/documentation/uikit/uiwindowscene/3975943-windowingbehavior): Windowing behavior

### Window Configuration
- [UISceneWindowingBehaviors](https://developer.apple.com/documentation/uikit/uiscenewindowingbehaviors): Window behaviors
- [UIWindowScene.PresentationStyle](https://developer.apple.com/documentation/uikit/uiwindowscene/presentationstyle): Presentation styles
- [preferredPresentationStyle](https://developer.apple.com/documentation/uikit/uiwindowscene/activationconfiguration/3975944-preferredpresentationstyle): Set presentation style

### External Display Support
- [UIScreen](https://developer.apple.com/documentation/uikit/uiscreen): External display detection
- [externalDisplays](https://developer.apple.com/documentation/uikit/windows_and_screens/presenting_content_on_a_connected_display): Connected displays
- [Display Modes](https://developer.apple.com/documentation/uikit/uiscreen/3813839-availabledisplaymodes): Available modes

## Window States and Behaviors

### Window Sizing
- [Resizable Windows](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking_on_ipad/enabling_your_app_for_multitasking): Enable resizing
- [Size Classes](https://developer.apple.com/documentation/uikit/uitraitcollection/1623513-horizontalsizeclass): Adaptive layouts
- [preferredContentSize](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621476-preferredcontentsize): Content sizing

### Window Positioning
- [Scene Activation](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_foreground): Foreground preparation
- [Scene Placement](https://developer.apple.com/documentation/uikit/uisceneactivationconditions): Activation conditions
- [geometryPreferences](https://developer.apple.com/documentation/swiftui/scene/4192338-windowresizability): Window preferences

## Multitasking Features

### App Switcher Integration
- [Scene Lifecycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle): Lifecycle management
- [State Restoration](https://developer.apple.com/documentation/uikit/uiscenedelegate/3238087-staterestorationactivity): Restore app state
- [Snapshot Generation](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background): Background snapshots

### Window Groups
- [Window Management](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/specifying_the_scenes_your_app_supports): Scene configuration
- [Multiple Windows](https://developer.apple.com/documentation/uikit/uiscenedelegate): Scene delegate
- [Window Coordination](https://developer.apple.com/documentation/uikit/uisceneactivationrequestoptions): Activation options

## User Interface Adaptations

### Layout Considerations
- [Trait Collections](https://developer.apple.com/documentation/uikit/uitraitcollection): Environment traits
- [Adaptive Layouts](https://developer.apple.com/documentation/uikit/view_layout/building_adaptive_user_interfaces_with_uikit): Responsive design
- [Safe Areas](https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area): Content positioning

### Toolbar and Navigation
- [UINavigationBar](https://developer.apple.com/documentation/uikit/uinavigationbar): Navigation adaptation
- [UIToolbar](https://developer.apple.com/documentation/uikit/uitoolbar): Toolbar in windows
- [Window Chrome](https://developer.apple.com/documentation/uikit/mac_catalyst/optimizing_your_ipad_app_for_mac): Chrome customization

## SwiftUI Integration

### Window Management
- [WindowGroup](https://developer.apple.com/documentation/swiftui/windowgroup): SwiftUI windows
- [Scene Modifiers](https://developer.apple.com/documentation/swiftui/scene): Scene configuration
- [Window Customization](https://developer.apple.com/documentation/swiftui/window): Window properties

### Presentation Styles
- [presentationSizing](https://developer.apple.com/documentation/swiftui/view/presentationsizing(_:)): Window sizing
- [presentationDetents](https://developer.apple.com/documentation/swiftui/view/presentationdetents(_:)): Presentation sizes
- [windowStyle](https://developer.apple.com/documentation/swiftui/scene/windowstyle(_:)): Window styling

## Performance Optimization

### Memory Management
- [Scene Memory](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_memory_warnings): Memory warnings
- [Background Tasks](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background): Background optimization
- [Resource Management](https://developer.apple.com/documentation/uikit/resource_management): Efficient resources

### Drawing Performance
- [CALayer Optimization](https://developer.apple.com/documentation/quartzcore/calayer): Layer performance
- [Metal Integration](https://developer.apple.com/documentation/metal): GPU acceleration
- [Render Loops](https://developer.apple.com/documentation/uikit/animation_and_haptics): Animation optimization

## Best Practices

### Design Guidelines
- Design for multiple window sizes
- Support dynamic resizing
- Maintain state across windows
- Handle external display scenarios
- Optimize for performance
- Test with various configurations

### Implementation Tips
- Use scene-based lifecycle
- Implement proper state restoration
- Support keyboard shortcuts
- Handle focus management
- Coordinate between windows
- Respect user preferences

## Platform Requirements
- iPadOS 16.0+ (iPad with M1 chip or later)
- macOS 13.0+ (Mac Catalyst apps)
- Requires compatible hardware

## Related Technologies
- [Split View](https://developer.apple.com/documentation/uikit/uisplitviewcontroller): Traditional multitasking
- [Slide Over](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking_on_ipad): Overlay windows
- [Picture in Picture](https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player): Video multitasking
- [Universal Control](https://support.apple.com/en-us/HT212757): Cross-device control