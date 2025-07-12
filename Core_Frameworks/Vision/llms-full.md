# Vision Framework - Full Documentation

Apple's Vision framework provides computer vision algorithms to perform a variety of tasks on input images and videos.

## Framework Overview

**Purpose**: Apply computer vision algorithms to perform a variety of tasks on input images and videos
**Availability**: iOS 11.0+, iPadOS 11.0+, Mac Catalyst 13.0+, macOS 10.13+, tvOS 11.0+, visionOS 1.0+
**Framework**: Vision

The Vision framework combines machine learning technologies and Swift's concurrency features to perform computer vision tasks in your app. Key capabilities include:

- Tracking human and animal body poses or object trajectories
- Recognizing text in 18 different languages
- Detecting faces and face landmarks (eyes, nose, mouth)
- Performing hand tracking for device interactions
- Calculating aesthetics scores for photos
- Analyzing document structure and content
- Detecting barcodes and rectangles
- Image classification and object detection
- All processing happens on-device for enhanced performance and privacy

## Main Vision Framework Page

Framework

# Vision

Apply computer vision algorithms to perform a variety of tasks on input images and videos.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.0+macOS 10.13+tvOS 11.0+visionOS 1.0+

### Overview

The Vision framework combines machine learning technologies and Swift's concurrency features to perform computer vision tasks in your app. Use the Vision framework to analyze images for a variety of purposes:

- Tracking human and animal body poses or the trajectory of an object
- Recognizing text in 18 different languages
- Detecting faces and face landmarks, such as eyes, nose, and mouth
- Performing hand tracking to enable new device interactions
- Calculating an aesthetics score to determine how memorable a photo is

To begin using the framework, you create a request for the type of analysis you want to do. Each request conforms to the VisionRequest protocol. You then perform the request to get an observation object — or an array of observations — with the analysis details for the request. There are more than 25 requests available to choose from. Vision also allows the use of custom Core ML models for tasks like classification or object detection.

## VNRecognizeTextRequest

Class

# VNRecognizeTextRequest

An image-analysis request that finds and recognizes text in an image.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+macOS 10.15+tvOS 13.0+visionOS 1.0+

```swift
class VNRecognizeTextRequest
```

### Overview

By default, a text recognition request first locates all possible glyphs or characters in the input image, and then analyzes each string. To specify or limit the languages to find in the request, set the recognitionLanguages property to an array that contains the names of the languages of text you want to recognize. Vision returns the result of this request in a VNRecognizedTextObservation object.

### Customizing Recognition Constraints

- `var minimumTextHeight: Float` - The minimum height, relative to the image height, of the text to recognize.
- `var recognitionLevel: VNRequestTextRecognitionLevel` - A value that determines whether the request prioritizes accuracy or speed in text recognition.
- `enum VNRequestTextRecognitionLevel` - Constants that identify the performance and accuracy of the text recognition.

### Accessing the Results

- `var results: [VNRecognizedTextObservation]?` - The results of the text recognition request.

### Specifying the Language

- `var automaticallyDetectsLanguage: Bool` - A Boolean value that indicates whether to attempt detecting the language to use the appropriate model for recognition and language correction.
- `var recognitionLanguages: [String]` - An array of languages to detect, in priority order.
- `var usesLanguageCorrection: Bool` - A Boolean value that indicates whether the request applies language correction during the recognition process.
- `var customWords: [String]` - An array of strings to supplement the recognized languages at the word-recognition stage.
- `func supportedRecognitionLanguages() throws -> [String]` - Returns the identifiers of the languages that the request supports.

## RecognizeTextRequest (Swift 6 API)

Structure

# RecognizeTextRequest

