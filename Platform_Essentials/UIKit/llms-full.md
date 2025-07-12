# UIKit Framework - Full Documentation

## UIKit Framework
https://developer.apple.com/documentation/uikit

UIKit provides a variety of features for building apps, including components you can use to construct the core infrastructure of your iOS, iPadOS, or tvOS apps. The framework provides the window and view architecture for implementing your UI, the event-handling infrastructure for delivering Multi-Touch and other types of input to your app, and the main run loop for managing interactions between the user, the system, and your app.

UIKit also includes support for animations, documents, drawing and printing, text management and display, search, app extensions, resource management, and getting information about the current device. You can also customize accessibility support, and localize your app's interface for different languages, countries, or cultural regions.

UIKit works seamlessly with the SwiftUI framework, so you can implement parts of your UIKit app in SwiftUI or mix interface elements between the two frameworks. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.

### Key Components

#### App Structure
- App and environment: Manage life-cycle events and your app's UI scenes, and get information about traits and the environment in which your app runs.
- Documents, data, and pasteboard: Organize your app's data and share that data on the pasteboard.
- Resource management: Manage the images, strings, storyboards, and nib files that you use to implement your app's interface.
- App extensions: Extend your app's basic functionality to other parts of the system.
- Interprocess communication: Display activity-based services to people.
- Mac Catalyst: Create a version of your iPad app that users can run on a Mac device.

#### User Interface
- Views and controls: Present your content onscreen and define the interactions allowed with that content.
- View controllers: Manage your interface using view controllers and facilitate navigation around your app's content.
- View layout: Use stack views to lay out the views of your interface automatically. Use Auto Layout when you require precise placement of your views.
- Appearance customization: Apply Liquid Glass to views, support Dark Mode in your app, customize the appearance of bars, and use appearance proxies to modify your UI.
- Animation and haptics: Provide feedback to users using view-based animations and haptics.
- Windows and screens: Provide a container for your view hierarchies and other content.

#### User Interactions
- Touches, presses, and gestures: Encapsulate your app's event-handling logic in gesture recognizers so that you can reuse that code throughout your app.
- Menus and shortcuts: Simplify interactions with your app using menu systems, contextual menus, Home Screen quick actions, and keyboard shortcuts.
- Drag and drop: Bring drag and drop to your app by using interaction APIs with your views.
- Pointer interactions: Support pointer interactions in your custom controls and views.
- Apple Pencil interactions: Handle user interactions like double tap and squeeze on Apple Pencil.
- Focus-based navigation: Navigate the interface of your UIKit app using a remote, game controller, or keyboard.
- Accessibility for UIKit: Make your UIKit apps accessible to everyone who uses iOS and tvOS.

---

## UIViewController
https://developer.apple.com/documentation/uikit/uiviewcontroller

An object that manages a view hierarchy for your UIKit app.

```swift
@MainActor
class UIViewController
```

### Overview

The UIViewController class defines the shared behavior that's common to all view controllers. You rarely create instances of the UIViewController class directly. Instead, you subclass UIViewController and add the methods and properties needed to manage the view controller's view hierarchy.

A view controller's main responsibilities include the following:
- Updating the contents of the views, usually in response to changes to the underlying data
- Responding to user interactions with views
- Resizing views and managing the layout of the overall interface
- Coordinating with other objects — including other view controllers — in your app

A view controller is tightly bound to the views it manages and takes part in handling events in its view hierarchy. Specifically, view controllers are UIResponder objects and are inserted into the responder chain between the view controller's root view and that view's superview, which typically belongs to a different view controller. If none of the view controller's views handle an event, the view controller has the option of handling the event or passing it along to the superview.

View controllers are rarely used in isolation. Instead, you often use multiple view controllers, each of which owns a portion of your app's user interface. For example, one view controller might display a table of items while a different view controller displays the selected item from that table. Usually, only the views from one view controller are visible at a time. A view controller may present a different view controller to display a new set of views, or it may act as a container for other view controllers' content and animate views however it wants.

### Managing Views

Each view controller manages a view hierarchy, the root view of which is stored in the view property of this class. The root view acts primarily as a container for the rest of the view hierarchy. The size and position of the root view is determined by the object that owns it, which is either a parent view controller or the app's window. The view controller that's owned by the window is the app's root view controller and its view is sized to fill the window.

View controllers load their views lazily. Accessing the view property for the first time loads or creates the view controller's views. There are several ways to specify the views for a view controller:

- Specify the view controller and its views in your app's storyboard
- Specify the views for a view controller using a nib file
- Specify the views for a view controller using the loadView() method

### Handle View-Related Notifications

When the visibility of its views changes, a view controller automatically calls its own methods so that subclasses can respond to the change. Use a method like viewIsAppearing(_:) to prepare your views to appear onscreen, and use viewWillDisappear(_:) to save changes or other state information. Use other methods to make appropriate changes.

The view controller provides several key lifecycle methods:
- viewDidLoad(): Called after the controller's view is loaded into memory
- viewWillAppear(_:): Notifies the view controller that its view is about to be added to a view hierarchy
- viewIsAppearing(_:): Notifies the view controller that the system is adding the view controller's view to a view hierarchy
- viewDidAppear(_:): Notifies the view controller that its view was added to a view hierarchy
- viewWillDisappear(_:): Notifies the view controller that its view is about to be removed from a view hierarchy
- viewDidDisappear(_:): Notifies the view controller that its view was removed from a view hierarchy

### Handle View Rotations

