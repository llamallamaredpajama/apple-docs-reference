# Vision Framework

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

## Core Components

### Request-Based Architecture

Vision uses a request-based pattern where you:
1. Create a request for the type of analysis needed
2. Each request conforms to the VisionRequest protocol
3. Perform the request to get observation objects
4. Over 25 different request types available
5. Supports custom Core ML models

### Request Handlers

- **ImageRequestHandler**: Processes one or more image-analysis requests for a single image
- **TargetedImageRequestHandler**: Performs image-analysis requests on two images
- **SequenceRequestHandler**: Processes requests across a sequence of images
- **VideoProcessor**: Performs offline analysis of video content

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

## Face Detection and Analysis

### Face Detection

- **DetectFaceRectanglesRequest**: Finds faces in images
- Returns FaceObservation objects with bounding rectangles
- Multiple revision algorithms available

### Face Landmarks

- **DetectFaceLandmarksRequest**: Detects facial features
- Identifies eyes, nose, mouth, and other landmarks
- Returns detailed facial geometry

### Face Quality

- **DetectFaceCaptureQualityRequest**: Assesses face photo quality
- Returns floating-point quality score
- Useful for photo selection and capture guidance

## Image Recognition and Classification

### Image Classification

- **ClassifyImageRequest**: Categorizes images
- Returns ClassificationObservation with confidence scores
- Supports custom taxonomies via Core ML

### Object Detection

- **CoreMLRequest**: Uses Core ML models for custom detection
- Supports YOLO, CreateML, and custom models
- Returns various observation types based on model

### Animal Recognition

- **RecognizeAnimalsRequest**: Identifies animals in images
- **DetectAnimalBodyPoseRequest**: Detects animal body poses
- Returns animal-specific observations

## Visual Intelligence Integration

### Image Aesthetics

- **CalculateImageAestheticsScoresRequest**: Analyzes image quality
- Returns scores for visual appeal and memorability
- Useful for thumbnail generation and photo selection

### Saliency Analysis

- **GenerateAttentionBasedSaliencyImageRequest**: Creates attention heat maps
- **GenerateObjectnessBasedSaliencyImageRequest**: Identifies object regions
- Returns heat maps showing important image areas

### Image Feature Analysis

- **GenerateImageFeaturePrintRequest**: Creates image fingerprints
- Useful for similarity matching and duplicate detection
- Returns feature vectors for comparison

## Body and Hand Tracking

### Human Body Pose

- **DetectHumanBodyPoseRequest**: 2D body pose detection
- **DetectHumanBodyPose3DRequest**: 3D body pose relative to camera
- Returns joint positions with confidence scores

### Hand Tracking

- **DetectHumanHandPoseRequest**: Detects hand poses
- Tracks individual finger joints
- Enables gesture recognition and hand-based interactions

## Barcode and Shape Detection

### Barcode Detection

- **DetectBarcodesRequest**: Detects various barcode types
- Supports QR codes, Data Matrix, and many 1D formats
- Returns BarcodeObservation with decoded data

### Rectangle Detection

- **DetectRectanglesRequest**: Finds projected rectangles
- Useful for document and screen detection
- Returns RectangleObservation with corner points

## Image Processing and Analysis

### Image Alignment

- **TrackTranslationalImageRegistrationRequest**: Affine transform alignment
- **TrackHomographicImageRegistrationRequest**: Perspective warp alignment
- Used for image stabilization and panorama creation

### Optical Flow

- **TrackOpticalFlowRequest**: Tracks pixel movement between frames
- **GenerateOpticalFlowRequest**: Generates dense optical flow
- Useful for motion analysis and video effects

### Background Removal

- **GenerateForegroundInstanceMaskRequest**: Separates foreground objects
- **GeneratePersonSegmentationRequest**: Creates person mattes
- **GeneratePersonInstanceMaskRequest**: Individual person masks

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

### Face-Based Features
- Face unlock/authentication
- Photo organization
- Selfie enhancements
- Face filters and effects
- Emotion detection

### Document Intelligence
- Form processing
- Table extraction
- Document classification
- Signature detection
- Layout analysis

### Visual Search
- Product recognition
- Landmark identification
- Similar image finding
- Visual inventory
- Art recognition

### Accessibility
- Scene description
- Text-to-speech from images
- Object identification for blind users
- Navigation assistance
- Visual notifications

## Integration with Other Frameworks

### Core ML
- Custom model integration
- Domain-specific recognition
- Transfer learning models

### AVFoundation
- Real-time video processing
- Camera integration
- Live preview overlays

### Core Image
- Pre-processing filters
- Image enhancement
- Format conversion

### VisionKit
- Document scanner UI
- Data scanner UI
- Built-in capture flows

## Related Documentation

- [Recognizing Text in Images](https://developer.apple.com/documentation/vision/recognizing-text-in-images)
- [Locating and Displaying Recognized Text](https://developer.apple.com/documentation/vision/locating-and-displaying-recognized-text)
- [Understanding a Dice Roll with Vision and Object Detection](https://developer.apple.com/documentation/vision/understanding_a_dice_roll_with_vision_and_object_detection)
- [Analyzing a Selfie and Visualizing its Content](https://developer.apple.com/documentation/vision/analyzing-a-selfie-and-visualizing-its-content)
- [Recognizing Objects in Live Capture](https://developer.apple.com/documentation/vision/recognizing-objects-in-live-capture)
- [VisionKit Framework](https://developer.apple.com/documentation/visionkit)