An image-analysis request that recognizes text in an image.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
struct RecognizeTextRequest
```

### Overview

This request generates a collection of RecognizedTextObservation objects that describe the text the request detects. By default, a text-recognition request first locates all possible glyphs or characters in the input image, and then analyzes each string. To specify or limit the languages to find in the request, set recognitionLanguages to an array that contains the names of the languages of text you want to recognize.

### Creating a request

```swift
init(RecognizeTextRequest.Revision?)
```

Creates a text-recognition request.

### Getting the revision

- `let revision: RecognizeTextRequest.Revision` - The algorithm or implementation the request uses.
- `static let supportedRevisions: [RecognizeTextRequest.Revision]` - The collection of revisions the request supports.
- `enum Revision` - A type that describes the algorithm or implementation that the request performs.

### Inspecting a request

- `var automaticallyDetectsLanguage: Bool` - A Boolean value that indicates whether to attempt detecting the language to use the appropriate model for recognition and language correction.
- `var usesLanguageCorrection: Bool` - A Boolean value that indicates whether the request applies language correction during the recognition process.
- `var supportedRecognitionLanguages: [Locale.Language]` - The identifiers of the languages that the request supports.
- `var customWords: [String]` - An array of strings to supplement the recognized languages at the word-recognition stage.
- `var minimumTextHeightFraction: Float` - The minimum height, relative to the image height, of the text to recognize.
- `var recognitionLanguages: [Locale.Language]` - An array of languages to detect, in priority order.
- `var recognitionLevel: RecognizeTextRequest.RecognitionLevel` - A value that determines whether the request prioritizes accuracy or speed in text recognition.
- `enum RecognitionLevel` - Constants that identify the performance and accuracy of the text recognition.

### Performing a request

Multiple perform methods available for different image formats:
- URL
- Data
- CGImage
- CVPixelBuffer
- CMSampleBuffer
- CIImage

## VNDocumentCameraViewController

Class

# VNDocumentCameraViewController

An object that presents UI for a camera pass-through that helps people scan physical documents.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+visionOS 1.0+

```swift
@MainActor
class VNDocumentCameraViewController
```

### Overview

This class enables a person to scan a physical document, page by page, by tapping a camera interface in the controller's view. The results of a scan include images, by page number. With the collection of scanned images, your app can create a digital version of the physical document and export the scanned images to PDF.

### Present a document scanning view controller in Swift

```swift
let documentCameraViewController = VNDocumentCameraViewController()
documentCameraViewController.delegate = self
present(documentCameraViewController, animated: true)
```

### Supporting the document camera

- `var delegate: (any VNDocumentCameraViewControllerDelegate)?` - The delegate to be notified when the user saves or cancels the document scanner.
- `class var isSupported: Bool` - A Boolean variable that indicates whether or not the current device supports document scanning.

## DetectDocumentSegmentationRequest

Structure

# DetectDocumentSegmentationRequest

A request that detects rectangular regions that contain text in the input image.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
struct DetectDocumentSegmentationRequest
```

### Overview

Perform this request to detect a document in an image. The result that the request generates contains the four corner points of a document's quadrilateral and saliency masks. The request returns the resulting location and segmentation mask in an instance of DetectedDocumentObservation.

## RecognizeDocumentsRequest (Beta)

Structure

# RecognizeDocumentsRequest

An image-analysis request to scan an image of a document and provide information about its structure.

iOS 26.0+Beta iPadOS 26.0+Beta Mac Catalyst 26.0+Beta macOS 26.0+Beta tvOS 26.0+Beta visionOS 26.0+Beta

```swift
struct RecognizeDocumentsRequest
```

### Overview

This request scans a document and extracts different groups of text and barcodes within the document image. Use this request to understand different types of structured texts like receipts, nutritional labels, textbook pages, forms, or other documents that you want to understand in further detail.

The request generates a DocumentObservation array, which allows you to access your chosen document's structure grouped by words, lines, or paragraphs. You can also access tables and lists that appear in the document.

### Inspecting a request

- `struct BarcodeDetectionOptions` - A configuration object for detecting barcodes in a document.
- `struct TextRecognitionOptions` - A configuration object for detected and recognized text within the document.
- `var barcodeDetectionOptions: RecognizeDocumentsRequest.BarcodeDetectionOptions` - A configuration object for detecting barcodes in a document.
- `var textRecognitionOptions: RecognizeDocumentsRequest.TextRecognitionOptions` - A configuration object for detected and recognized text within the document.
- `var supportedBarcodeSymbologies: [BarcodeSymbology]` - The collection of barcode symbologies recognized by the request.
- `var supportedRecognitionLanguages: [Locale.Language]` - The identifiers of the languages that the request supports.