As of iOS 8, all rotation-related methods are deprecated. Instead, rotations are treated as a change in the size of the view controller's view and are therefore reported using the viewWillTransition(to:with:) method. When the interface orientation changes, UIKit calls this method on the window's root view controller. That view controller then notifies its child view controllers, propagating the message throughout the view controller hierarchy.

In iOS 6 and iOS 7, your app supports the interface orientations defined in your app's Info.plist file. A view controller can override the supportedInterfaceOrientations method to limit the list of supported orientations.

### Implement a Container View Controller

A custom UIViewController subclass can also act as a container view controller. A container view controller manages the presentation of content of other view controllers it owns, also known as its child view controllers. A child's view can be presented as-is or in conjunction with views owned by the container view controller.

Your container view controller subclass should declare a public interface to associate its children. The nature of these methods is up to you and depends on the semantics of the container you're creating. You need to decide how many children can be displayed by your view controller at once, when those children are displayed, and where they appear in your view controller's view hierarchy.

Essential methods for container view controllers:
- addChild(_:): Adds the specified view controller as a child
- removeFromParent(): Removes the view controller from its parent
- willMove(toParent:): Called just before the view controller is added or removed from a container
- didMove(toParent:): Called after the view controller is added or removed from a container

### State Preservation and Restoration

If you assign a value to the view controller's restorationIdentifier property, the system may ask the view controller to encode itself when the app transitions to the background. When preserved, a view controller preserves the state of any views in its view hierarchy that also have restoration identifiers. View controllers don't automatically save any other state. If you're implementing a custom container view controller, you must encode any child view controllers yourself. Each child you encode must have a unique restoration identifier.

For more information about how the system determines which view controllers to preserve and restore, see App Programming Guide for iOS.

---

## UIView
https://developer.apple.com/documentation/uikit/uiview

An object that manages the content for a rectangular area on the screen.

```swift
@MainActor
class UIView
```

### Overview

Views are the fundamental building blocks of your app's user interface, and the UIView class defines the behaviors that are common to all views. A view object renders content within its bounds rectangle, and handles any interactions with that content. The UIView class is a concrete class that you can instantiate and use to display a fixed background color. You can also subclass it to draw more sophisticated content. To display labels, images, buttons, and other interface elements commonly found in apps, use the view subclasses that the UIKit framework provides rather than trying to define your own.

Because view objects are the main way your application interacts with the user, they have a number of responsibilities:

- Drawing and animation
  - Views draw content in their rectangular area using UIKit or Core Graphics
  - You can animate some view properties to new values

- Layout and subview management
  - Views may contain zero or more subviews
  - Views can adjust the size and position of their subviews
  - Use Auto Layout to define the rules for resizing and repositioning your views in response to changes in the view hierarchy

- Event handling
  - A view is a subclass of UIResponder and can respond to touches and other types of events
  - Views can install gesture recognizers to handle common gestures

Views can nest inside other views to create view hierarchies, which offer a convenient way to organize related content. Nesting a view creates a parent-child relationship between the nested child view (known as the subview) and the parent (known as the superview). A parent view may contain any number of subviews, but each subview has only one superview. By default, when a subview's visible area extends outside of the bounds of its superview, no clipping of the subview's content occurs. Use the clipsToBounds property to change that behavior.

The frame and bounds properties define the geometry of each view. The frame property defines the origin and dimensions of the view in the coordinate system of its superview. The bounds property defines the internal dimensions of the view as it sees them, and its use is almost exclusive to custom drawing code. The center property provides a convenient way to reposition a view without changing its frame or bounds properties directly.

### Create a View

Normally, you create views in your storyboards by dragging them from the library to your canvas. You can also create views programmatically. When creating a view, you typically specify its initial size and position relative to its future superview. For example:

```swift
let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
let myView = UIView(frame: rect)
```

To add a subview to another view, call the addSubview(_:) method on the superview. You may add any number of subviews to a view, and sibling views may overlap each other without any issues in iOS. Each call to the addSubview(_:) method places the new view on top of all other siblings. You can specify the relative z-order of subview by adding it using the insertSubview(_:aboveSubview:) and insertSubview(_:belowSubview:) methods. You can also exchange the position of already added subviews using the exchangeSubview(at:withSubviewAt:) method.

After creating a view, create Auto Layout rules to govern how the size and position of the view change in response to changes in the rest of the view hierarchy.

### Draw Views

View drawing occurs on an as-needed basis. When a view is first shown, or when all or part of it becomes visible due to layout changes, the system asks the view to draw its contents. For views that contain custom content using UIKit or Core Graphics, the system calls the view's draw(_:) method. Your implementation of this method is responsible for drawing the view's content into the current graphics context, which is set up by the system automatically prior to calling this method. This creates a static visual representation of your view's content that can then be displayed on the screen.

When the actual content of your view changes, it's your responsibility to notify the system that your view needs to be redrawn. You do this by calling your view's setNeedsDisplay() or setNeedsDisplay(_:) method of the view. These methods let the system know that it should update the view during the next drawing cycle. Because it waits until the next drawing cycle to update the view, you can call these methods on multiple views to update them at the same time.

### Animate Views

Changes to several view properties can be animated — that is, changing the property creates an animation starting at the current value and ending at the new value that you specify. The following properties of the UIView class are animatable:

- frame
- bounds
- center
- transform
- alpha
- backgroundColor

To animate your changes, create a UIViewPropertyAnimator object and use its handler block to change the values of your view's properties. The UIViewPropertyAnimator class lets you specify the duration and timing of your animations, but it performs the actual animations. You can pause a property-based animator that's currently running to interrupt the animation and drive it interactively.

