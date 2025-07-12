# PencilKit Framework Documentation

## Overview

PencilKit is Apple's framework for capturing and displaying hand-drawn content in iOS, iPadOS, macOS, and visionOS applications. It provides a complete drawing environment with tools for creating, erasing, and selecting content, optimized for Apple Pencil input with low-latency rendering.

**Availability**: iOS 13.0+, iPadOS 13.0+, Mac Catalyst 13.0+, macOS 10.15+, visionOS 1.0+

## Core Components

### PKCanvasView

The primary view for capturing Apple Pencil and touch input. PKCanvasView is a UIScrollView subclass that handles all touch events and renders drawing content.

**Key Features:**
- Captures input from Apple Pencil and finger touches
- Supports scrollable drawing areas larger than the view frame
- Integrates with PKToolPicker for tool selection
- Provides delegate callbacks for drawing changes

**Essential Properties:**
- `drawing: PKDrawing` - The data object containing drawn content
- `tool: PKTool` - Currently selected drawing tool
- `allowsFingerDrawing: Bool` - Whether finger input is accepted (deprecated, use drawingPolicy)
- `drawingPolicy: PKCanvasViewDrawingPolicy` - Controls touch input types (.pencilOnly, .anyInput, .default)
- `isRulerActive: Bool` - Shows/hides the ruler guide
- `drawingGestureRecognizer: UIGestureRecognizer` - Access to the drawing gesture recognizer
- `delegate: PKCanvasViewDelegate?` - Responds to drawing changes
- `maximumSupportedContentVersion: PKContentVersion` - For backward compatibility

**Important Methods:**
- Canvas automatically scales content to match the contentSize property
- Two-finger pan for scrolling (one-finger when allowsFingerDrawing is false)

### PKDrawing

The data structure that stores all drawn content from a PKCanvasView. Can be saved, loaded, and converted to images.

**Key Features:**
- Stores drawing as an array of PKStroke objects
- Serializable to Data for persistence
- Can generate images from drawings
- Supports transformations and appending

**Essential Properties:**
- `strokes: [PKStroke]` - Array of all strokes in the drawing
- `bounds: CGRect` - Bounding rectangle of all content
- `requiredContentVersion: PKContentVersion` - Minimum PencilKit version needed

**Essential Methods:**
- `init(data: Data)` - Create from saved data
- `init(strokes: [PKStroke])` - Create from stroke array
- `dataRepresentation() -> Data` - Serialize for storage
- `image(from: CGRect, scale: CGFloat) -> UIImage/NSImage` - Generate image
- `transform(using: CGAffineTransform)` - Apply transformation
- `append(PKDrawing)` - Add another drawing's content

**Data Storage:**
- Use `PKAppleDrawingTypeIdentifier` as the UTI for drawing data
- Save using `dataRepresentation()` method
- Load with `init(data:)` constructor

### PKToolPicker

A floating palette for selecting drawing tools, colors, and options. Manages tool selection UI and notifies observers of changes.

**Key Features:**
- Draggable tool palette
- System-provided drawing tools
- Support for custom tools
- Per-window management
- Automatic show/hide based on first responder

**Essential Properties:**
- `toolItems: [PKToolPickerItem]` - All available tools
- `selectedToolItem: PKToolPickerItem` - Currently selected tool
- `isVisible: Bool` - Current visibility state
- `isRulerActive: Bool` - Ruler tool state
- `stateAutosaveName: String?` - For saving picker state
- `maximumSupportedContentVersion: PKContentVersion` - Version support

**Essential Methods:**
- `init()` - Create with default tools
- `init(toolItems: [PKToolPickerItem])` - Create with custom tools
- `setVisible(_:forFirstResponder:)` - Control visibility
- `addObserver(_:)` / `removeObserver(_:)` - Monitor changes
- `frameObscured(in:) -> CGRect` - Get obscured area

**Tool Types:**
- `PKToolPickerInkingItem` - Drawing tools
- `PKToolPickerEraserItem` - Eraser tool
- `PKToolPickerLassoItem` - Selection tool
- `PKToolPickerRulerItem` - Ruler tool
- `PKToolPickerScribbleItem` - Handwriting tool
- `PKToolPickerCustomItem` - Custom tools

### PKStroke

Represents a single continuous stroke with its path, ink properties, and other attributes.

**Essential Properties:**
- `path: PKStrokePath` - The stroke's path data
- `ink: PKInk` - Drawing properties (color, width, type)
- `transform: CGAffineTransform` - Stroke transformation
- `mask: UIBezierPath?` - Optional clipping mask
- `renderBounds: CGRect` - Bounding box including ink width

### PKStrokePath

Contains the actual point data for a stroke, with methods for interpolation and analysis.

**Essential Properties:**
- `count: Int` - Number of points
- `creationDate: Date` - When stroke was created
- `parametricValue(at: Int) -> CGFloat` - Parameter at point index
- `interpolatedLocation(at: CGFloat) -> CGPoint` - Get point at parameter
- `interpolatedPoint(at: CGFloat) -> PKStrokePoint` - Full point data

### PKStrokePoint

Represents a single point in a stroke with position and drawing properties.