## VisionRequest Protocol

Protocol

# VisionRequest

A type for image-analysis requests.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
protocol VisionRequest : CustomStringConvertible, Hashable, Sendable
```

### Getting the compute device

- `func computeDevice(for: ComputeStage) -> MLComputeDevice?` - Returns the compute device for a compute stage.
- `var supportedComputeStageDevices: [ComputeStage : [MLComputeDevice]]` - The collection of compute devices per stage that a request supports.
- `enum ComputeStage` - Types that represent the compute stage.

### Setting the compute device

- `func setComputeDevice(MLComputeDevice?, for: ComputeStage)` - Assigns a compute device for a compute stage.

### Performing the request

- `associatedtype Result` - An associated type that represents the result.
- `enum VisionResult` - The result the framework produces by performing a request.

## ImageRequestHandler

Class

# ImageRequestHandler

An object that processes one or more image-analysis requests pertaining to a single image.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
final class ImageRequestHandler
```

### Overview

Instantiate this handler to perform Vision requests on a single image. You specify the image, and then call perform(_:) to begin executing the request.

### Creating a request handler

Multiple convenience initializers for different image formats:
- `convenience init(URL, orientation: CGImagePropertyOrientation?)` - Creates a handler for performing requests on an image at the specified URL.
- `convenience init(Data, orientation: CGImagePropertyOrientation?)` - Creates a handler for performing requests on an image contained in a data object.
- `convenience init(CGImage, orientation: CGImagePropertyOrientation?)` - Creates a handler for performing requests on Core Graphics images.
- `convenience init(CVPixelBuffer, depthData: AVDepthData?, orientation: CGImagePropertyOrientation?)` - Creates a handler for performing requests on a Core Video pixel buffer.
- `convenience init(CMSampleBuffer, depthData: AVDepthData?, orientation: CGImagePropertyOrientation?)` - Creates a request handler that performs requests on an image contained within a sample buffer.
- `convenience init(CIImage, orientation: CGImagePropertyOrientation?)` - Creates a handler for performing requests on Core Image images.

### Performing the request

- `func perform<each T>(repeat each T) async throws -> (repeat (each T).Result)` - Performs one or more framework requests on the handler's image.
- `func perform<T>(T) async throws -> T.Result` - Performs a framework request on the handler's image.
- `func performAll(some Collection<any VisionRequest>) -> some AsyncSequence<VisionResult, Never>` - Schedules a collection of framework requests to perform on the handler's image.

## VisionObservation Protocol

Protocol

# VisionObservation