### Threading Considerations

Manipulations to your app's user interface must occur on the main thread. Thus, you should always call the methods of the UIView class from code running in the main thread of your app. The only time this may not be strictly necessary is when creating the view object itself, but all other manipulations should occur on the main thread.

---

## UITableView
https://developer.apple.com/documentation/uikit/uitableview

A view that presents data using rows in a single column.

```swift
@MainActor
class UITableView
```

### Overview

Table views in iOS display rows of vertically scrolling content in a single column. Each row in the table contains one piece of your app's content. For example, the Contacts app displays the name of each contact in a separate row, and the main page of the Settings app displays the available groups of settings. You can configure a table to display a single long list of rows, or you can group related rows into sections to make navigating the content easier.

Tables are common in apps with data that's highly structured or organized hierarchically. Apps that contain hierarchical data often use tables in conjunction with a navigation view controller, which facilitates navigation between different levels of the hierarchy. For example, the Settings app uses tables and a navigation controller to organize the system settings.

UITableView manages the basic appearance of the table, but your app provides the cells (UITableViewCell objects) that display the actual content. The standard cell configurations display a simple combination of text and images, but you can define custom cells that display any content you want. You can also supply header and footer views to provide additional information for groups of cells.

### Add a Table View to Your Interface

To add a table view to your interface, drag a table view controller (UITableViewController) object to your storyboard. Xcode creates a new scene that includes both the view controller and a table view, ready for you to configure and use.

Table views are data-driven, normally getting their data from a data source object that you provide. The data source object manages your app's data and is responsible for creating and configuring the table's cells. If the content of your table never changes, you can configure that content in your storyboard file instead.

### Key Properties and Methods

#### Data Source and Delegate
- dataSource: The object that provides the data for the table view
- delegate: The object that acts as the delegate of the table view

#### Configuring the Table's Appearance
- style: The style of the table view (plain or grouped)
- rowHeight: The default height in points of each row in the table view
- sectionHeaderHeight: The height of section headers in the table view
- sectionFooterHeight: The height of section footers in the table view
- separatorStyle: The style for table cells to use as separators
- separatorColor: The color of separator rows in the table view

#### Managing Selections
- indexPathForSelectedRow: An index path that identifies the row and section of the selected row
- indexPathsForSelectedRows: The index paths that represent the selected rows
- selectRow(at:animated:scrollPosition:): Selects a row in the table view
- deselectRow(at:animated:): Deselects a row that an index path identifies
- allowsSelection: A Boolean value that determines whether users can select a row
- allowsMultipleSelection: A Boolean value that determines whether users can select more than one row

#### Inserting, Deleting, and Moving Rows
- insertRows(at:with:): Inserts rows in the table view at the locations that an array of index paths identifies
- deleteRows(at:with:): Deletes the rows that an array of index paths identifies
- moveRow(at:to:): Moves the row at a specified location to a destination location

#### Reloading Content
- reloadData(): Reloads the rows and sections of the table view
- reloadRows(at:with:): Reloads the specified rows using the provided animation effect
- reloadSections(_:with:): Reloads the specified sections using the provided animation effect

### Save and Restore the Table's Current State

Table views support UIKit app restoration. To save and restore the table's data, assign a nonempty value to the table view's restorationIdentifier property. When you save its parent view controller, the table view automatically saves the index paths for the currently selected and visible rows. If the table's data source object adopts the UIDataSourceModelAssociation protocol, the table stores the unique IDs that you provide for those items instead of their index paths.

---

## UICollectionView
https://developer.apple.com/documentation/uikit/uicollectionview

An object that manages an ordered collection of data items and presents them using customizable layouts.

```swift
@MainActor
class UICollectionView
```

### Overview

When you add a collection view to your user interface, your app's main job is to manage the data associated with that collection view. The collection view gets its data from the data source object, stored in the collection view's dataSource property. For your data source, you can use a UICollectionViewDiffableDataSource object, which provides the behavior you need to simply and efficiently manage updates to your collection view's data and user interface. Alternatively, you can create a custom data source object by adopting the UICollectionViewDataSource protocol.

Data in the collection view is organized into individual items, which you can group into sections for presentation. An item is the smallest unit of data you want to present. For example, in a photos app, an item might be a single image. The collection view presents items onscreen using a cell, which is an instance of the UICollectionViewCell class that your data source configures and provides.

In addition to its cells, a collection view can present data using other types of views. These supplementary views can be, for example, section headers and footers that are separate from the individual cells but still convey information. Support for supplementary views is optional and defined by the collection view's layout object, which is also responsible for defining the placement of those views.

Besides embedding a UICollectionView in your user interface, you use the methods of the collection view to ensure that the visual presentation of items matches the order in your data source object. A UICollectionViewDiffableDataSource object manages this process automatically. If you're using a custom data source, then whenever you add, delete, or rearrange data in your collection, you use the methods of UICollectionView to insert, delete, and rearrange the corresponding cells.

You also use the collection view object to manage the selected items, although for this behavior the collection view works with its associated delegate object.

### Layouts

A layout object defines the visual arrangement of the content in the collection view. A subclass of the UICollectionViewLayout class, the layout object defines the organization and location of all cells and supplementary views inside the collection view. Although it defines their locations, the layout object doesn't actually apply that information to the corresponding views. The collection view applies layout information to the corresponding views because the creation of cells and supplementary views involves coordination between the collection view and your data source object. The layout object is like another data source, except it provides visual information instead of item data.

