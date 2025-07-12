# https://developer.apple.com/documentation/ipados llms.txt

## iPadOS Platform Overview
- [iPadOS Overview](https://developer.apple.com/documentation/ipados): Develop powerful, intuitive apps for iPad with iPadOS-specific features
- [iPadOS 18 Release Notes](https://developer.apple.com/documentation/ipados-release-notes): Latest features and changes in iPadOS 18
- [Human Interface Guidelines - iPadOS](https://developer.apple.com/design/human-interface-guidelines/platforms/designing-for-ipados): Design principles for creating great iPad experiences

## Multi-Window Support
- [UIWindowScene](https://developer.apple.com/documentation/uikit/uiwindowscene): Manage multiple windows of your app on iPad
- [UISceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate): Handle scene lifecycle events for multi-window apps
- [UISceneSession](https://developer.apple.com/documentation/uikit/uiscenesession): Manage persistent interface state for app scenes
- [Supporting Multiple Windows on iPad](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/supporting_multiple_windows_on_ipad): Enable multi-window support in your iPad app
- [UIOpenURLContext](https://developer.apple.com/documentation/uikit/uiopenurlcontext): Handle URLs opened in specific scenes
- [Preserving Your App's UI Across Launches](https://developer.apple.com/documentation/uikit/view_controllers/preserving_your_app_s_ui_across_launches): Restore scene state between app launches

## Apple Pencil Integration
- [PencilKit](https://developer.apple.com/documentation/pencilkit): Create digital ink experiences with Apple Pencil
- [PKCanvasView](https://developer.apple.com/documentation/pencilkit/pkcanvasview): Display and edit drawings with Apple Pencil
- [PKDrawing](https://developer.apple.com/documentation/pencilkit/pkdrawing): Represent and manipulate drawn content
- [PKInkingTool](https://developer.apple.com/documentation/pencilkit/pkinkingtool): Configure pen, pencil, and marker tools
- [PKStroke](https://developer.apple.com/documentation/pencilkit/pkstroke): Represent individual strokes made with Apple Pencil
- [UITouch.TouchType](https://developer.apple.com/documentation/uikit/uitouch/touchtype): Distinguish between finger and pencil touches
- [UIPencilInteraction](https://developer.apple.com/documentation/uikit/uipencilinteraction): Handle double-tap and squeeze gestures on Apple Pencil
- [Apple Pencil Hover](https://developer.apple.com/documentation/uikit/pencil_interactions/handling_input_from_apple_pencil): Detect when Apple Pencil hovers over the screen
- [PKToolPicker](https://developer.apple.com/documentation/pencilkit/pktoolpicker): Display drawing tool palette for Apple Pencil

## Stage Manager
- [UIWindowScene.ActivationConfiguration](https://developer.apple.com/documentation/uikit/uiwindowscene/activationconfiguration): Configure window activation for Stage Manager
- [UIWindowScene.PresentationStyle](https://developer.apple.com/documentation/uikit/uiwindowscene/presentationstyle): Control window presentation in Stage Manager
- [Optimizing Your App for Stage Manager](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking/optimizing_your_app_for_stage_manager): Best practices for Stage Manager compatibility
- [UIWindowScene.SizeRestrictions](https://developer.apple.com/documentation/uikit/uiwindowscene/sizerestrictions): Define minimum and maximum window sizes
- [UISceneActivationRequestOptions](https://developer.apple.com/documentation/uikit/uisceneactivationrequestoptions): Configure scene activation behavior

## External Display Support
- [UIScreen](https://developer.apple.com/documentation/uikit/uiscreen): Manage content on external displays
- [Displaying Content on a Connected Screen](https://developer.apple.com/documentation/uikit/windows_and_screens/displaying_content_on_a_connected_screen): Present content on external displays
- [UIScreenMode](https://developer.apple.com/documentation/uikit/uiscreenmode): Configure display modes for external screens
- [AVRoutePickerView](https://developer.apple.com/documentation/avkit/avroutepickerview): Let users select external display routes
- [UIScreen.didConnectNotification](https://developer.apple.com/documentation/uikit/uiscreen/1617825-didconnectnotification): Detect when external displays connect
- [UIScreen.didDisconnectNotification](https://developer.apple.com/documentation/uikit/uiscreen/1617835-diddisconnectnotification): Detect when external displays disconnect

## Multitasking Features
- [UISplitViewController](https://developer.apple.com/documentation/uikit/uisplitviewcontroller): Create master-detail interfaces for multitasking
- [UIMultitaskingDragAndDropSession](https://developer.apple.com/documentation/uikit/uimultitaskingdraganddropsession): Support drag and drop between apps
- [Slide Over and Split View](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking/supporting_multitasking_on_ipad): Enable Slide Over and Split View multitasking
- [UIUserInterfaceIdiom](https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom): Detect and adapt to iPad interface idiom
- [UITraitCollection](https://developer.apple.com/documentation/uikit/uitraitcollection): Respond to multitasking size changes
- [Picture in Picture](https://developer.apple.com/documentation/avkit/adopting_picture_in_picture_in_a_standard_player): Support video playback during multitasking

## iPad-Specific UI Patterns
- [UIPopoverPresentationController](https://developer.apple.com/documentation/uikit/uipopoverpresentationcontroller): Present popovers on iPad
- [UINavigationBar - Large Titles](https://developer.apple.com/documentation/uikit/uinavigationbar): Use large titles in navigation bars
- [UICollectionView - Compositional Layout](https://developer.apple.com/documentation/uikit/uicollectionview): Create adaptive layouts for iPad
- [UIMenu](https://developer.apple.com/documentation/uikit/uimenu): Create context menus and pull-down menus
- [UIContextMenuInteraction](https://developer.apple.com/documentation/uikit/uicontextmenuinteraction): Add context menus to views
- [UIPointerInteraction](https://developer.apple.com/documentation/uikit/uipointerinteraction): Support trackpad and mouse interactions
- [Keyboard Shortcuts](https://developer.apple.com/documentation/uikit/uikeycommand): Add keyboard shortcuts for external keyboards
- [UIDocumentBrowserViewController](https://developer.apple.com/documentation/uikit/uidocumentbrowserviewcontroller): Create document-based iPad apps

## Adaptive Layout
- [Size Classes](https://developer.apple.com/documentation/uikit/uiuserinterfacesizeclass): Design adaptive interfaces for different iPad sizes
- [Trait Collections](https://developer.apple.com/documentation/uikit/uitraitcollection): Respond to interface environment changes
- [Auto Layout](https://developer.apple.com/documentation/uikit/view_layout/auto_layout): Create flexible layouts that adapt to screen size
- [Safe Area Layout Guide](https://developer.apple.com/documentation/uikit/uiview/positioning_content_within_layout_margins): Position content within safe areas
- [Readable Content Guide](https://developer.apple.com/documentation/uikit/uiview/1622644-readablecontentguide): Optimize text layout for readability

## iPadOS-Specific Frameworks
- [WidgetKit](https://developer.apple.com/documentation/widgetkit): Create widgets for iPad Home Screen
- [App Intents](https://developer.apple.com/documentation/appintents): Build Shortcuts and Siri integration
- [RealityKit](https://developer.apple.com/documentation/realitykit): Create AR experiences on iPad
- [Core ML](https://developer.apple.com/documentation/coreml): Run machine learning models on iPad
- [Create ML](https://developer.apple.com/documentation/createml): Train machine learning models on iPad

## File Management
- [UIDocumentPickerViewController](https://developer.apple.com/documentation/uikit/uidocumentpickerviewcontroller): Access files from various sources
- [FileProvider](https://developer.apple.com/documentation/fileprovider): Integrate with Files app
- [UIDocument](https://developer.apple.com/documentation/uikit/uidocument): Create document-based apps
- [Quick Look](https://developer.apple.com/documentation/quicklook): Preview documents and files

## Performance Optimization
- [ProMotion Display](https://developer.apple.com/documentation/quartzcore/optimizing_promotion_refresh_rates): Optimize for 120Hz displays
- [Metal Performance Shaders](https://developer.apple.com/documentation/metalperformanceshaders): Accelerate graphics on iPad
- [Instruments](https://developer.apple.com/documentation/xcode/instruments): Profile and optimize iPad apps
- [Energy Efficiency Guide](https://developer.apple.com/documentation/performance/energy_efficiency_guide_for_ios_apps): Optimize battery life

## Accessibility
- [VoiceOver on iPad](https://developer.apple.com/documentation/accessibility/supporting_voiceover_in_your_app): Support screen reader navigation
- [Dynamic Type](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically): Support adjustable text sizes
- [AssistiveTouch](https://developer.apple.com/documentation/accessibility/assistivetouch): Support alternative input methods
- [Switch Control](https://developer.apple.com/documentation/accessibility/switch_control): Enable switch-based navigation

## App Extensions
- [Share Extensions](https://developer.apple.com/documentation/uikit/app_extensions/share): Create sharing extensions for iPad
- [Action Extensions](https://developer.apple.com/documentation/uikit/app_extensions/action): Build action extensions
- [Today Widgets](https://developer.apple.com/documentation/widgetkit): Create widgets for Today View
- [Custom Keyboards](https://developer.apple.com/documentation/uikit/keyboards_and_input/creating_a_custom_keyboard): Build custom keyboard extensions

## Additional Resources
- [iPad App Development](https://developer.apple.com/ipad/): Official iPad development portal
- [Design for iPad](https://developer.apple.com/design/human-interface-guidelines/platforms/designing-for-ipados): Human interface guidelines
- [iPad Business](https://developer.apple.com/ipad/business/): Enterprise and education features
- [TestFlight for iPad](https://developer.apple.com/testflight/): Beta testing iPad apps