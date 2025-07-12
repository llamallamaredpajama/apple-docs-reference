# Core ML Documentation

> CoreML framework for machine learning model integration on Apple platforms
> https://developer.apple.com/documentation/coreml

## Overview

Core ML provides a unified representation for all machine learning models, enabling on-device inference with optimized performance across CPU, GPU, and Neural Engine. The framework supports model loading, prediction, and on-device training while minimizing memory footprint and power consumption.

## Key Features

- On-device machine learning inference
- Neural Engine optimization
- Multi-threaded CPU and GPU acceleration
- Model encryption and compression
- Dynamic model loading
- On-device model personalization
- Batch predictions
- Stateful models support

## Neural Engine Optimization

### Compute Units Configuration

CoreML supports multiple compute unit configurations for optimal performance:

- `MLComputeUnits.all` - Uses all available compute units including Neural Engine (recommended)
- `MLComputeUnits.cpuOnly` - Restricts to CPU only (for background tasks)
- `MLComputeUnits.cpuAndGPU` - Uses CPU and GPU but not Neural Engine
- `MLComputeUnits.cpuAndNeuralEngine` - Uses CPU and Neural Engine but not GPU

### Neural Engine Device

The `MLNeuralEngineComputeDevice` class represents the Neural Engine:
- Query total core count with `totalCoreCount` property
- Automatically utilized when using `MLComputeUnits.all`
- Optimized for matrix operations and convolutions

### M4 Chip Integration

While specific M4 documentation is not yet available, CoreML automatically optimizes for the latest Apple Silicon:
- Enhanced 16-core Neural Engine on M4
- Improved memory bandwidth for larger models
- Advanced compute scheduling across heterogeneous cores
- Dynamic workload distribution

## Model Loading and Configuration

### Basic Model Loading

```swift
// Synchronous loading
let model = try MLModel(contentsOf: modelURL)

// Asynchronous loading (recommended)
let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)

// With completion handler
MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
    switch result {
    case .success(let model):
        // Use model
    case .failure(let error):
        // Handle error
    }
}
```

### Model Configuration

```swift
let configuration = MLModelConfiguration()

// Set compute units
configuration.computeUnits = .all // Use Neural Engine when available

// Enable low precision for GPU
configuration.allowLowPrecisionAccumulationOnGPU = true

// Set preferred Metal device for GPU operations
configuration.preferredMetalDevice = MTLCreateSystemDefaultDevice()

// Set custom parameters
configuration.parameters = [
    MLParameterKey.numberOfNeighbors: 5
]

// Set model display name
configuration.modelDisplayName = "My Custom Model"
```

## Performance Optimization

### Compute Plan Analysis

Analyze model execution before running predictions:

```swift
// Load compute plan
let computePlan = try await MLComputePlan.load(contentsOf: modelURL, configuration: configuration)

// Analyze operations
if case let .program(program) = computePlan.modelStructure,
   let mainFunction = program.functions["main"] {
    
    for operation in mainFunction.block.operations {
        // Get device usage
        let deviceUsage = computePlan.deviceUsage(for: operation)
        
        // Get estimated cost
        let cost = computePlan.estimatedCost(of: operation)
    }
}
```

### Specialization Strategy

Optimize models for specific use cases:

```swift
// For fastest prediction (iOS 18+)
configuration.optimizationHints = .fastPrediction

// Default balanced strategy
configuration.optimizationHints = .default
```

### Batch Predictions

Process multiple inputs efficiently:

```swift
// Create batch provider
let batchProvider = MLArrayBatchProvider(array: featureProviders)

// Run batch prediction
let results = try model.predictions(from: batchProvider, options: predictionOptions)
```

## Memory and Power Optimization

### Model Compilation

Compile models for optimal device performance:

```swift
// Compile model asynchronously
let compiledURL = try await MLModel.compileModel(at: modelURL)

// Load compiled model
let model = try MLModel(contentsOf: compiledURL)
```

### Prediction Options

```swift
let options = MLPredictionOptions()

// Use specific compute units for this prediction
options.computeUnits = .cpuAndNeuralEngine

// Set output backing mode for memory efficiency
options.outputBackingMode = .eager
```

## Advanced Features

### Stateful Models

Support for models with internal state:

```swift
// Create state
let state = model.makeState()

// Run stateful prediction
let output = try model.prediction(from: input, using: state)
```

### Model Structure Inspection

```swift
// Get model description
let description = model.modelDescription

// Input features
for (name, feature) in description.inputDescriptionsByName {
    print("Input: \(name), Type: \(feature.type)")
}

// Output features  
for (name, feature) in description.outputDescriptionsByName {
    print("Output: \(name), Type: \(feature.type)")
}

// Metadata
let metadata = description.metadata
```

### Custom Models and Layers

Extend models with custom implementations:

```swift
// Custom model protocol
protocol MLCustomModel {
    func prediction(from input: MLFeatureProvider) throws -> MLFeatureProvider
}

// Custom layer protocol
protocol MLCustomLayer {
    func evaluate(inputs: [MLMultiArray], parameters: [String: Any]) throws -> [MLMultiArray]
}
```

## Model Formats and Types

### Supported Model Types

- Neural Networks (`.mlmodel`)
- ML Programs (`.mlpackage`)
- Tree Ensembles
- Support Vector Machines
- Generalized Linear Models
- Pipeline Models

### Multi-Array Operations

Efficient tensor operations:

```swift
// Create multi-array
let multiArray = try MLMultiArray(shape: [3, 224, 224], dataType: .float32)

// Access data
let dataPointer = multiArray.dataPointer
let count = multiArray.count

// Shaped array access
let shapedArray = MLShapedArray<Float>(multiArray)
```

## Best Practices

### Model Loading
- Use asynchronous loading for better app responsiveness
- Cache compiled models to avoid recompilation
- Load models on background queues

### Compute Unit Selection
- Use `.all` for best performance in most cases
- Use `.cpuOnly` for background tasks to preserve battery
- Test different configurations for your specific use case

### Memory Management
- Release models when not in use
- Use batch predictions for multiple inputs
- Consider model quantization for smaller memory footprint

### Performance Monitoring
- Use Instruments to profile Neural Engine usage
- Monitor thermal state during intensive operations
- Implement adaptive quality based on device capabilities

## Platform Requirements

- iOS 11.0+ (Neural Engine support varies by device)
- macOS 10.13+
- tvOS 11.0+
- watchOS 4.0+
- Mac Catalyst 13.0+

## Related Frameworks

- Vision - Image analysis with CoreML models
- Natural Language - Text processing with CoreML
- Speech - Audio to text conversion
- Sound Analysis - Audio classification
- Create ML - Model training framework
- Metal Performance Shaders - Low-level GPU acceleration

## Resources

- [Core ML Models](https://developer.apple.com/machine-learning/models/)
- [Core ML Tools](https://coremltools.readme.io/)
- [Create ML](https://developer.apple.com/documentation/createml)
- [WWDC Sessions](https://developer.apple.com/videos/frameworks/core-ml)

## Code Examples

### Simple Image Classification

```swift
import CoreML
import Vision

// Load model
guard let model = try? VNCoreMLModel(for: MyImageClassifier().model) else {
    fatalError("Failed to load model")
}

// Create request
let request = VNCoreMLRequest(model: model) { request, error in
    guard let results = request.results as? [VNClassificationObservation] else { return }
    
    // Process results
    if let topResult = results.first {
        print("Classification: \(topResult.identifier), Confidence: \(topResult.confidence)")
    }
}

// Configure for Neural Engine
request.preferBackgroundProcessing = false
request.usesCPUOnly = false
```

### Real-time Video Processing

```swift
// Configure for real-time performance
let configuration = MLModelConfiguration()
configuration.computeUnits = .all
configuration.allowLowPrecisionAccumulationOnGPU = true

// Load model with configuration
let model = try MLModel(contentsOf: modelURL, configuration: configuration)

// Process video frames
func processFrame(_ pixelBuffer: CVPixelBuffer) {
    let input = ModelInput(image: pixelBuffer)
    
    // Make prediction
    if let output = try? model.prediction(input: input) {
        // Process output
    }
}
```

## Notes

- Neural Engine availability depends on device hardware
- M-series Macs and A12+ iOS devices include Neural Engine
- Performance characteristics vary by model architecture
- Always profile on target devices for optimal configuration