You typically specify a layout object when you create a collection view, but you can also change the layout of a collection view dynamically. The layout object is stored in the collectionViewLayout property. Setting this property directly updates the layout immediately, without animating the changes. If you want to animate the changes, call the setCollectionViewLayout(_:animated:completion:) method instead.

To create an interactive transition — one that is driven by a gesture recognizer or touch events — use the startInteractiveTransition(to:completion:) method to change the layout object. That method installs an intermediate layout object, which works with your gesture recognizer or event-handling code to track the transition progress. When your event-handling code determines that the transition is finished, it calls the finishInteractiveTransition() or cancelInteractiveTransition() method to remove the intermediate layout object and install the intended target layout object.

### Cells and Supplementary Views

The collection view's data source object provides both the content for items and the views used to present that content. When the collection view first loads its content, it asks its data source to provide a view for each visible item. The collection view maintains a queue or list of view objects that the data source has marked for reuse. Instead of creating new views explicitly in your code, you always dequeue views.

There are two methods for dequeueing views. The one you use depends on which type of view has been requested:

- Use the dequeueReusableCell(withReuseIdentifier:for:) to get a cell for an item in the collection view
- Use the dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:) method to get a supplementary view requested by the layout object

Before you call either of these methods, you must tell the collection view how to create the corresponding view if one doesn't already exist. For this, you must register either a class or a nib file with the collection view. For example, when registering cells, you use the register(_:forCellWithReuseIdentifier:) method to register a class or the register(_:forCellWithReuseIdentifier:) method to register a nib file. As part of the registration process, you specify the reuse identifier that identifies the purpose of the view. This is the same string you use when dequeueing the view later.

After dequeueing the appropriate view in your data source method, configure its content and return it to the collection view for use. After getting the layout information from the layout object, the collection view applies it to the view and displays it.

### Data Prefetching

Collection views provide two prefetching techniques you can use to improve responsiveness:

- Cell prefetching prepares cells in advance of the time they're required. When a collection view requires a large number of cells simultaneously — for example, a new row of cells in grid layout — the cells are requested earlier than the time required for display. Cell rendering is therefore spread across multiple layout passes, resulting in a smoother scrolling experience. Cell prefetching is enabled by default.

- Data prefetching provides a mechanism whereby you're notified of the data requirements of a collection view in advance of the requests for cells. This is useful if the content of your cells relies on an expensive data loading process, such as a network request. Assign an object that conforms to the UICollectionViewDataSourcePrefetching protocol to the prefetchDataSource property to receive notifications of when to prefetch data for cells.

### Reorder Items Interactively

Collection views allow you to move items around based on user interactions. Typically, the order of items in a collection view is defined by your data source. If you allow users to reorder items, you can configure a gesture recognizer to track the user's interactions with a collection view item and update that item's position.

To begin the interactive repositioning of an item, call the beginInteractiveMovementForItem(at:) method of the collection view. While your gesture recognizer is tracking touch events, call the updateInteractiveMovementTargetPosition(_:) method to report changes in the touch location. When you're done tracking the gesture, call the endInteractiveMovement() or cancelInteractiveMovement() method to conclude the interactions and update the collection view.

During user interactions, the collection view invalidates its layout dynamically to reflect the current position of the item. If you do nothing, the default layout behavior repositions the items for you, but you can customize the layout animations if you want. When interactions finish, the collection view updates its data source object with the new location of the item.

The UICollectionViewController class provides a default gesture recognizer that you can use to rearrange items in its managed collection view. To install this gesture recognizer, set the installsStandardGestureForInteractiveMovement property of the collection view controller to true.

---

## Auto Layout and View Layout
https://developer.apple.com/documentation/uikit/view-layout

Use stack views to lay out the views of your interface automatically. Use Auto Layout when you require precise placement of your views.

### Overview

When you design your app's interface, you position views and other interface elements in your app's windows and size them appropriately. However, the size and position of those views may need to change at runtime for a variety of reasons:

- The user can resize the window containing your views
- Variations in the screen sizes of iOS devices (including differences between portrait and landscape orientations) require different layouts for each device and orientation
- Apps on iPad must adapt to cover different amounts of screen space, ranging from a third of the screen to the entire screen
- Language changes might require size changes for labels and other text-based views
- Dynamic Type allows changes to the size of the text, which affects the size of the view

UIStackView objects adjust the position of their contained views automatically when interface dimensions change. Alternatively, Auto Layout constraints let you specify the rules that determine the size and position of the views in your interface.

### UIStackView

A streamlined interface for laying out a collection of views in either a column or a row.

Stack views let you leverage the power of Auto Layout, creating user interfaces that can dynamically adapt to the device's orientation, screen size, and any changes in the available space. The stack view manages the layout of all the views in its arrangedSubviews property. These views are arranged along the stack view's axis, based on their order in the arrangedSubviews array. The exact layout varies depending on the stack view's axis, distribution, alignment, spacing, and other properties.

### NSLayoutConstraint

The relationship between two user interface objects that must be satisfied by the constraint-based layout system.

Each constraint is a linear equation with the following format:
item1.attribute1 = multiplier × item2.attribute2 + constant

This equation defines a relationship between the attributes of two user interface objects that must be satisfied by the constraint-based layout system. Each constraint is limited to working with only two attributes, and both attributes must be of the same type.

### Layout Guides

#### UILayoutGuide
A rectangular area that can interact with Auto Layout.