A type for objects produced by image-analysis requests.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
protocol VisionObservation : CustomStringConvertible, Decodable, Encodable, Hashable, Sendable
```

### Inspecting an observation

- `var uuid: UUID` - A unique alphanumeric value that the framework assigns the observation.
- `var confidence: Float` - The level of confidence in the observation's accuracy.
- `var description: String` - A textual representation of this instance.
- `var originatingRequestDescriptor: RequestDescriptor?` - The descriptor of the request that produces the observation.
- `enum RequestDescriptor` - A type that describes the request and revision combination.
- `var timeRange: CMTimeRange?` - The time range of the reported observation.

## RecognizedTextObservation

Structure

# RecognizedTextObservation

An object that contains information about both the location and content of text and glyphs that the framework recognizes in an image.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+

```swift
struct RecognizedTextObservation
```

### Getting the recognized text

- `func topCandidates(Int) -> [RecognizedText]` - Requests the top candidates for a recognized text string.
- `struct RecognizedText` - Text recognized in an image through a text recognition request.

### Instance Properties

- `var boundingRegion: NormalizedRegion` - The bounding region of the text. (Beta)
- `let isTitle: Bool` - Whether this text is the title of the document. (Beta)
- `let recognitionLanguages: [Locale.Language]` - The languages in which the recognized text was written. (Beta)
- `let shouldWrapToNextLine: Bool?` - Whether the text continues on the next line. (Beta)
- `let textDirection: RecognizedTextObservation.Direction?` - The direction in which the text is read. (Beta)
- `var transcript: String` - The top text candidate as a string. (Beta)

## VNRecognizedTextObservation

Class

# VNRecognizedTextObservation

A request that detects and recognizes regions of text in an image.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+macOS 10.15+tvOS 13.0+visionOS 1.0+

```swift
class VNRecognizedTextObservation
```

### Overview

This type of observation results from a VNRecognizeTextRequest. It contains information about both the location and content of text and glyphs that Vision recognized in the input image.

### Obtaining Recognized Text

- `func topCandidates(Int) -> [VNRecognizedText]` - Requests the n top candidates for a recognized text string.
- `class VNRecognizedText` - Text recognized in an image through a text recognition request.

## DocumentObservation (Beta)

Structure

# DocumentObservation

Information about the sections of content that an image-analysis request detects in a document.

iOS 26.0+Beta iPadOS 26.0+Beta Mac Catalyst 26.0+Beta macOS 26.0+Beta tvOS 26.0+Beta visionOS 26.0+Beta

```swift
struct DocumentObservation
```

### Overview

The observation allows you to access a document's content and group it within different sections. An observation is the result of using a RecognizeDocumentsRequest to process an image of a document and detects the content within that document using a container. Each container provides access to any text, lists, barcodes, or any other detected data that appears within the region of the container.

### Inspecting an observation

- `let uuid: UUID` - A unique alphanumeric value that the framework assigns to the observation.
- `let confidence: Float` - The level of confidence in the observation's accuracy.
- `let document: DocumentObservation.Container` - The contents of the document.
- `let timeRange: CMTimeRange?` - Time in a video frame where the observation was detected.

### Getting the recognized text

- `struct Container` - A region of content recognized in a document.

## Text Recognition and OCR

### Overview

Vision provides powerful text recognition capabilities through VNRecognizeTextRequest with two processing paths:

**Fast Path**:
- Uses character-detection to find individual characters
- Small ML model recognizes characters and words
- Similar to traditional OCR
- Better for real-time processing

**Accurate Path**:
- Neural network finds text as strings and lines
- Further analysis identifies words and sentences
- More aligned with human reading patterns
- Better for high-quality recognition

### Key Classes

- **RecognizeTextRequest**: Main request for text recognition
- **RecognizeDocumentsRequest**: Scans documents and provides structure information (Beta)
- **DetectTextRectanglesRequest**: Finds regions of visible text
- **DetectDocumentSegmentationRequest**: Detects rectangular regions containing text

### Language Support

- Supports 18 different languages
- Default bias toward English
- Chinese support (traditional zh-Hant and simplified zh-Hans)
- Language correction available with customWords support
- Call supportedRecognitionLanguages() to check language availability

### Usage Example

```swift
// Create request handler
let requestHandler = VNImageRequestHandler(cgImage: cgImage)

// Create text recognition request
let request = VNRecognizeTextRequest { request, error in
    guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
    
    // Process recognized text
    for observation in observations {
        if let recognizedText = observation.topCandidates(1).first {
            print(recognizedText.string)
            // Get bounding box if needed
            let boundingBox = observation.boundingBox
        }
    }
}

// Configure request
request.recognitionLevel = .accurate // or .fast
request.recognitionLanguages = ["en-US", "zh-Hans"]
request.usesLanguageCorrection = true

