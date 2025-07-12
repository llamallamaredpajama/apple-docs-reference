# https://developer.apple.com/documentation/widgetkit llms.txt

- [WidgetKit Framework](https://developer.apple.com/documentation/widgetkit): Extend the reach of your app by creating widgets, watch complications, Live Activities, and controls.

## Widget Creation and Configuration
- [Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension): Display your app's content in a convenient, informative widget on various devices.
- [Widget Protocol](https://developer.apple.com/documentation/SwiftUI/Widget): The configuration and content of a widget to display on the Home screen or in Notification Center.
- [WidgetBundle Protocol](https://developer.apple.com/documentation/SwiftUI/WidgetBundle): A container used to expose multiple widgets from a single widget extension.
- [StaticConfiguration](https://developer.apple.com/documentation/widgetkit/staticconfiguration): An object describing the content of a widget that has no user-configurable options.
- [AppIntentConfiguration](https://developer.apple.com/documentation/widgetkit/appintentconfiguration): An object describing the content of a widget that uses a custom intent to provide user-configurable options.
- [IntentConfiguration](https://developer.apple.com/documentation/widgetkit/intentconfiguration): An object describing the content of a widget that uses a custom intent definition to provide user-configurable options.

## Widget Families and Sizes
- [WidgetFamily](https://developer.apple.com/documentation/widgetkit/widgetfamily): Values that define the widget's size and shape.
- [Supporting additional widget sizes](https://developer.apple.com/documentation/widgetkit/supporting-additional-widget-sizes): Offer widgets in additional contexts by adding support for various widget sizes.
- [Creating accessory widgets and watch complications](https://developer.apple.com/documentation/widgetkit/creating-accessory-widgets-and-watch-complications): Support accessory widgets that appear on the Lock Screen and as complications on Apple Watch.

## Timeline Providers
- [TimelineProvider Protocol](https://developer.apple.com/documentation/widgetkit/timelineprovider): A type that advises WidgetKit when to update a widget's display.
- [AppIntentTimelineProvider Protocol](https://developer.apple.com/documentation/widgetkit/appintenttimelineprovider): A type that advises WidgetKit when to update a user-configurable widget's display.
- [IntentTimelineProvider Protocol](https://developer.apple.com/documentation/widgetkit/intenttimelineprovider): A type that advises WidgetKit when to update a user-configurable widget's display.
- [TimelineProviderContext](https://developer.apple.com/documentation/widgetkit/timelineprovidercontext): An object that contains details about how a widget is rendered, including its size and whether it appears in the widget gallery.

## Timeline Management
- [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date): Plan your widget's timeline to show timely, relevant information using dynamic views, and update the timeline when things change.
- [TimelineEntry Protocol](https://developer.apple.com/documentation/widgetkit/timelineentry): A type that specifies the date to display a widget, and, optionally, indicates the current relevance of the widget's content.
- [Timeline](https://developer.apple.com/documentation/widgetkit/timeline): An object that specifies a date for WidgetKit to update a widget's view.
- [WidgetCenter](https://developer.apple.com/documentation/widgetkit/widgetcenter): An object that contains a list of user-configured widgets and is used for reloading widget timelines.
- [TimelineEntryRelevance](https://developer.apple.com/documentation/widgetkit/timelineentryrelevance): An object that describes the relative importance of a timeline entry compared to other entries in the current and past timelines.

## Widget Views and UI
- [Creating views for widgets, Live Activities, and watch complications](https://developer.apple.com/documentation/widgetkit/creating-views-for-widgets-live-activities-and-watch-complications): Implement glanceable views with WidgetKit and SwiftUI.
- [SwiftUI views for widgets](https://developer.apple.com/documentation/widgetkit/swiftui-views): Present your app's content in widgets with SwiftUI views.
- [AccessoryWidgetBackground](https://developer.apple.com/documentation/widgetkit/accessorywidgetbackground): An adaptive background view that provides a standard appearance based on the the widget's environment.
- [AccessoryWidgetGroup](https://developer.apple.com/documentation/widgetkit/accessorywidgetgroup): A view type that has a label at the top and three content views masked with a circle or rounded square.
- [Displaying the right widget background](https://developer.apple.com/documentation/widgetkit/displaying-the-right-widget-background): Group your widget's background views and mark them as removable to ensure your widget appears correctly for each context and platform.

## Widget Rendering and Appearance
- [WidgetRenderingMode](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode): Constants that indicate the rendering mode for a widget.
- [WidgetAccentedRenderingMode](https://developer.apple.com/documentation/widgetkit/widgetaccentedrenderingmode): Constants that indicate the rendering mode for an Image in when displayed in a widget in accented mode.
- [Optimizing your widget for accented rendering mode and Liquid Glass](https://developer.apple.com/documentation/widgetkit/optimizing-your-widget-for-accented-rendering-mode-and-liquid-glass): Make your widget feel at home on Apple platforms and Liquid Glass by using accented rendering mode.
- [WidgetLocation](https://developer.apple.com/documentation/widgetkit/widgetlocation): Values that indicate different widget locations.

## Interactivity
- [Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities): Include buttons or toggles in a widget or Live Activity to offer app functionality without launching the app.
- [Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity): Add deep links to your widgets and Live Activities that enable people to open a specific scene in your app.
- [Animating data updates in widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities): Use SwiftUI animations to indicate data updates in your widgets and Live Activities.

## Widget Configuration
- [Making a configurable widget](https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget): Give people the option to customize their widgets by adding a custom app intent to your project.
- [WidgetInfo](https://developer.apple.com/documentation/widgetkit/widgetinfo): A structure that contains information about user-configured widgets.
- [AppIntentRecommendation](https://developer.apple.com/documentation/widgetkit/appintentrecommendation): An object that describes a recommended intent configuration for a user-customizable widget.
- [IntentRecommendation](https://developer.apple.com/documentation/widgetkit/intentrecommendation): An object that describes a recommended intent configuration for a user-customizable widget.

## Live Activities
- [ActivityConfiguration](https://developer.apple.com/documentation/widgetkit/activityconfiguration): An object that describes the content of a Live Activity.
- [DynamicIsland](https://developer.apple.com/documentation/widgetkit/dynamicisland): The layout and configuration for a Live Activity that appears in the Dynamic Island.
- [ActivityFamily](https://developer.apple.com/documentation/widgetkit/activityfamily): A family that defines the Live Activity's size.
- [ActivityPreviewViewKind](https://developer.apple.com/documentation/widgetkit/activitypreviewviewkind): Values that represent Live Activity presentations for use in Xcode previews.
- [NSUserActivityTypeLiveActivity](https://developer.apple.com/documentation/widgetkit/nsuseractivitytypeliveactivity): A string that the system passes to the app on launch from a Live Activity that doesn't provide a URL.

## Controls
- [Creating controls to perform actions across the system](https://developer.apple.com/documentation/widgetkit/creating-controls-to-perform-actions-across-the-system): Perform your app's actions from Control Center, the Lock Screen, and the Action button.
- [Adding refinements and configuration to controls](https://developer.apple.com/documentation/widgetkit/adding-refinements-and-configuration-to-controls): Customize the way controls display across the system and offer people the ability to configure them.
- [ControlWidgetToggle](https://developer.apple.com/documentation/widgetkit/controlwidgettoggle): A control template representing a toggle.
- [ControlWidgetButton](https://developer.apple.com/documentation/widgetkit/controlwidgetbutton): A control template representing a button.
- [ControlCenter](https://developer.apple.com/documentation/widgetkit/controlcenter): An object that contains a list of user-configured controls and is used for reloading controls.

## Control Configuration
- [StaticControlConfiguration](https://developer.apple.com/documentation/widgetkit/staticcontrolconfiguration): The description of a control widget that has no user-configurable options.
- [AppIntentControlConfiguration](https://developer.apple.com/documentation/widgetkit/appintentcontrolconfiguration): The description of a control widget that uses a custom intent to provide user-configurable options.
- [ControlInfo](https://developer.apple.com/documentation/widgetkit/controlinfo): A structure that contains information about user-configured controls.

## Control Values
- [ControlValueProvider Protocol](https://developer.apple.com/documentation/widgetkit/controlvalueprovider): A type that provides a value to a control widget template.
- [AppIntentControlValueProvider Protocol](https://developer.apple.com/documentation/widgetkit/appintentcontrolvalueprovider): A type that uses a custom intent to provide a value to a control template.

## Push Notifications
- [Updating widgets with WidgetKit push notifications](https://developer.apple.com/documentation/widgetkit/updating-widgets-with-widgetkit-push-notifications): Use WidgetKit to receive push tokens and reload your widgets with remote push notifications.
- [WidgetPushHandler Protocol](https://developer.apple.com/documentation/widgetkit/widgetpushhandler): A type that can receive push information about widget refreshes and relevance refreshes.
- [WidgetPushInfo](https://developer.apple.com/documentation/widgetkit/widgetpushinfo): A structure that contains information about the push token for updating widgets and widget relevances.
- [Updating controls locally and remotely](https://developer.apple.com/documentation/widgetkit/updating-controls-locally-and-remotely): Update and reload controls from your app or using push notifications.
- [ControlPushHandler Protocol](https://developer.apple.com/documentation/widgetkit/controlpushhandler): A type that can receive push information about user-configured controls.
- [ControlPushInfo](https://developer.apple.com/documentation/widgetkit/controlpushinfo): A structure that contains information about the push token of a user-configured control.

## Platform-Specific Features
- [Updating your widgets for visionOS](https://developer.apple.com/documentation/widgetkit/updating-your-widgets-for-visionos): Choose widget styles specific to visionOS, support recessed and elevated appearances, and add proximity awareness to your widget.
- [WidgetTexture](https://developer.apple.com/documentation/widgetkit/widgettexture): Values that define the texture of the widget's coating layer.
- [WidgetMountingStyle](https://developer.apple.com/documentation/widgetkit/widgetmountingstyle): Values that define the widget's supported mounting style.
- [LevelOfDetail](https://developer.apple.com/documentation/widgetkit/levelofdetail): The level of detail the view is recommended to have.
- [Adding StandBy and CarPlay support to your widget](https://developer.apple.com/documentation/widgetkit/adding-standby-and-carplay-support-to-your-widget): Ensure that your small system family widget works well in StandBy and CarPlay.

## Smart Stacks
- [Increasing the visibility of widgets in Smart Stacks](https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks): Provide contextual information and donate intents to the system to make sure your widget appears prominently in Smart Stacks.
- [RelevanceConfiguration](https://developer.apple.com/documentation/widgetkit/relevanceconfiguration): A type that describes the content of a widget that uses relevance clues.
- [RelevanceEntriesProvider Protocol](https://developer.apple.com/documentation/widgetkit/relevanceentriesprovider): A type that provides the content for a widget that uses relevance clues to display information in the Smart Stack.
- [RelevanceEntry Protocol](https://developer.apple.com/documentation/widgetkit/relevanceentry): A type that specifies the information to render a widget at a specific relevance configuration.
- [WidgetRelevance](https://developer.apple.com/documentation/widgetkit/widgetrelevance): A type collecting the relevances for a widget kind.
- [WidgetRelevanceAttribute](https://developer.apple.com/documentation/widgetkit/widgetrelevanceattribute): A type describing when a specific widget could be relevant.
- [WidgetRelevanceGroup](https://developer.apple.com/documentation/widgetkit/widgetrelevancegroup): A type for configuring widget behavior in the watchOS Smart Stack.

## Development and Debugging
- [Previewing widgets and Live Activities in Xcode](https://developer.apple.com/documentation/widgetkit/previewing-widgets-and-live-activities-in-xcode): Use Xcode previews to iteratively develop, fine-tune, and troubleshoot widgets and Live Activities.
- [Debugging widgets](https://developer.apple.com/documentation/widgetkit/debugging-widgets): Set environment variables in Xcode to control your widget's configuration in the debugger.
- [WidgetPreviewContext](https://developer.apple.com/documentation/widgetkit/widgetpreviewcontext): A specification for the context of a widget preview.
- [Preview macros](https://developer.apple.com/documentation/widgetkit/preview-macros): Use Swift macros to create widget previews in Xcode.

## Accessibility and Additional Features
- [Adding accessible descriptions to widgets and Live Activities](https://developer.apple.com/documentation/ActivityKit/adding-accessible-descriptions-to-widgets-and-live-activities): Describe the interface elements of your widgets and Live Activities to help people understand what they represent.
- [Accessing location information in widgets](https://developer.apple.com/documentation/widgetkit/accessing-location-information-in-widgets): Incorporate location information into your widget presentation to make it more relevant and contextual.
- [Making network requests in a widget extension](https://developer.apple.com/documentation/widgetkit/making-network-requests-in-a-widget-extension): Update your widget with new information you fetch with a network request.

## Migration
- [Migrating widgets from SiriKit Intents to App Intents](https://developer.apple.com/documentation/widgetkit/migrating-from-sirikit-intents-to-app-intents): Configure your widgets for backward compatibility.
- [Migrating ClockKit complications to WidgetKit](https://developer.apple.com/documentation/widgetkit/converting-a-clockkit-app): Leverage WidgetKit's API to create watchOS complications using SwiftUI.

## Sample Code
- [Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations): Offer Live Activities, controls, animate data updates, and add interactivity to widgets.

## Getting Started
- [Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy): Explore features, tasks, related frameworks, and constraints as you make a plan to implement widgets, controls, watch complications, and Live Activities.
- [WidgetKit updates](https://developer.apple.com/documentation/Updates/WidgetKit): Learn about important changes in WidgetKit.
- [Preparing widgets for additional platforms, contexts, and appearances](https://developer.apple.com/documentation/widgetkit/preparing-widgets-for-additional-contexts-and-appearances): Create widgets that support additional platforms and adapt to their context.