Use layout guides to replace the dummy views you may have created to represent inter-view spaces or encapsulation in your user interface. Traditionally, there were a number of Auto Layout techniques that required dummy views. A dummy view is an empty view that does not have any visual elements of its own and serves only to define a rectangular region in the view hierarchy. For example, if you wanted to use constraints to define the distance between two views, you needed to use a dummy view to represent the space between the views.

#### NSLayoutDimension
A factory class for creating size-based layout constraint objects using a fluent API.

Use instances of NSLayoutDimension to create constraints that explicitly set or relate the height and width anchor attributes of a layout item. You should never instantiate an NSLayoutDimension object in your code. Instead, use the heightAnchor and widthAnchor properties of an existing view or layout guide to obtain one of these objects.

### Layout Anchors

#### NSLayoutAnchor
A factory class for creating layout constraint objects using a fluent API.

Use these constraints to programmatically define your layout using Auto Layout. Instead of creating NSLayoutConstraint objects directly, start with a UIView or UILayoutGuide object you wish to constrain, and select one of that object's anchor properties. These properties correspond to the main NSLayoutConstraint.Attribute values used in Auto Layout, and provide an appropriate NSLayoutAnchor subclass for creating constraints to that attribute. Use the anchor's methods to construct your constraint.

#### NSLayoutXAxisAnchor
A factory class for creating horizontal layout constraint objects using a fluent API.

#### NSLayoutYAxisAnchor
A factory class for creating vertical layout constraint objects using a fluent API.

---

## UINavigationController
https://developer.apple.com/documentation/uikit/uinavigationcontroller

A container view controller that defines a stack-based scheme for navigating hierarchical content.

```swift
@MainActor
class UINavigationController
```

### Overview

A navigation controller is a container view controller that manages one or more child view controllers in a navigation interface. In this type of interface, only one child view controller is visible at a time. Selecting an item in the view controller pushes a new view controller onscreen using an animation, hiding the previous view controller. Tapping the back button in the navigation bar at the top of the interface removes the top view controller, thereby revealing the view controller underneath.

Use a navigation interface to mimic the organization of hierarchical data managed by your app. At each level of the hierarchy, you provide an appropriate screen (managed by a custom view controller) to display the content at that level. The navigation interface presented by the Settings application in iOS is an example of this pattern. The first screen presents the user with the list of applications that contain preferences. Selecting an application reveals individual settings and groups of settings for that application. Selecting a group yields more settings and so on.

A navigation controller object manages its child view controllers using an ordered array, known as the navigation stack. The first view controller in the array is the root view controller and represents the bottom of the stack. The last view controller in the array is the topmost item on the stack, and represents the view controller currently being displayed. You add and remove view controllers from the stack using segues or using the methods of this class. The user can also remove the topmost view controller using the back button in the navigation bar or using a left-edge swipe gesture.

The navigation controller manages the navigation bar at the top of the interface and an optional toolbar at the bottom of the interface. The navigation bar is always present and is managed by the navigation controller itself, which updates the navigation bar using the content provided by its child view controllers. When the isToolbarHidden property is false, the navigation controller similarly updates the toolbar with contents provided by the topmost view controller.

A navigation controller coordinates its behavior with its delegate object. The delegate object can override the pushing or popping of view controllers, provide custom animation transitions, and specify the preferred orientation for the navigation interface. The delegate object you provide must conform to the UINavigationControllerDelegate protocol.

### Navigation Controller Views

A navigation controller is a container view controller — that is, it embeds the content of other view controllers inside of itself. You access a navigation controller's view from its view property. This view incorporates the navigation bar, an optional toolbar, and the content view corresponding to the topmost view controller. The navigation controller manages the creation, configuration, and display of the navigation bar and optional navigation toolbar. It's permissible to customize the navigation bar's appearance-related properties but you must never change its frame, bounds, or alpha values directly. If you subclass UINavigationBar, you must initialize your navigation controller using the init(navigationBarClass:toolbarClass:) method. To hide or show the navigation bar, use the isNavigationBarHidden property or setNavigationBarHidden(_:animated:) method.

A navigation controller builds the contents of the navigation bar dynamically using the navigation item objects (instances of the UINavigationItem class) associated with the view controllers on the navigation stack. To customize the overall appearance of a navigation bar, use UIAppearance APIs. To change the contents of the navigation bar, you must therefore configure the navigation items of your custom view controllers.

### Updating the Navigation Bar

Each time the top-level view controller changes, the navigation controller updates the navigation bar accordingly. Specifically, the navigation controller updates the bar button items displayed in each of the three navigation bar positions: left, middle, and right. Bar button items are instances of the UIBarButtonItem class. You can create items with custom content or create standard system items depending on your needs.

Tinting of the navigation bar is controlled by properties of the navigation bar itself. Use the tintColor property to change the tint color of items in the bar and use the barTintColor property to change the tint color of the bar itself. Navigation bars don't inherit their tint color from the currently displayed view controller.

#### The Left Item
For all but the root view controller on the navigation stack, the item on the left side of the navigation bar provides navigation back to the previous view controller. The contents of this left-most button are determined as follows:

- If the new top-level view controller has a custom left bar button item, that item is displayed
- If the top-level view controller doesn't have a custom left bar button item, but the navigation item of the previous view controller has an object in its backBarButtonItem property, the navigation bar displays that item
- If a custom bar button item isn't specified by either of the view controllers, a default back button is used and its title is set to the value of the title property of the previous view controller

#### The Middle Item
The navigation controller updates the middle of the navigation bar as follows:

- If the new top-level view controller has a custom title view, the navigation bar displays that view in place of the default title view
- If no custom title view is set, the navigation bar displays a label containing the view controller's default title

#### The Right Item
The navigation controller updates the right side of the navigation bar as follows:

- If the new top-level view controller has a custom right bar button item, that item is displayed
- If no custom right bar button item is specified, the navigation bar displays nothing on the right side of the bar

### Displaying a Toolbar

A navigation controller object manages an optional toolbar in its view hierarchy. When displayed, this toolbar obtains its current set of items from the toolbarItems property of the active view controller. When the active view controller changes, the navigation controller updates the toolbar items to match the new view controller, animating the new items into position when appropriate.

The navigation toolbar is hidden by default but you can show it for your navigation interface by calling the setToolbarHidden(_:animated:) method of your navigation controller object. If not all of your view controllers support toolbar items, your delegate object can call this method to toggle the visibility of the toolbar during subsequent push and pop operations. To use a custom UIToolbar subclass, initialize the navigation controller using the init(navigationBarClass:toolbarClass:) method.

### Adapting to Different Environments

The navigation interface remains the same in both horizontally compact and horizontally regular environments. When toggling between the two environments, only the size of the navigation controller's view changes. The navigation controller doesn't change its view hierarchy or the layout of its views.

When configuring segues between view controllers on a navigation stack, the standard Show and Show Detail segues behave as follows:

- Show segue: The navigation controller pushes the specified view controller onto its navigation stack
- Show Detail segue: The navigation controller presents the specified view controller modally

### Interface Behaviors

A navigation controller supports the following behaviors for its interface:

#### Supported Interface Orientations
A navigation controller object doesn't consult the view controllers on its navigation stack when determining the supported interface orientations. On iPhone, a navigation controller supports all orientations except portrait upside-down. On iPad, a navigation controller supports all orientations. If the navigation controller has a delegate object, the delegate can specify a different set of supported orientations using the navigationControllerSupportedInterfaceOrientations(_:) method.

#### Presentation Context
A navigation controller defines the presentation context for modally presented view controllers. When the modal transition style is UIModalPresentationStyle.currentContext or UIModalPresentationStyle.overCurrentContext, modal presentations from the view controllers in the navigation stack cover the entire navigation interface.

### State Preservation

When you assign a value to a navigation controller's restorationIdentifier property, it attempts to preserve itself and the child view controllers on its navigation stack. The navigation controller starts at the bottom of the stack and moves upward, encoding each view controller that also has a valid restoration identifier string. During the next launch cycle, the navigation controller restores the preserved view controllers to the navigation stack in the same order that they were preserved.

The child view controllers you push onto the navigation stack may use the same restoration identifiers. The navigation controller automatically stores additional information to ensure that each child's restoration path is unique.

---

## UITabBarController
https://developer.apple.com/documentation/uikit/uitabbarcontroller

A container view controller that manages a multiselection interface, where the selection determines which child view controller to display.

```swift
@MainActor
class UITabBarController
```

### Overview

The tab bar interface displays tabs at the bottom of the window for selecting between the different modes and for displaying the views for that mode. This class is generally used as-is, but may also be subclassed.

Each tab of a tab bar controller interface is associated with a custom view controller. When the user selects a specific tab, the tab bar controller displays the root view of the corresponding view controller, replacing any previous views. (User taps always display the root view of the tab, regardless of which tab was previously selected. This is true even if the tab was already selected.) Because selecting a tab replaces the contents of the interface, the type of interface managed in each tab need not be similar in any way. In fact, tab bar interfaces are commonly used either to present different types of information or to present the same information using a completely different style of interface.

You should never access the tab bar view of a tab bar controller directly. To configure the tabs of a tab bar controller, you assign the view controllers that provide the root view for each tab to the viewControllers property. The order in which you specify the view controllers determines the order in which they appear in the tab bar. When setting this property, you should also assign a value to the selectedViewController property to indicate which view controller is selected initially. (You can also select view controllers by array index using the selectedIndex property.) When you embed the tab bar controller's view (obtained using the inherited view property) in your app window, the tab bar controller automatically selects that view controller and displays its contents, resizing them as needed to fit the tab bar interface.

Tab bar items are configured through their corresponding view controller. To associate a tab bar item with a view controller, create a new instance of the UITabBarItem class, configure it appropriately for the view controller, and assign it to the view controller's tabBarItem property. If you don't provide a custom tab bar item for your view controller, the view controller creates a default item containing no image and the text from the view controller's title property.

As the user interacts with a tab bar interface, the tab bar controller object sends notifications about the interactions to its delegate. The delegate can be any object you specify but must conform to the UITabBarControllerDelegate protocol. You can use the delegate to prevent specific tab bar items from being selected and to perform additional tasks when tabs are selected. You can also use the delegate to monitor changes to the tab bar that are made by the More navigation controller.

### The Views of a Tab Bar Controller

Because the UITabBarController class inherits from the UIViewController class, tab bar controllers have their own view that's accessible through the view property. The view for a tab bar controller is just a container for a tab bar view and the view containing your custom content. The tab bar view provides the selection controls for the user and consists of one or more tab bar items.

You can use navigation controllers or custom view controllers as the root view controller for a tab. If the root view controller is a navigation controller, the tab bar controller makes further adjustments to the size of the displayed navigation content so that it doesn't overlap the tab bar. Any views you display in a tab bar interface should therefore have their autoresizingMask property set to resize the view appropriately under any conditions.