// Perform request
try requestHandler.perform([request])
```

## Document Analysis

### Document Detection and Segmentation

- **DetectDocumentSegmentationRequest**: Detects documents in images
- Returns four corner points of document quadrilateral
- Provides saliency masks for document regions
- Results in DetectedDocumentObservation

### Document Structure Recognition

- **RecognizeDocumentsRequest** (Beta): Analyzes document structure
- Extracts tables and formatted content
- Provides hierarchical document information
- Returns DocumentObservation with content sections

## Best Practices

### Performance Optimization

1. Choose appropriate processing path (fast vs accurate)
2. Limit recognition languages to needed ones
3. Use proper image orientation
4. Batch multiple requests when possible
5. Reuse request handlers for efficiency

### Error Handling

```swift
do {
    try requestHandler.perform([request])
} catch let error as NSError {
    if error.domain == VNErrorDomain {
        switch error.code {
        case VNError.requestCancelled.rawValue:
            // Handle cancellation
        case VNError.notImplemented.rawValue:
            // Feature not available
        default:
            // Other Vision errors
        }
    }
}
```

### Coordinate Systems

- Vision uses normalized coordinates (0.0 to 1.0)
- Origin depends on image format (use VNImagePointForNormalizedPoint)
- Convert to view coordinates for UI rendering

## Common Use Cases

### OCR and Text Extraction
- Document scanning
- Business card readers
- Receipt processing
- License plate recognition
- Accessibility features

### Document Intelligence
- Form processing
- Table extraction
- Document classification
- Signature detection
- Layout analysis

## Integration with Other Frameworks

### VisionKit
- Document scanner UI
- Data scanner UI
- Built-in capture flows

### AVFoundation
- Real-time video processing
- Camera integration
- Live preview overlays

### Core Image
- Pre-processing filters
- Image enhancement
- Format conversion

### Core ML
- Custom model integration
- Domain-specific recognition
- Transfer learning models

## Sample Code: Recognizing Text in Images

### Overview

One of Vision's many powerful features is its ability to detect and recognize multilanguage text in images. You can use this functionality in your own apps to handle both real-time and offline use cases. In all cases, all of Vision's processing happens on the user's device to enhance performance and user privacy.

Vision's text-recognition capabilities operate using one of these paths:

**Fast Path**: The fast path uses the framework's character-detection capabilities to find individual characters, and then uses a small machine learning model to recognize individual characters and words. This approach is similar to traditional optical character recognition (OCR).

**Accurate Path**: The accurate path uses a neural network to find text in terms of strings and lines, and then performs further analysis to find individual words and sentences. This approach is much more in line with how humans read text.

Using either path, you may optionally apply a language-correction phase based on Natural Language Processing (NLP) to minimize the potential for misreadings.

### Perform a Text-Recognition Request

Vision provides its text-recognition capabilities through VNRecognizeTextRequest, an image-based request type that finds and extracts text in images. The following example shows how to use VNImageRequestHandler to perform a VNRecognizeTextRequest for recognizing text in the specified CGImage.

```swift
// Get the CGImage on which to perform requests.
guard let cgImage = UIImage(named: "snapshot")?.cgImage else { return }

// Create a new image-request handler.
let requestHandler = VNImageRequestHandler(cgImage: cgImage)

// Create a new request to recognize text.
let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)

