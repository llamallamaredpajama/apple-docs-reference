# SwiftUI Full Documentation

This file contains the full content of the most essential SwiftUI documentation pages for the Scriblo app development.

---

## SwiftUI Framework

[Skip Navigation](https://developer.apple.com/documentation/swiftui#app-main)

Framework

# SwiftUI

Declare the user interface and behavior for your app on every platform.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+

## [Overview](https://developer.apple.com/documentation/swiftui\#Overview)

SwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users see and interact with.

Define your app structure using the [`App`](https://developer.apple.com/documentation/swiftui/app) protocol, and populate it with scenes that contain the views that make up your app's user interface. Create your own custom views that conform to the [`View`](https://developer.apple.com/documentation/swiftui/view) protocol, and compose them with SwiftUI views for displaying text, images, and custom shapes using stacks, lists, and more. Apply powerful modifiers to built-in views and your own views to customize their rendering and interactivity. Share code between apps on multiple platforms with views and controls that adapt to their context and presentation.

You can integrate SwiftUI views with objects from the [UIKit](https://developer.apple.com/documentation/UIKit), [AppKit](https://developer.apple.com/documentation/AppKit), and [WatchKit](https://developer.apple.com/documentation/WatchKit) frameworks to take further advantage of platform-specific functionality. You can also customize accessibility support in SwiftUI, and localize your app's interface for different languages, countries, or cultural regions.

---

## App Protocol

[Skip Navigation](https://developer.apple.com/documentation/swiftui/app#app-main)

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- App

Protocol

# App

A type that represents the structure and behavior of an app.

iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+tvOS 14.0+visionOS 1.0+watchOS 7.0+

```
@MainActor @preconcurrency
protocol App
```

## [Overview](https://developer.apple.com/documentation/swiftui/app\#overview)

Create an app by declaring a structure that conforms to the `App` protocol. Implement the required [`body`](https://developer.apple.com/documentation/swiftui/app/body-swift.property) computed property to define the app's content:

```
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Hello, world!")
        }
    }
}

```

Precede the structure's declaration with the [@main](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626) attribute to indicate that your custom `App` protocol conformer provides the entry point into your app. The protocol provides a default implementation of the [`main()`](https://developer.apple.com/documentation/swiftui/app/main()) method that the system calls to launch your app. You can have exactly one entry point among all of your app's files.

Compose the app's body from instances that conform to the [`Scene`](https://developer.apple.com/documentation/swiftui/scene) protocol. Each scene contains the root view of a view hierarchy and has a life cycle managed by the system. SwiftUI provides some concrete scene types to handle common scenarios, like for displaying documents or settings. You can also create custom scenes.

```
@main
struct Mail: App {
    var body: some Scene {
        WindowGroup {
            MailViewer()
        }
        Settings {
            SettingsView()
        }
    }
}

```

You can declare state in your app to share across all of its scenes. For example, you can use the [`StateObject`](https://developer.apple.com/documentation/swiftui/stateobject) attribute to initialize a data model, and then provide that model on a view input as an [`ObservedObject`](https://developer.apple.com/documentation/swiftui/observedobject) or through the environment as an [`EnvironmentObject`](https://developer.apple.com/documentation/swiftui/environmentobject) to scenes in the app:

```
@main
struct Mail: App {
    @StateObject private var model = MailModel()

    var body: some Scene {
        WindowGroup {
            MailViewer()
                .environmentObject(model) // Passed through the environment.
        }
        Settings {
            SettingsView(model: model) // Passed as an observed object.
        }
    }
}

```

---

## View Protocol

[Skip Navigation](https://developer.apple.com/documentation/swiftui/view#app-main)

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- View

Protocol

# View

A type that represents part of your app's user interface and provides modifiers that you use to configure views.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+

```
@MainActor @preconcurrency
protocol View
```

## [Overview](https://developer.apple.com/documentation/swiftui/view\#overview)

You create custom views by declaring types that conform to the `View` protocol. Implement the required [`body`](https://developer.apple.com/documentation/swiftui/view/body-8kl5o) computed property to provide the content for your custom view.

```
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

```

Assemble the view's body by combining one or more of the built-in views provided by SwiftUI, like the [`Text`](https://developer.apple.com/documentation/swiftui/text) instance in the example above, plus other custom views that you define, into a hierarchy of views. For more information about creating custom views, see [Declaring a custom view](https://developer.apple.com/documentation/swiftui/declaring-a-custom-view).

The `View` protocol provides a set of modifiers — protocol methods with default implementations — that you use to configure views in the layout of your app. Modifiers work by wrapping the view instance on which you call them in another view with the specified characteristics, as described in [Configuring views](https://developer.apple.com/documentation/swiftui/configuring-views). For example, adding the [`opacity(_:)`](https://developer.apple.com/documentation/swiftui/view/opacity(_:)) modifier to a text view returns a new view with some amount of transparency:

```
Text("Hello, World!")
    .opacity(0.5) // Display partially transparent text.

```

The complete list of default modifiers provides a large set of controls for managing views. For example, you can fine tune [Layout modifiers](https://developer.apple.com/documentation/swiftui/view-layout), add [Accessibility modifiers](https://developer.apple.com/documentation/swiftui/view-accessibility) information, and respond to [Input and event modifiers](https://developer.apple.com/documentation/swiftui/view-input-and-events). You can also collect groups of default modifiers into new, custom view modifiers for easy reuse.

---

## View Fundamentals

[Skip Navigation](https://developer.apple.com/documentation/swiftui/view-fundamentals#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- View fundamentals

API Collection

# View fundamentals

Define the visual elements of your app using a hierarchy of views.

## [Overview](https://developer.apple.com/documentation/swiftui/view-fundamentals\#Overview)

Views are the building blocks that you use to declare your app's user interface. Each view contains a description of what to display for a given state. Every bit of your app that's visible to the user derives from the description in a view, and any type that conforms to the [`View`](https://developer.apple.com/documentation/swiftui/view) protocol can act as a view in your app.

Compose a custom view by combining built-in views that SwiftUI provides with other custom views that you create in your view's [`body`](https://developer.apple.com/documentation/swiftui/view/body-8kl5o) computed property. Configure views using the view modifiers that SwiftUI provides, or by defining your own view modifiers using the [`ViewModifier`](https://developer.apple.com/documentation/swiftui/viewmodifier) protocol and the [`modifier(_:)`](https://developer.apple.com/documentation/swiftui/view/modifier(_:)) method.

---

## Text Input and Output

[Skip Navigation](https://developer.apple.com/documentation/swiftui/text-input-and-output#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Text input and output

API Collection

# Text input and output

Display formatted text and get text input from the user.

## [Overview](https://developer.apple.com/documentation/swiftui/text-input-and-output\#Overview)

To display read-only text, or read-only text paired with an image, use the built-in [`Text`](https://developer.apple.com/documentation/swiftui/text) or [`Label`](https://developer.apple.com/documentation/swiftui/label) views, respectively. When you need to collect text input from the user, use an appropriate text input view, like [`TextField`](https://developer.apple.com/documentation/swiftui/textfield) or [`TextEditor`](https://developer.apple.com/documentation/swiftui/texteditor).

You add view modifiers to control the text's font, selectability, alignment, layout direction, and so on. These modifiers also affect other views that display text, like the labels on controls, even if you don't define an explicit [`Text`](https://developer.apple.com/documentation/swiftui/text) view.

### Key Components:

- **Text**: A view that displays one or more lines of read-only text
- **Label**: A standard label for user interface items, consisting of an icon with a title
- **TextField**: A control that displays an editable text interface
- **SecureField**: A control into which people securely enter private text
- **TextEditor**: A view that can display and edit long-form text

---

## Images

[Skip Navigation](https://developer.apple.com/documentation/swiftui/images#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Images

API Collection

# Images

Add images and symbols to your app's user interface.

## [Overview](https://developer.apple.com/documentation/swiftui/images\#Overview)

Display images, including [SF Symbols](https://developer.apple.com/design/Human-Interface-Guidelines/sf-symbols), images that you store in an asset catalog, and images that you store on disk, using an [`Image`](https://developer.apple.com/documentation/swiftui/image) view.

For images that take time to retrieve — for example, when you load an image from a network endpoint — load the image asynchronously using [`AsyncImage`](https://developer.apple.com/documentation/swiftui/asyncimage). You can instruct that view to display a placeholder during the load operation.

### Key Components:

- **Image**: A view that displays an image
- **AsyncImage**: A view that asynchronously loads and displays an image
- **Scale**: A scale to apply to vector images relative to text
- **ResizingMode**: The modes that SwiftUI uses to resize an image to fit within its containing view

---

## Controls and Indicators

[Skip Navigation](https://developer.apple.com/documentation/swiftui/controls-and-indicators#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Controls and indicators

API Collection

# Controls and indicators

Display values and get user selections.

## [Overview](https://developer.apple.com/documentation/swiftui/controls-and-indicators\#Overview)

SwiftUI provides controls that enable user interaction specific to each platform and context. For example, people can initiate events with buttons and links, or choose among a set of discrete values with different kinds of pickers. You can also display information to the user with indicators like progress views and gauges.

Use these built-in controls and indicators when composing custom views, and style them to match the needs of your app's user interface.

### Key Components:

- **Button**: A control that initiates an action
- **Toggle**: A control that toggles between on and off states
- **Slider**: A control for selecting a value from a bounded linear range of values
- **Stepper**: A control that performs increment and decrement actions
- **Picker**: A control for selecting from a set of mutually exclusive values
- **DatePicker**: A control for selecting an absolute date
- **ColorPicker**: A control used to select a color from the system color picker UI
- **ProgressView**: A view that shows the progress toward completion of a task
- **Gauge**: A view that shows a value within a range

---

## Layout Fundamentals

[Skip Navigation](https://developer.apple.com/documentation/swiftui/layout-fundamentals#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Layout fundamentals

API Collection

# Layout fundamentals

Arrange views inside built-in layout containers like stacks and grids.

## [Overview](https://developer.apple.com/documentation/swiftui/layout-fundamentals\#Overview)

Use layout containers to arrange the elements of your user interface. Stacks and grids update and adjust the positions of the subviews they contain in response to changes in content or interface dimensions. You can nest layout containers inside other layout containers to any depth to achieve complex layout effects.

### Key Components:

- **HStack**: A view that arranges its subviews in a horizontal line
- **VStack**: A view that arranges its subviews in a vertical line
- **ZStack**: A view that overlays its subviews, aligning them in both axes
- **LazyHStack**: A view that arranges its children in a line that grows horizontally, creating items only as needed
- **LazyVStack**: A view that arranges its children in a line that grows vertically, creating items only as needed
- **Grid**: A container view that arranges other views in a two dimensional layout
- **LazyHGrid**: A container view that arranges its child views in a grid that grows horizontally
- **LazyVGrid**: A container view that arranges its child views in a grid that grows vertically
- **Spacer**: A flexible space that expands along the major axis of its containing stack layout
- **Divider**: A visual element that can be used to separate other content

---

## Lists

[Skip Navigation](https://developer.apple.com/documentation/swiftui/lists#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Lists

API Collection

# Lists

Display a structured, scrollable column of information.

## [Overview](https://developer.apple.com/documentation/swiftui/lists\#Overview)

Use a list to display a one-dimensional vertical collection of views.

The list is a complex container type that automatically provides scrolling when it grows too large for the current display. You build a list by providing it with individual views for the rows in the list, or by using a [`ForEach`](https://developer.apple.com/documentation/swiftui/foreach) to enumerate a group of rows. You can also mix these strategies, blending any number of individual views and `ForEach` constructs.

Use view modifiers to configure the appearance and behavior of a list and its rows, headers, sections, and separators. For example, you can apply a style to the list, add swipe gestures to individual rows, or make the list refreshable with a pull-down gesture.

### Key Components:

- **List**: A container that presents rows of data arranged in a single column
- **ForEach**: A structure that computes views on demand from an underlying collection of identified data
- **Section**: A container view that you can use to add hierarchy within certain SwiftUI list and form views
- **EditMode**: A mode that indicates whether the user can edit a view's content
- **swipeActions**: Adds custom swipe actions to a row in a list

---

## Model Data

[Skip Navigation](https://developer.apple.com/documentation/swiftui/model-data#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Model data

API Collection

# Model data

Manage the data that your app uses to drive its interface.

## [Overview](https://developer.apple.com/documentation/swiftui/model-data\#Overview)

SwiftUI offers a declarative approach to user interface design. As you compose a hierarchy of views, you also indicate data dependencies for the views. When the data changes, either due to an external event or because of an action that the user performs, SwiftUI automatically updates the affected parts of the interface. As a result, the framework automatically performs most of the work that view controllers traditionally do.

The framework provides tools, like state variables and bindings, for connecting your app's data to the user interface. These tools help you maintain a single source of truth for every piece of data in your app, in part by reducing the amount of glue logic you write. Select the tool that best suits the task you need to perform:

- Manage transient UI state locally within a view by wrapping value types as [`State`](https://developer.apple.com/documentation/swiftui/state) properties.

- Share a reference to a source of truth, like local state, using the [`Binding`](https://developer.apple.com/documentation/swiftui/binding) property wrapper.

- Connect to and observe reference model data in views by applying the [`Observable()`](https://developer.apple.com/documentation/Observation/Observable()) macro to the model data type. Instantiate an observable model data type directly in a view using a [`State`](https://developer.apple.com/documentation/swiftui/state) property. Share the observable model data with other views in the hierarchy without passing a reference using the [`Environment`](https://developer.apple.com/documentation/swiftui/environment) property wrapper.

### Key Components:

- **State**: A property wrapper type that can read and write a value managed by SwiftUI
- **Binding**: A property wrapper type that can read and write a value owned by a source of truth
- **Observable**: A macro that defines and implements conformance of the Observable protocol
- **StateObject**: A property wrapper type that instantiates an observable object
- **ObservedObject**: A property wrapper type that subscribes to an observable object
- **EnvironmentObject**: A property wrapper type for an observable object that a parent or ancestor view supplies

---

## Environment Values

[Skip Navigation](https://developer.apple.com/documentation/swiftui/environment-values#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Environment values

API Collection

# Environment values

Share data throughout a view hierarchy using the environment.

## [Overview](https://developer.apple.com/documentation/swiftui/environment-values\#Overview)

Views in SwiftUI can react to configuration information that they read from the environment using an [`Environment`](https://developer.apple.com/documentation/swiftui/environment) property wrapper.

A view inherits its environment from its container view, subject to explicit changes from an [`environment(_:_:)`](https://developer.apple.com/documentation/swiftui/view/environment(_:_:)) view modifier, or by implicit changes from one of the many modifiers that operate on environment values. As a result, you can configure a entire hierarchy of views by modifying the environment of the group's container.

You can find many built-in environment values in the [`EnvironmentValues`](https://developer.apple.com/documentation/swiftui/environmentvalues) structure. You can also create a custom [`EnvironmentValues`](https://developer.apple.com/documentation/swiftui/environmentvalues) property by defining a new property in an extension to the environment values structure and applying the [`Entry()`](https://developer.apple.com/documentation/swiftui/entry()) macro to the variable declaration.

### Key Components:

- **Environment**: A property wrapper that reads a value from a view's environment
- **EnvironmentValues**: A collection of environment values propagated through a view hierarchy
- **EnvironmentKey**: A key for accessing values in the environment

---

## Animations

[Skip Navigation](https://developer.apple.com/documentation/swiftui/animations#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Animations

API Collection

# Animations

Create smooth visual updates in response to state changes.

## [Overview](https://developer.apple.com/documentation/swiftui/animations\#Overview)

You tell SwiftUI how to draw your app's user interface for different states, and then rely on SwiftUI to make interface updates when the state changes.

To avoid abrupt visual transitions when the state changes, add animation in one of the following ways:

- Animate all of the visual changes for a state change by changing the state inside a call to the [`withAnimation(_:_:)`](https://developer.apple.com/documentation/swiftui/withanimation(_:_:)) global function.

- Add animation to a particular view when a specific value changes by applying the [`animation(_:value:)`](https://developer.apple.com/documentation/swiftui/view/animation(_:value:)) view modifier to the view.

- Animate changes to a [`Binding`](https://developer.apple.com/documentation/swiftui/binding) by using the binding's [`animation(_:)`](https://developer.apple.com/documentation/swiftui/binding/animation(_:)) method.

SwiftUI animates the effects that many built-in view modifiers produce, like those that set a scale or opacity value. You can animate other values by making your custom views conform to the [`Animatable`](https://developer.apple.com/documentation/swiftui/animatable) protocol, and telling SwiftUI about the value you want to animate.

### Key Components:

- **Animation**: The way a view changes over time to create a smooth visual transition
- **withAnimation**: Returns the result of recomputing the view's body with the provided animation
- **AnyTransition**: A type-erased transition
- **transition**: Associates a transition with the view

---

## Gestures

[Skip Navigation](https://developer.apple.com/documentation/swiftui/gestures#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Gestures

API Collection

# Gestures

Define interactions from taps, clicks, and swipes to fine-grained gestures.

## [Overview](https://developer.apple.com/documentation/swiftui/gestures\#Overview)

Respond to gestures by adding gesture modifiers to your views. You can listen for taps, drags, pinches, and other standard gestures.

You can also compose custom gestures from individual gestures using the [`simultaneously(with:)`](https://developer.apple.com/documentation/swiftui/gesture/simultaneously(with:)), [`sequenced(before:)`](https://developer.apple.com/documentation/swiftui/gesture/sequenced(before:)), or [`exclusively(before:)`](https://developer.apple.com/documentation/swiftui/gesture/exclusively(before:)) modifiers, or combine gestures with keyboard modifiers using the [`modifiers(_:)`](https://developer.apple.com/documentation/swiftui/gesture/modifiers(_:)) modifier.

### Key Components:

- **TapGesture**: A gesture that recognizes one or more taps
- **LongPressGesture**: A gesture that succeeds when the user performs a long press
- **DragGesture**: A dragging motion that invokes an action as the drag-event sequence changes
- **MagnifyGesture**: A gesture that recognizes a magnification motion
- **RotateGesture**: A gesture that recognizes a rotation motion
- **onTapGesture**: Adds an action to perform when this view recognizes a tap gesture

---

## Navigation

[Skip Navigation](https://developer.apple.com/documentation/swiftui/navigation#app-main)

Collection

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- Navigation

API Collection

# Navigation

Enable people to move between different parts of your app's view hierarchy within a scene.

## [Overview](https://developer.apple.com/documentation/swiftui/navigation\#Overview)

Use navigation containers to provide structure to your app's user interface, enabling people to easily move among the parts of your app.

For example, people can move forward and backward through a stack of views using a [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack), or choose which view to display from a tab bar using a [`TabView`](https://developer.apple.com/documentation/swiftui/tabview).

Configure navigation containers by adding view modifiers like [`navigationSplitViewStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationsplitviewstyle(_:)) to the container. Use other modifiers on the views inside the container to affect the container's behavior when showing that view. For example, you can use [`navigationTitle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)) on a view to provide a toolbar title to display when showing that view.

### Key Components:

- **NavigationStack**: A view that displays a root view and enables you to present additional views over the root view
- **NavigationSplitView**: A view that presents views in two or three columns
- **NavigationLink**: A view that controls a navigation presentation
- **TabView**: A view that switches between multiple child views using interactive user interface elements
- **navigationTitle**: Configures the view's title for purposes of navigation
- **navigationDestination**: Associates a destination view with a presented data type

---

## Modal Presentations

Modal presentations allow you to present content in a separate view that offers focused interaction. SwiftUI provides several ways to present modal content:

### Key Components:

- **sheet**: Presents a modal view that covers as much of the screen as possible
- **fullScreenCover**: Presents a modal view that covers the entire screen
- **popover**: Presents a popover anchored to a view
- **alert**: Presents an alert dialog
- **confirmationDialog**: Presents a confirmation dialog with multiple options

Example usage:
```swift
.sheet(isPresented: $showingSheet) {
    SheetView()
}

.fullScreenCover(isPresented: $showingFullScreen) {
    FullScreenView()
}

.alert("Important Message", isPresented: $showingAlert) {
    Button("OK") { }
} message: {
    Text("This is an alert message")
}
```

---

This comprehensive documentation provides the essential information needed to build SwiftUI applications for the Scriblo app, covering all the fundamental concepts and components.