### The More Navigation Controller

The tab bar has limited space for displaying your custom items. If you add six or more custom view controllers to a tab bar controller, the tab bar controller displays only the first four items plus the standard More item on the tab bar. Tapping the More item brings up a standard interface for selecting the remaining items.

The interface for the standard More item includes an Edit button that allows the user to reconfigure the tab bar. By default, the user is allowed to rearrange all items on the tab bar. If you do not want the user to modify some items, though, you can remove the appropriate view controllers from the array in the customizableViewControllers property.

### State Preservation

When you assign a value to this view controller's restorationIdentifier property, it preserves a reference to the view controller in the selected tab. At restore time, it uses the reference to select the tab with the same view controller.

When preserving a tab bar controller, assign unique restoration identifiers to the child view controllers you want to preserve. Omitting a restoration identifier from a child view controller causes that tab to return to its default configuration. Although the tab bar controller saves its tabs in the same order that they are listed in the viewControllers property, the save order is actually irrelevant. Your code is responsible for providing the new tab bar controller during the next launch cycle, so your code can adjust the order of the tabs as needed. The state preservation system restores the contents of each tab based on the assigned restoration identifier, not based on the position of the tab.

### Differences Between iOS and tvOS

Tab bar controllers serve the same purpose in tvOS as in iOS, but provide slightly different user interface features:

- In tvOS, the tab bar interface appears at the top of the window. When focus leaves the tab bar, the tab bar remains fixed at the top of the screen by default. To create an interface where the tab bar doesn't remain fixed, but instead scrolls with the content, set the tabBarObservedScrollView property to the appropriate scroll view. In iOS, the tab bar always stays pinned at the bottom of the screen.

- In tvOS, swiping down from the tab bar moves focus into the content view; specifically, to the first focusable view that's visually below the selected tab. Swiping down behaves like a normal focus-changing gesture — that is, focus moves in the direction the user swiped. If nothing is focusable immediately below the selected tab, the closest focusable view is focused instead. In iOS, the tab bar always remains in focus at the bottom of the screen.

- In tvOS, pressing the Select button while a tab is focused moves focus into the content view. Because there's no direction associated with this change, focus moves to the most appropriate view specified in the content view's preferredFocusEnvironments property. In iOS, there's no notion of focusing between views.

- Tab bar controllers in tvOS don't support customization. A tab bar controller displays only the number of view controllers from its viewControllers array that fit on the screen, and doesn't provide the More interface seen in iOS.

---

## Gesture Recognizers
https://developer.apple.com/documentation/uikit/touches-presses-and-gestures

Encapsulate your app's event-handling logic in gesture recognizers so that you can reuse that code throughout your app.

### Overview

If you build your apps using standard UIKit views and controls, UIKit automatically handles touch events (including Multitouch events) for you. However, if you use custom views to display your content, you must handle all touch events that occur in your views. There are two ways to handle touch events yourself:

- Use gesture recognizers to track the touches
- Track the touches directly in your UIView subclass

### Standard Gesture Recognizers

UIKit includes several standard gesture recognizers that handle common touch patterns:

#### UITapGestureRecognizer
A discrete gesture recognizer that interprets single or multiple taps.

Use this gesture recognizer to detect single or multiple taps on a view. You can configure the number of taps required to match (single tap, double tap, triple tap, and so on) and the number of fingers that must be touching the screen.

#### UILongPressGestureRecognizer
A continuous gesture recognizer that interprets long-press gestures.

Long-press gestures are continuous. The gesture begins when the specified number of fingers have been pressed for the specified period of time and the touches haven't moved beyond the allowable range of movement. The gesture recognizer transitions to the Change state whenever a finger moves, and it ends when any of the fingers are lifted.

#### UIPanGestureRecognizer
A continuous gesture recognizer that interprets panning gestures.

A panning gesture is continuous. It begins when the minimum number of fingers allowed have moved enough to be considered a pan. It changes when a finger moves while at least the minimum number of fingers are pressed down. It ends when all fingers are lifted.

#### UIPinchGestureRecognizer
A continuous gesture recognizer that interprets pinching gestures involving two touches.

A pinch gesture is a continuous gesture that tracks the distance between the first two fingers that touch the screen. Use the scale factor of the gesture recognizer to adjust the size of your content.

#### UIRotationGestureRecognizer
A continuous gesture recognizer that interprets rotation gestures involving two touches.

A rotation gesture is continuous. It begins when two touches have moved enough to be considered a rotation. The gesture changes when a finger moves while the two fingers are down. It ends when both fingers have lifted. At each stage, the gesture recognizer sends its action message.

#### UISwipeGestureRecognizer
A discrete gesture recognizer that interprets swiping gestures in one or more directions.

A swipe is a discrete gesture, and thus the associated action message is sent only once per gesture. You can specify the direction of the swipe (up, down, left, or right) and the number of fingers that must be present on the screen.

#### UIScreenEdgePanGestureRecognizer
A continuous gesture recognizer that interprets panning gestures that start near an edge of the screen.

This gesture recognizer behaves like UIPanGestureRecognizer except that it's only triggered when the gesture starts near an edge of the screen. You specify which edges are relevant for this gesture recognizer.

### UIGestureRecognizer

The base class for concrete gesture recognizers.

A gesture recognizer object — or, simply, a gesture recognizer — decouples the logic for recognizing a sequence of touches (or other input) and acting on that recognition. When one of these objects recognizes a common gesture or, in some cases, a change in the gesture, it sends an action message to each designated target object.