do {
    // Perform the text-recognition request.
    try requestHandler.perform([request])
} catch {
    print("Unable to perform the requests: \(error).")
}
```

### Process the Results

After the request handler processes the request, it calls the request's completion closure, passing it the request and any errors that occurred. Retrieve the observations by querying the request object for its results, which it returns as an array of VNRecognizedTextObservation objects. Each observation provides the recognized text string, along with a confidence score that indicates the confidence in the accuracy of the recognition.

```swift
func recognizeTextHandler(request: VNRequest, error: Error?) {
    guard let observations =
            request.results as? [VNRecognizedTextObservation] else {
        return
    }
    let recognizedStrings = observations.compactMap { observation in
        // Return the string of the top VNRecognizedText instance.
        return observation.topCandidates(1).first?.string
    }

    // Process the recognized strings.
    processResults(recognizedStrings)
}
```

If you'd like to render the bounding rectangles around recognized text in your user interface, you can also retrieve that information from the observation. The rectangles it provides are in normalized coordinates. To render them correctly in your user interface, convert CGRect instances from normalized coordinates to image coordinates by using the VNImageRectForNormalizedRect(_:_:_:) function as shown below.

```swift
let boundingRects: [CGRect] = observations.compactMap { observation in

    // Find the top observation.
    guard let candidate = observation.topCandidates(1).first else { return .zero }

    // Find the bounding-box observation for the string range.
    let stringRange = candidate.string.startIndex..<candidate.string.endIndex
    let boxObservation = try? candidate.boundingBox(for: stringRange)

    // Get the normalized CGRect value.
    let boundingBox = boxObservation?.boundingBox ?? .zero

    // Convert the rectangle from normalized coordinates to image coordinates.
    return VNImageRectForNormalizedRect(boundingBox,
                                        Int(image.size.width),
                                        Int(image.size.height))
}
```

The resulting bounding box differs depending on the path you choose. The fast path calculates the recognized text's bounding rectangle based on its individual characters. The accurate path tokenizes on whitespace, which means when working with Chinese text, the resulting bounding boxes will likely contain lines or line fragments instead of complete text.

### Optimize Language Settings

Your choice of fast or accurate path, along with your use of a particular API revision, determines the language support the text-recognition algorithms provide. To determine which languages a particular path and revision support, call the request's supportedRecognitionLanguages(for:revision:) class method.

If not otherwise specified, Vision biases its results toward English. To alter its default behavior, provide an array of supported languages in the request's recognitionLanguages property. The order in which you provide the languages dictates their relative importance. To recognize traditional and simplified Chinese, specify zh-Hant and zh-Hans as the first elements in the request's recognitionLanguages property. English is the only other language that you can pair with Chinese.

Enabling language correction on the request helps minimize common recognition errors. If the text you're recognizing uses domain-specific jargon, such as medical or technical terms, you can tailor the language correction's behavior by setting the request's customWords property. Language correction gives precedence to the custom words when performing its processing. The request ignores the customWords property if language correction isn't enabled.

## Sample Code: Locating and Displaying Recognized Text

This sample code project demonstrates the Vision framework's ability to perform optical character recognition (OCR) on an image you capture using your device's camera. The RecognizeTextRequest structure generates a collection of objects that extract and describe an image's textual content. These objects provide information like the text string, the confidence of the observation's accuracy, and the bounding box around the text's location.

### Customize the Request

The Vision framework provides the ability to customize the way it handles text recognition. Through its text-recognition path, the app demonstrates how to change whether the request prioritizes speed or accuracy. It also shows how to customize the languages the request detects, and whether the request applies a language-correction model during the recognition process.

```swift
func updateRequestSettings() {
    /// A Boolean value that indicates whether the system applies the language-correction model.
    imageOCR.request.usesLanguageCorrection = languageCorrection

    imageOCR.request.recognitionLanguages = [selectedLanguage]

    switch selectedRecognitionLevel {
    case "Fast":
        imageOCR.request.recognitionLevel = .fast
    default:
        imageOCR.request.recognitionLevel = .accurate
    }
}
```

### Perform the Request

```swift
@Observable
class OCR {
    /// The array of `RecognizedTextObservation` objects to hold the request's results.
    var observations = [RecognizedTextObservation]()

    /// The Vision request.
    var request = RecognizeTextRequest()

    func performOCR(imageData: Data) async throws {
        /// Clear the `observations` array for photo recapture.
        observations.removeAll()

        /// Perform the request on the image data and return the results.
        let results = try await request.perform(on: imageData)

        /// Add each observation to the `observations` array.
        for observation in results {
            observations.append(observation)
        }
    }
}
```

### Create and Display Bounding Boxes

This sample provides a custom implementation to display red bounding boxes where an observation occurs. An observation contains the location and the dimensions of the boundingBox in the form of a NormalizedRect. To create a bounding box, the app first converts the NormalizedRect to a CGRect, and then returns a Path to draw the rectangle.

```swift
struct Box: Shape {
    private let normalizedRect: NormalizedRect

    init(observation: any BoundingBoxProviding) {
        normalizedRect = observation.boundingBox
    }

    func path(in rect: CGRect) -> Path {
        let rect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(rect)
    }
}
```

To display the bounding boxes, the app uses the overlay(alignment:content:) method on the image, and creates a bounding box for each of the observations.

```swift
.overlay {
    ForEach(imageOCR.observations, id: \.uuid) { observation in
        Box(observation: observation)
            .stroke(.red, lineWidth: 1)
    }
}
```

### Access the Results

Finally, the app displays the extracted text from the image by iterating through the observations array. If the request doesn't recognize any text in the image, the app displays the "No text recognized" string.

```swift
/// Display the text from the captured image.
ForEach(imageOCR.observations, id: \.self) { observation in
    Text(observation.topCandidates(1).first?.string ?? "No text recognized")
        .textSelection(.enabled)
}
.foregroundStyle(.gray)
```