**Essential Properties:**
- `location: CGPoint` - Position in canvas coordinates
- `timeOffset: TimeInterval` - Time since stroke start
- `size: CGSize` - Touch size
- `opacity: CGFloat` - Point opacity (0.0-1.0)
- `force: CGFloat` - Pressure/force value
- `azimuth: CGFloat` - Pen angle (radians)
- `altitude: CGFloat` - Pen tilt (radians)

### PKInk

Defines the visual properties of drawing strokes.

**Essential Properties:**
- `inkType: PKInkType` - Type of ink
- `color: UIColor` - Ink color
- `requiredContentVersion: PKContentVersion` - Version needed

**Ink Types:**
- `.pen` - Standard pen
- `.pencil` - Pencil texture
- `.marker` - Marker with blending
- `.crayon` - Crayon texture  
- `.monoline` - Consistent width
- `.fountainPen` - Variable width
- `.watercolor` - Watercolor effects
- `.custom(String)` - Custom ink types

### Drawing Tools

**PKInkingTool:**
- `inkType: PKInkType` - Type of ink
- `color: UIColor` - Tool color
- `width: CGFloat` - Base width
- `requiredContentVersion: PKContentVersion` - Version needed

**PKEraserTool:**
- `eraserType: PKEraserType` - `.bitmap` or `.vector`
- `.bitmap` - Erases pixels
- `.vector` - Erases entire strokes

**PKLassoTool:**
- Used for selecting and moving strokes
- No configuration properties

## Apple Pencil Integration

### Gesture Recognition

**Drawing Gesture Recognizer:**
- Access via `canvasView.drawingGestureRecognizer`
- Handles all drawing input
- Can add dependencies or requirements
- Automatically manages Apple Pencil vs finger input

### Drawing Policies

**PKCanvasViewDrawingPolicy:**
- `.pencilOnly` - Only Apple Pencil input
- `.anyInput` - Pencil and finger input  
- `.default` - System default behavior

### Input Handling

**Pressure Sensitivity:**
- Captured in `PKStrokePoint.force`
- Values from 0.0 to 1.0
- Affects stroke width and opacity

**Tilt and Orientation:**
- `azimuth` - Rotation angle in canvas plane
- `altitude` - Tilt angle from vertical
- Used for realistic brush effects

**Low Latency:**
- Predictive touch processing
- Metal rendering pipeline
- Minimal input-to-screen delay

## Handwriting Recognition (Scribble)

### Scribble Integration

PencilKit automatically supports Scribble for handwriting recognition in text fields when:
- Running on iPadOS 14.0+
- Apple Pencil is being used
- System Scribble setting is enabled

### Custom Scribble Support

For non-text views, use UIIndirectScribbleInteraction:
- Add interaction to custom views
- Implement delegate methods
- Define writable regions
- Handle text insertion

**Key Components:**
- `PKToolPickerScribbleItem` - Scribble tool in picker
- System handles recognition automatically
- Works with UITextField, UITextView by default

## Storage and Persistence

### Saving Drawings

```swift
// Save drawing to data
let drawingData = drawing.dataRepresentation()

// Save to file
try drawingData.write(to: fileURL)

// Or save to UserDefaults, Core Data, etc.
```

### Loading Drawings

```swift
// Load from data
let drawingData = try Data(contentsOf: fileURL)
let drawing = try PKDrawing(data: drawingData)

// Apply to canvas
canvasView.drawing = drawing
```

### Data Format

- Binary format optimized for size
- Includes all stroke data and properties
- Forward and backward compatible
- Use `PKAppleDrawingTypeIdentifier` as UTI

## Performance Optimization

### Best Practices

1. **Canvas Size:** Keep drawing area reasonable
2. **Stroke Count:** Monitor number of strokes
3. **Image Generation:** Cache generated images
4. **Tool Picker:** Share single instance per window

### Memory Management

- Drawings are value types (struct)
- Efficient copy-on-write
- Clear unused drawings
- Use image generation sparingly

## Platform Considerations

### iOS/iPadOS
- Full feature support
- Optimized for Apple Pencil
- Supports all ink types

### Mac Catalyst
- Available from 13.1+
- Mouse/trackpad input supported
- Some features may differ

### macOS
- Native support from 10.15+
- Uses NSImage instead of UIImage
- Adapted for mouse input

### visionOS
- Available from 1.0+
- Supports spatial input
- Modified tool picker UI

## Common Use Cases

1. **Note-Taking Apps:** Full-page drawing canvas
2. **Annotation:** Overlay on documents/images
3. **Sketching:** Art and design applications
4. **Forms:** Signature capture
5. **Education:** Problem solving, diagrams
6. **Collaboration:** Shared whiteboards

## Version Compatibility

Use `PKContentVersion` to ensure compatibility:
- Set `maximumSupportedContentVersion` on canvas/picker
- Check `drawing.requiredContentVersion`
- Handle version mismatches gracefully
- Provide fallbacks for older versions

## Error Handling

Common issues:
- Invalid drawing data
- Unsupported content versions
- Memory pressure with large drawings
- Tool picker visibility conflicts

Always use try-catch for data operations and validate content versions before displaying drawings.