Concrete subclasses of UIGestureRecognizer are the following:
- UITapGestureRecognizer
- UIPinchGestureRecognizer
- UIRotationGestureRecognizer
- UISwipeGestureRecognizer
- UIPanGestureRecognizer
- UIScreenEdgePanGestureRecognizer
- UILongPressGestureRecognizer

The UIGestureRecognizer class defines a set of common behaviors that can be configured for all concrete gesture recognizers. It can also communicate with its delegate (an object that adopts the UIGestureRecognizerDelegate protocol), thereby enabling finer-grained customization of some behaviors.

A gesture recognizer operates on touches hit-tested to a specific view and all of that view's subviews. It thus must be associated with that view. To make that association you must call the UIView method addGestureRecognizer(_:). A gesture recognizer doesn't participate in the view's responder chain.

A gesture recognizer has one or more target-action pairs associated with it. If there are multiple target-action pairs, they're discrete, and not cumulative. Recognition of a gesture results in the dispatch of an action message to a target for each of those pairs. The action methods invoked must have one of the following signatures:

```swift
@IBAction func myActionMethod()
@IBAction func myActionMethod(_ sender: UIGestureRecognizer)
```

### Gesture Recognizer States

Gesture recognizers operate in a predefined state machine with the following states:

- possible: The gesture recognizer has not yet recognized its gesture, but may be evaluating touch events. This is the default state.
- began: The gesture recognizer has recognized its gesture. (This state applies only to continuous gestures.)
- changed: The gesture recognizer has received touches recognized as a change to the gesture. (This state applies only to continuous gestures.)
- ended: The gesture recognizer has received touches recognized as the end of the gesture. The action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizer.State.possible.
- cancelled: The gesture recognizer has received touches resulting in the cancellation of the gesture. The action method will be called at the next turn of the run loop. The recognizer will be reset to UIGestureRecognizer.State.possible.
- failed: The gesture recognizer has received a sequence of touches that can't be recognized as the gesture. No action method will be called and the recognizer will be reset to UIGestureRecognizer.State.possible.

### Coordinating Multiple Gesture Recognizers

UIKit normally allows only one gesture recognizer to receive touches at a time. In some cases, however, you might want multiple gesture recognizers to analyze the same touches simultaneously. For example, if you have both a pan gesture recognizer and a swipe gesture recognizer attached to the same view, you might want both gesture recognizers to analyze the gesture.

To allow multiple gesture recognizers to analyze the same set of touches, implement the UIGestureRecognizerDelegate protocol in your delegate object. The UIKit framework provides default behavior that can be overridden by your delegate:

- gestureRecognizerShouldBegin(_:): Asks the delegate if a gesture recognizer should begin interpreting touches.
- gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:): Asks the delegate if two gesture recognizers should be allowed to recognize gestures simultaneously.
- gestureRecognizer(_:shouldRequireFailureOf:): Asks the delegate if a gesture recognizer should require another gesture recognizer to fail.
- gestureRecognizer(_:shouldBeRequiredToFailBy:): Asks the delegate if a gesture recognizer should be required to fail by another gesture recognizer.

You can also establish dependencies between gesture recognizers directly using the require(toFail:) method. This method creates a dependency relationship between the gesture recognizer you call it on and another gesture recognizer. The gesture recognizer you call this method on won't transition out of UIGestureRecognizer.State.possible until the other gesture recognizer transitions to UIGestureRecognizer.State.failed or UIGestureRecognizer.State.recognized.

---

## Summary

UIKit is Apple's comprehensive framework for building user interfaces on iOS, iPadOS, and tvOS. It provides a rich set of components and patterns for creating responsive, interactive applications:

### Core Concepts

1. **View Controllers** - Manage screens and coordinate the flow of your app
2. **Views** - Build blocks for visual content and user interaction
3. **Auto Layout** - Create adaptive interfaces that work across different screen sizes
4. **Navigation Patterns** - UINavigationController for hierarchical navigation, UITabBarController for flat navigation
5. **Data Display** - UITableView for lists, UICollectionView for grids and custom layouts
6. **Gesture Recognition** - Handle touches, swipes, pinches, and other interactions
7. **Animation** - Bring interfaces to life with property animations
8. **Accessibility** - Make apps usable by everyone with built-in accessibility support

### Key Design Patterns

- **Model-View-Controller (MVC)** - Separate data, presentation, and logic
- **Delegation** - Customize behavior through protocol conformance
- **Target-Action** - Connect UI controls to code
- **Data Source and Delegate** - Provide data and handle interactions for complex views
- **Responder Chain** - Route events through the view hierarchy

### Best Practices

1. Use Interface Builder and storyboards for visual layout when possible
2. Implement Auto Layout for adaptive interfaces
3. Follow iOS Human Interface Guidelines
4. Handle memory efficiently with proper view controller lifecycle management
5. Test on multiple device sizes and orientations
6. Support Dynamic Type for accessibility
7. Use gesture recognizers instead of direct touch handling
8. Leverage UIKit's built-in animations
9. Implement proper state preservation and restoration
10. Always update UI on the main thread

UIKit continues to evolve alongside SwiftUI, and the two frameworks can be used together in the same app. While SwiftUI represents the future of Apple platform development, UIKit remains essential for:
- Complex custom interfaces
- Fine-grained control over animations and transitions
- Integration with existing codebases
- Platform-specific features not yet available in SwiftUI

Understanding UIKit provides a solid foundation for iOS development and helps developers create polished, professional applications that feel at home on Apple platforms.