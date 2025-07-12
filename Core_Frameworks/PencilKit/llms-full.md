# PencilKit Framework - Full Documentation

## Table of Contents
1. [Framework Overview](#framework-overview)
2. [PKCanvasView](#pkcanvasview)
3. [PKDrawing](#pkdrawing)
4. [PKToolPicker](#pktoolpicker)
5. [PKStroke](#pkstroke)
6. [PKStrokePath](#pkstrokepath)
7. [PKStrokePoint](#pkstrokepoint)
8. [PKInk](#pkink)
9. [PKInkingTool](#pkinkingtool)
10. [PKEraserTool](#pkerasertool)
11. [Drawing with PencilKit](#drawing-with-pencilkit)
12. [Supporting Backward Compatibility](#supporting-backward-compatibility)
13. [Customizing Scribble with Interactions](#customizing-scribble-with-interactions)

---

## Framework Overview

# PencilKit

Capture touch and Apple Pencil input as a drawing, and display that content from your app.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+visionOS 1.0+

### Overview

PencilKit makes it easy to incorporate hand-drawn content into your iPadOS or macOS apps. PencilKit provides a drawing environment for your iOS app that receives input from Apple Pencil or the user's finger, and turns it into images you display in iPadOS, iOS, or macOS. The environment comes with tools for creating, erasing, and selecting lines.

You capture content in your iPad app using a `PKCanvasView` object that you integrate into your existing view hierarchy. It supports the low-latency capture of touches originating from Apple Pencil or your finger. The canvas object sends final results as a `PKDrawing` object, whose contents you can save with your app's content. You can also convert the drawn content into an image for display in iOS or macOS app.

For information about handling user interactions on Apple Pencil in your UIKit app, see Apple Pencil interactions.

### Topics

#### Canvas
- Drawing with PencilKit - Add expressive, low-latency drawing to your app using PencilKit.
- Customizing Scribble with Interactions - Enable writing on a non-text-input view by adding interactions.
- Inspecting, Modifying, and Constructing PencilKit Drawings - Score users' ability to match PencilKit drawings generated from text, by accessing the strokes and points inside PencilKit drawings.
- `class PKCanvasView` - A view that captures Apple Pencil input and displays the rendered results in an iOS app.
- `struct PKDrawing` - A structure representing the drawing information captured by a canvas view.
- `struct PKStroke` - A structure that represents the paths, boundaries, and other properties of a stroke drawn on a canvas.
- `struct PKStrokePath` - A structure that captures the components of a stroke and provides methods to find and interpolate points along the stroke's path.
- `struct PKStrokePoint` - A structure that represents the properties of a specific point along a stroke's path.
- `struct PKInk` - A structure that represents an ink that specifies its type, color, and width.

#### Tools
- Configuring the PencilKit tool picker - Incorporate a custom PencilKit tool picker with a variety of system and custom tools into a drawing app.
- `class PKToolPicker` - A tool palette that displays a selection of drawing tools and colors for tools that a person can choose from.
- `struct PKInkingTool` - A structure that defines the drawing characteristics (width, color, pen style) to use when drawing lines on a canvas view.
- `struct PKEraserTool` - A tool for erasing previously drawn content in a canvas view.
- `struct PKLassoTool` - A tool for selecting stroked lines and shapes in a canvas view.
- `protocol PKTool` - An interface adopted by drawing and writing tools used by a canvas view.

#### Backward compatibility
- Supporting backward compatibility for ink types - Leverage the latest PencilKit features while providing a good user experience in earlier versions of the OS that don't support those features.
- `enum PKContentVersion` - Constants that represent versions of PencilKit for backward compatibility.

#### Classes
- `class PKResponderState` - The state of PencilKit behavior related to a `UIResponder`. (Beta)

#### Enumerations
- `enum PKToolPickerVisibility` - The visibility state of a tool picker. (Beta)

---

## PKDrawing

# PKDrawing

A structure representing the drawing information captured by a canvas view.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+visionOS 1.0+

```swift
struct PKDrawing
```

### Overview

A `PKDrawing` object stores the user-drawn content from a `PKCanvasView` object. You use drawing objects to store the data associated with your user's drawings. You can save this data with the rest of your app's content, and you can use that saved data to create a new drawing object later. You can also generate an image based on the drawn content that you can copy to the pasteboard, save to disk, or share.

### Topics

#### Creating a drawing object
- `init<S>(strokes: S)` - Creates a drawing object and populates it with a sequence of strokes the user provides.
- `init(data: Data) throws` - Creates a drawing object and populates it with previously drawn content.
- `init()` - Creates an empty drawing object.

#### Getting the canvas bounds
- `var bounds: CGRect` - The smallest rectangle used to represent the content's bounds, taking into account line widths of that content.

#### Generating an image
- `func image(from: CGRect, scale: CGFloat) -> UIImage` - Returns an image object that contains the specified portion of the drawing.
- `func image(from: CGRect, scale: CGFloat) -> NSImage` - Returns an image object that contains the specified portion of the drawing.

#### Getting the drawing data
- `var strokes: [PKStroke]` - The array of strokes that make up the drawing.
- `func dataRepresentation() -> Data` - Returns a raw data representation of the rendered content.
- `let PKAppleDrawingTypeIdentifier: CFString` - The uniform type identifier for data associated with a drawing object.

#### Modifying the drawing
- `func transform(using: CGAffineTransform)` - Applies the specified transform to the contents of this drawing.
- `func transformed(using: CGAffineTransform) -> PKDrawing` - Applies the specified transform and returns a new drawing.
- `func append(PKDrawing)` - Appends the contents of the specified drawing object to an existing drawing object that you provide.
- `func appending(PKDrawing) -> PKDrawing` - Returns a new drawing created by appending the current drawing with another drawing you provide.

#### Supporting backward compatibility
- `var requiredContentVersion: PKContentVersion` - The version of PencilKit necessary to use the drawing.

#### Using reference types
- `class PKDrawingReference` - A data structure that contains the drawing information captured by a canvas view.

### Relationships

#### Conforms To
- Copyable
- Decodable
- Encodable
- Equatable

---

## PKToolPicker

# PKToolPicker

A tool palette that displays a selection of drawing tools and colors for tools that a person can choose from.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+visionOS 1.0+

```swift
class PKToolPicker
```

### Overview

A `PKToolPicker` manages a draggable palette that displays drawing tools, colors, and additional options. You add a tool picker to your interface and configure it to display its palette at appropriate times. While the palette is onscreen, a person may reposition it anywhere within the current window. When a person interacts with the palette, the tool picker notifies registered observers of the changes so that they can respond.

When configuring your interface, call the `setVisible(_:forFirstResponder:)` method to associate the tool picker with one or more views in your interface. Each window manages its own tool picker, and the window's first responder determines the visibility of that tool picker. When one of the registered objects becomes first responder, the tool picker automatically adds its palette view to the current window. When there isn't a registered object as first responder, the tool picker hides its palette view.

`PKCanvasView` implements the observer protocol for detecting tool picker changes. Adding your canvas view as an observer to a tool picker automatically updates the current drawing tools. For more information about implementing custom observer objects, see `PKToolPickerObserver`.

### Topics

#### Creating a tool picker
- `init()` - Creates a new tool picker with a default set of tools.
- `init(toolItems: [PKToolPickerItem])` - Creates a new tool picker with the tools you specify.
- `class PKToolPickerInkingItem` - An item that represents an inking tool in the tool picker.
- `class PKToolPickerEraserItem` - An item that represents an eraser tool in the tool picker.
- `class PKToolPickerLassoItem` - An item that represents a lasso tool in the tool picker.
- `class PKToolPickerRulerItem` - An item that represents a ruler tool in the tool picker.
- `class PKToolPickerScribbleItem` - An item that represents a Scribble tool in the tool picker.
- `class PKToolPickerCustomItem` - An item that represents a custom tool in the tool picker.
- `class PKToolPickerItem` - The base class for an item in the tool picker.

#### Accessing the picker's tools
- `var toolItems: [PKToolPickerItem]` - All tool items in the tool picker.

#### Detecting changes to the picker
- `func addObserver(any PKToolPickerObserver)` - Adds the specified object to the list of objects to notify when the picker configuration changes.
- `func removeObserver(any PKToolPickerObserver)` - Removes the specified object from the list of objects to notify when the picker configuration changes.
- `protocol PKToolPickerObserver` - An interface you use to detect when the user changes the selected tools and drawing characteristics of a tool picker object.

#### Coordinating the visibility of the picker
- `func setVisible(Bool, forFirstResponder: UIResponder)` - Sets the visibility for the tool picker, based on when the specified responder object becomes active.
- `var isVisible: Bool` - A Boolean value that indicates whether the tool picker is currently visible.
- `func frameObscured(in: UIView) -> CGRect` - Returns the portion of the specified view that the tool picker obscures.

#### Managing selected tools
- `var selectedToolItem: PKToolPickerItem` - The currently selected tool item in the tool picker.
- `var selectedToolItemIdentifier: String` - The identifier of the selected tool item in the tool picker.

#### Customizing picker behavior
- `var isRulerActive: Bool` - A Boolean value that indicates whether the ruler is visible on the canvas.
- `var colorUserInterfaceStyle: UIUserInterfaceStyle` - The user interface style for the tool picker.
- `var overrideUserInterfaceStyle: UIUserInterfaceStyle` - The specific user interface style to apply to the tool picker.
- `var showsDrawingPolicyControls: Bool` - A Boolean value that indicates whether the default drawing policy UI is visible.
- `var stateAutosaveName: String?` - The name used to automatically save the tool picker's state in the defaults system.

#### Configuring the accessory item
- `var accessoryItem: UIBarButtonItem?` - An optional button that appears at the trailing edge of the tool picker.

#### Supporting PencilKit versions
- `var maximumSupportedContentVersion: PKContentVersion` - The maximum version of PencilKit to support.

#### Deprecated
- `class func shared(for: UIWindow) -> PKToolPicker?` - Returns the tool picker object to use for the specified window. (Deprecated)
- `var selectedTool: any PKTool` - The currently selected tool in the tool picker. (Deprecated)

#### Protocols
- `protocol Delegate`

#### Instance Properties
- `var colorMaximumLinearExposure: CGFloat` - Maximum linear exposure for the color picker used by the tool picker. Can be used to enable picking HDR colors. (Beta)
- `var delegate: (any PKToolPicker.Delegate)?` - The delegate for the tool picker.
- `var prefersDismissControlVisible: Bool` - If this is true the tool picker may show UI that allows dismissing it. If this is false the tool picker will not show this UI. By default this resigns first responder, but is customizable by `PKToolPickerDelegate`'s `toolPickerWillDismiss...` method.

#### Type Properties
- `class var defaultToolItems: [PKToolPickerItem]` - The default tool items for new tool pickers. (Beta)

### Relationships

#### Inherits From
- NSObject

#### Conforms To
- CVarArg
- CustomDebugStringConvertible
- CustomStringConvertible
- Equatable
- Hashable
- NSObjectProtocol

---

## PKStroke

# PKStroke

A structure that represents the paths, boundaries, and other properties of a stroke drawn on a canvas.

iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+visionOS 1.0+

```swift
struct PKStroke
```

### Topics

#### Creating a stroke object
- `init(ink: PKInk, path: PKStrokePath, transform: CGAffineTransform, mask: UIBezierPath?)` - Creates a stroke with the line properties, path, transform, and mask that you specify.
- `init(ink: PKInk, path: PKStrokePath, transform: CGAffineTransform, mask: NSBezierPath?)` - Creates a stroke with the line properties, path, transform, and mask that you specify.
- `init(ink: PKInk, path: PKStrokePath, transform: CGAffineTransform, mask: UIBezierPath?, randomSeed: UInt32)` - Creates a stroke with the line properties, path, transform, mask, and random seed that you specify.
- `init(ink: PKInk, path: PKStrokePath, transform: CGAffineTransform, mask: NSBezierPath?, randomSeed: UInt32)` - Creates a macOS stroke with the line properties, path, transform, mask, and random seed that you specify.

#### Getting the stroke properties
- `var ink: PKInk` - The Ink, which is a combination of a tool used to render this stroke.
- `var mask: UIBezierPath?` - The pretransform mask used to clip the rendering of the stroke.
- `var mask: NSBezierPath?` - The pretransform mask used to clip the rendering of the stroke.
- `var maskedPathRanges: [ClosedRange<CGFloat>]` - The range of points in the stroke path reference that intersect the stroke's mask.
- `var path: PKStrokePath` - The B-spline path that describes this stroke.
- `var renderBounds: CGRect` - The bounds of the rendered stroke, including the width and line properties of the stroke after applying the transform.
- `var transform: CGAffineTransform` - The affine transform of the stroke after rendering.
- `var randomSeed: UInt32`

#### Supporting backward compatibility
- `var requiredContentVersion: PKContentVersion` - The version of PencilKit necessary to use the stroke.

#### Using reference types
- `class PKStrokeReference` - A class that represents the paths, boundaries and other properties of a stroke drawn on a canvas.

### Relationships

#### Conforms To
- Copyable

---

## PKStrokePath

# PKStrokePath

A structure that captures the components of a stroke and provides methods to find and interpolate points along the stroke's path.

iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+visionOS 1.0+

```swift
struct PKStrokePath
```

### Topics

#### Creating a new stroke path
- `init()` - Creates an empty stroke path.
- `init<T>(controlPoints: T, creationDate: Date)` - Creates a stroke path with the cubic B-spline control points and a date that you specify.

#### Getting the stroke path properties
- `var creationDate: Date` - The creation date and time of this stroke path.

#### Accessing and interpolating points
- `func interpolatedPoints(in: ClosedRange<CGFloat>?, by: PKStrokePath.InterpolatedSlice.Stride) -> PKStrokePath.InterpolatedSlice` - Returns the slice on-curve points using the floating point range and stride that you specify.
- `func interpolatedLocation(at: CGFloat) -> CGPoint` - Returns the on-curve point for the floating point parametric value.
- `func interpolatedPoint(at: CGFloat) -> PKStrokePoint` - Returns the on-curve point for the provided floating point parameter.
- `func parametricValue(CGFloat, offsetBy: PKStrokePath.InterpolatedSlice.Stride) -> CGFloat`

#### Supporting types
- `struct InterpolatedSlice` - A struct representing an interpolated slice of stroke points with a specific stride across a range of this stroke data.

#### Supporting protocol requirements
- API Reference Protocol implementations - Access the stroke path's implementations of protocol methods.

#### Using reference types
- `class PKStrokePathReference` - A class that captures the components of a stroke and provides methods to find and interpolate points along the stroke's path.

### Relationships

#### Conforms To
- BidirectionalCollection
- Collection
- Copyable
- RandomAccessCollection
- Sequence

---

## PKStrokePoint

# PKStrokePoint

A structure that represents the properties of a specific point along a stroke's path.

iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+visionOS 1.0+

```swift
struct PKStrokePoint
```

### Topics

#### Creating a stroke point object
- `init(location: CGPoint, timeOffset: TimeInterval, size: CGSize, opacity: CGFloat, force: CGFloat, azimuth: CGFloat, altitude: CGFloat)` - Creates a new point with the provided properties.
- `init(location: CGPoint, timeOffset: TimeInterval, size: CGSize, opacity: CGFloat, force: CGFloat, azimuth: CGFloat, altitude: CGFloat, secondaryScale: CGFloat)`

#### Getting the point's location
- `var location: CGPoint` - The location of this point.
- `var timeOffset: TimeInterval` - The time offset since the start of the stroke path in seconds.

#### Getting the point's touch data
- `var altitude: CGFloat` - The altitude of this point in radians.
- `var azimuth: CGFloat` - The azimuth of this point in radians.
- `var force: CGFloat` - The amount of force applied by the touch.

#### Getting the point's drawing data
- `var size: CGSize` - The size of this point.
- `var opacity: CGFloat` - Opacity of the point.
- `var secondaryScale: CGFloat`

#### Using reference types
- `class PKStrokePointReference` - A class that represents the properties of a specific point along a stroke's path.

#### Initializers
- `init(location: CGPoint, timeOffset: TimeInterval, size: CGSize, opacity: CGFloat, force: CGFloat, azimuth: CGFloat, altitude: CGFloat, secondaryScale: CGFloat, threshold: CGFloat)` - Create a new point with the provided properties. (Beta)

#### Instance Properties
- `var threshold: CGFloat` - The threshold for clipping the stroke rendering. (Beta)

### Relationships

#### Conforms To
- Copyable

---

## PKInk

# PKInk

A structure that represents an ink that specifies its type, color, and width.

iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+visionOS 1.0+

```swift
struct PKInk
```

### Topics

#### Creating an ink object
- `init(PKInk.InkType, color: UIColor)` - Creates a new ink, specifying its type and color.
- `init(PKInk.InkType, color: NSColor)` - Creates a new ink, specifying its type and color.
- `typealias InkType` - A type alias referring to the ink type of an inking tool.

#### Getting the ink attributes
- `var color: UIColor` - The color of this ink.
- `var color: NSColor` - The color of this ink.
- `var inkType: PKInk.InkType` - The line presentation to use for this Ink.

#### Supporting backward compatibility
- `var requiredContentVersion: PKContentVersion` - The version of PencilKit necessary to use the ink.

#### Using reference types
- `class PKInkReference` - Provides a description of the creation and rendering of marks on a canvas.

### Relationships

#### Conforms To
- Copyable

---

## PKInkingTool

# PKInkingTool

A structure that defines the drawing characteristics (width, color, pen style) to use when drawing lines on a canvas view.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 11.0+visionOS 1.0+

```swift
struct PKInkingTool
```

### Overview

A `PKInkingTool` object supports the creation of new content on a `PKCanvasView`. With an inking tool, the canvas turns touch input from the user into a continuously rendered stroke. The value in the `width` property determines the base width of that stroke; however, that base value also depends on input from Apple Pencil, including force, azimuth, and angle data.

Create an inking tool programmatically, or display a `PKToolPicker` object and from which a user can select a tool. Assign the resulting object to the `tool` property of your `PKCanvasView` object. The canvas uses any subsequent touch sequences to draw new content on the canvas. Assigning a new inking tool doesn't change the characteristics for any previously drawn strokes.

### Topics

#### Creating an inking tool
- `init(PKInkingTool.InkType, color: UIColor, width: CGFloat?)` - Creates an ink tool object with the specified color and line width values.
- `init(PKInkingTool.InkType, color: NSColor, width: CGFloat?)` - Creates an ink tool object with the specified color and line width values.
- `init(ink: PKInk, width: CGFloat)` - Create an inking tool with the specified ink and width.

#### Getting the width information
- `var defaultWidth: CGFloat` - The default line width for the specified tool type.
- `var validWidthRange: ClosedRange<CGFloat>` - The range of widths allowed for an ink of this type.

#### Getting the inking tool attributes
- `var color: UIColor` - The color of the ink.
- `var color: NSColor` - The color of the ink.
- `var width: CGFloat` - The width of the ink.
- `var ink: PKInk` - The ink used by this inking tool.

#### Getting the tool type
- `var inkType: PKInkingTool.InkType` - The tool type that determines the shape of the rendered content.
- `enum InkType` - The type that defines the shape of stroked lines.

#### Working with colors
- `static func convertColor(UIColor, from: UIUserInterfaceStyle, to: UIUserInterfaceStyle) -> UIColor` - Convert a color from one user interface style to another.

#### Supporting backward compatibility
- `var requiredContentVersion: PKContentVersion` - The version of PencilKit necessary to use the inking tool.

#### Using reference types
- `class PKInkingToolReference` - An object that defines the drawing characteristics (width, color, pen style) to use when drawing lines on a canvas view.

#### Initializers
- `init(PKInkingTool.InkType, color: UIColor, width: CGFloat?, azimuth: CGFloat)`
- `init(PKInkingTool.InkType, color: NSColor, width: CGFloat?, azimuth: CGFloat)`

#### Instance Properties
- `var azimuth: CGFloat` - The base angle of the ink. (Beta)

### Relationships

#### Conforms To
- Copyable
- Equatable
- PKTool

---

## PKEraserTool

# PKEraserTool

A tool for erasing previously drawn content in a canvas view.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 11.0+visionOS 1.0+

```swift
struct PKEraserTool
```

### Overview

A `PKEraserTool` object supports the deletion of content from a `PKCanvasView` object. The eraser tool's type determines whether the canvas removes entire items or just the portion of an item that it touches.

Create an eraser tool programmatically or display a `PKToolPicker` object and let the user select the eraser. Assign the resulting object to the `tool` property of your `PKCanvasView` object. The canvas uses any subsequent touch sequences to erase content on the canvas.

### Topics

#### Creating an eraser tool
- `init(PKEraserTool.EraserType)` - Creates an eraser tool object that removes objects wholly or partially from a canvas view.
- `init(PKEraserTool.EraserType, width: CGFloat)` - Creates an eraser tool object with the specified width.

#### Getting the eraser type
- `var eraserType: PKEraserTool.EraserType` - The behavior adopted by the eraser when deleting content.
- `enum EraserType` - Constants that indicate the behavior of the eraser.

#### Specifying the width
- `var width: CGFloat` - The width of the eraser.

#### Using reference types
- `class PKEraserToolReference` - A tool for erasing previously drawn content in a canvas view.

### Relationships

#### Conforms To
- Copyable
- Equatable
- PKTool

---

## Drawing with PencilKit

# Drawing with PencilKit

Add expressive, low-latency drawing to your app using PencilKit.

iOS 13.0+iPadOS 13.0+Xcode 11.5+

### Overview

This sample code project must be run on a physical device with Apple Pencil.

### See Also

#### Canvas
- Customizing Scribble with Interactions - Enable writing on a non-text-input view by adding interactions.
- Inspecting, Modifying, and Constructing PencilKit Drawings - Score users' ability to match PencilKit drawings generated from text, by accessing the strokes and points inside PencilKit drawings.
- `class PKCanvasView` - A view that captures Apple Pencil input and displays the rendered results in an iOS app.
- `struct PKDrawing` - A structure representing the drawing information captured by a canvas view.
- `struct PKStroke` - A structure that represents the paths, boundaries, and other properties of a stroke drawn on a canvas.
- `struct PKStrokePath` - A structure that captures the components of a stroke and provides methods to find and interpolate points along the stroke's path.
- `struct PKStrokePoint` - A structure that represents the properties of a specific point along a stroke's path.
- `struct PKInk` - A structure that represents an ink that specifies its type, color, and width.

---

## Supporting Backward Compatibility

# Supporting backward compatibility for ink types

Leverage the latest PencilKit features while providing a good user experience in earlier versions of the OS that don't support those features.

### Overview

In iPadOS 17, PencilKit becomes even more expressive by introducing the monoline, fountain pen, watercolor, and crayon inks. Earlier versions of the OS can't render `PKDrawing` objects that use these inks because the system doesn't contain a version of PencilKit that supports them. As a result, earlier versions of the OS throw an error when attempting to load a `PKDrawing` object that contains these inks from data.

You can handle this situation in your app in one of two ways:

- Support backward compatibility. Let people use the new inks when your app runs in the latest version of the OS. Before you save a drawing and sync the data to other devices, check its required content version to determine if it uses the new inks. If it does, provide a good fallback experience for devices that can't load that drawing, like syncing a fallback drawing that's compatible with the earlier version of PencilKit.

- Restrict the use of new features. Limit which inks are available when your app runs in any version of the OS. This approach ensures that the PencilKit data your app saves is compatible with the earlier version of PencilKit, but it doesn't let people take advantage of the new inks.

### Support backward compatibility using the required content version

To support backward compatibility, PencilKit introduces content versioning through `PKContentVersion`. Data model types like `PKDrawing`, `PKStroke`, `PKInkingTool`, and `PKInk` contain a `requiredContentVersion` property that PencilKit populates automatically. The value of this property indicates which version of PencilKit is required to load the underlying data:

- `PKContentVersion.version1` indicates that the data only contains inks introduced in iPadOS 14, and requires the device to run iPadOS 14 or later.

- `PKContentVersion.version2` indicates that the data contains inks introduced in iPadOS 17, and requires the device to run iPadOS 17 or later.

Before you save these data model types, check their `requiredContentVersion` to avoid syncing incompatible data to devices with earlier versions of the OS. For example, instead of syncing a `PKDrawing` that features new inks, you can sync a fallback drawing and show a message that suggests updating the device's OS to edit the latest drawing.

```swift
func updateDrawing(_ drawing: PKDrawing, at index: Int) {
    if #available(iOS 17.0, *) {
        // Before saving, check if this drawing uses new inks and requires a later
        // version of PencilKit than might be available on a person's other devices.
        switch drawing.requiredContentVersion {
        case .version2:
            // This drawing is incompatible with the earlier version of PencilKit.
            // Sync a backward-compatible drawing to display on devices with earlier OS versions.
            dataModel.drawings[index] = fallbackDrawing
        default:
            // This drawing is compatible with the earlier version of PencilKit.
            // Sync the current drawing since there's no need to provide a
            // backward-compatible drawing instead.
            dataModel.drawings[index] = drawing
        }
    } else {
        dataModel.drawings[index] = drawing
    }
    saveDataModel()
}
```

### Limit available inks using the maximum supported content version

If your app is unable to support backward compatibility for different versions of the OS, use the `maximumSupportedContentVersion` property to limit which inks are available in your app. This limitation ensures that the data your app saves is compatible with the earlier version of PencilKit so you can load it on devices with earlier versions of the OS.

If you take this approach, you need to set `maximumSupportedContentVersion` on both `PKCanvasView` and `PKToolPicker`. For example, set this property to `PKContentVersion.version1` to limit which kinds of edits the canvas views offers and which tools are available for a person to select when they create PencilKit content in your app.

```swift
// Set the maximum supported content version for the canvas view and any tool pickers.
@IBOutlet weak var canvasView: PKCanvasView!
var toolPicker = PKToolPicker()

// The canvas view limits the edits that a person can make so they're compatible with the
// the earlier version of PencilKit.
canvasView.maximumSupportedContentVersion = .version1

// The tool picker limits the tools that are available so they're compatible with
// the earlier version of PencilKit.
toolPicker.maximumSupportedContentVersion = .version1
```

### See Also

#### Backward compatibility
- `enum PKContentVersion` - Constants that represent versions of PencilKit for backward compatibility.

---

## Customizing Scribble with Interactions

# Customizing Scribble with Interactions

Enable writing on a non-text-input view by adding interactions.

iOS 14.0+iPadOS 14.0+Xcode 11.5+

### Overview

This sample code project must be run on a physical device with Apple Pencil.

### See Also

#### Canvas
- Drawing with PencilKit - Add expressive, low-latency drawing to your app using PencilKit.
- Inspecting, Modifying, and Constructing PencilKit Drawings - Score users' ability to match PencilKit drawings generated from text, by accessing the strokes and points inside PencilKit drawings.
- `class PKCanvasView` - A view that captures Apple Pencil input and displays the rendered results in an iOS app.
- `struct PKDrawing` - A structure representing the drawing information captured by a canvas view.
- `struct PKStroke` - A structure that represents the paths, boundaries, and other properties of a stroke drawn on a canvas.
- `struct PKStrokePath` - A structure that captures the components of a stroke and provides methods to find and interpolate points along the stroke's path.
- `struct PKStrokePoint` - A structure that represents the properties of a specific point along a stroke's path.
- `struct PKInk` - A structure that represents an ink that specifies its type, color, and width.

---

## Additional Information

### Core Components Summary

PencilKit provides a complete drawing environment with the following key components:

1. **PKCanvasView** - The primary view for capturing Apple Pencil and touch input
2. **PKDrawing** - The data structure that stores all drawn content
3. **PKToolPicker** - A floating palette for selecting drawing tools
4. **PKStroke** - Represents a single continuous stroke with its path and ink properties
5. **PKInk** - Defines the visual properties of drawing strokes
6. **Drawing Tools** - PKInkingTool, PKEraserTool, and PKLassoTool

### Apple Pencil Integration

PencilKit is optimized for Apple Pencil with:
- Low-latency rendering using Metal
- Pressure sensitivity affecting stroke width and opacity
- Tilt and orientation support for realistic brush effects
- Predictive touch processing for minimal input-to-screen delay

### Platform Support

- **iOS/iPadOS**: Full feature support, optimized for Apple Pencil
- **Mac Catalyst**: Available from 13.1+, supports mouse/trackpad input
- **macOS**: Native support from 10.15+, adapted for mouse input
- **visionOS**: Available from 1.0+, supports spatial input

### Storage and Persistence

Drawings can be saved using:
- `dataRepresentation()` method to serialize to Data
- `PKAppleDrawingTypeIdentifier` as the UTI for drawing data
- Forward and backward compatible binary format

### Version Compatibility

Use `PKContentVersion` to ensure compatibility:
- `version1`: iOS 14+ compatible (pen, pencil, marker, crayon, monoline, fountainPen)
- `version2`: iOS 17+ required (adds watercolor and additional ink types)

Set `maximumSupportedContentVersion` on canvas and tool picker to limit features for backward compatibility.