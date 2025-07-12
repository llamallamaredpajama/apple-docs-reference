# Core ML Full Documentation

> Full content from the most essential CoreML documentation pages for machine learning on Apple devices

## Table of Contents

1. [Core ML Framework Overview](#core-ml-framework-overview)
2. [MLModel](#mlmodel)
3. [MLModelConfiguration](#mlmodelconfiguration)
4. [MLComputeUnits](#mlcomputeunits)
5. [MLFeatureProvider](#mlfeatureprovider)
6. [MLPredictionOptions](#mlpredictionoptions)
7. [MLMultiArray](#mlmultiarray)
8. [MLComputePlan](#mlcomputeplan)
9. [MLNeuralEngineComputeDevice](#mlneuralenginecomputedevice)
10. [MLState](#mlstate)
11. [Vision Framework Integration](#vision-framework-integration)
12. [Create ML Framework](#create-ml-framework)

---

## Core ML Framework Overview

### Framework: Core ML

Integrate machine learning models into your app.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.0+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+

### Overview

Use Core ML to integrate machine learning models into your app. Core ML provides a unified representation for all models. Your app uses Core ML APIs and user data to make predictions, and to train or fine-tune models, all on a person's device.

A model is the result of applying a machine learning algorithm to a set of training data. You use a model to make predictions based on new input data. Models can accomplish a wide variety of tasks that would be difficult or impractical to write in code. For example, you can train a model to categorize photos, or detect specific objects within a photo directly from its pixels.

You build and train a model with the Create ML app bundled with Xcode. Models trained using Create ML are in the Core ML model format and are ready to use in your app. Alternatively, you can use a wide variety of other machine learning libraries and then use Core ML Tools to convert the model into the Core ML format. Once a model is on a person's device, you can use Core ML to retrain or fine-tune it on-device, with that person's data.

Core ML optimizes on-device performance by leveraging the CPU, GPU, and Neural Engine while minimizing its memory footprint and power consumption. Running a model strictly on a person's device removes any need for a network connection, which helps keep a person's data private and your app responsive.

The framework is the foundation for domain-specific frameworks and functionality. It supports Vision for analyzing images, Natural Language for processing text, Speech for converting audio to text, and Sound Analysis for identifying sounds in audio. Core ML itself builds on top of low-level primitives like Accelerate and BNNS, as well as Metal Performance Shaders.

### Topics

#### Core ML models
- Getting a Core ML Model
- Updating a Model File to a Model Package
- Integrating a Core ML Model into Your App
- `class MLModel`
- Model Customization
- Model Personalization

#### Model inputs and outputs
- Making Predictions with a Sequence of Inputs
- `class MLFeatureValue`
- `struct MLSendableFeatureValue`
- `protocol MLFeatureProvider`
- `class MLDictionaryFeatureProvider`
- `protocol MLBatchProvider`
- `class MLArrayBatchProvider`
- `class MLModelAsset`

#### App integration
- Downloading and Compiling a Model on the User's Device
- Model Integration Samples

#### Model encryption
- Generating a Model Encryption Key
- Encrypting a Model in Your App

#### Compute devices
- `enum MLComputeDevice`
- `class MLCPUComputeDevice`
- `class MLGPUComputeDevice`
- `class MLNeuralEngineComputeDevice`
- `protocol MLComputeDeviceProtocol`

#### Compute plan
- `class MLComputePlan`
- `enum MLModelStructure`
- `struct MLComputePolicy`

#### Model state
- `class MLState`
- `class MLStateConstraint`

#### Model tensor
- `struct MLTensor`
- `protocol MLTensorScalar`
- `protocol MLTensorRangeExpression`

---

## MLModel

### Class: MLModel

An encapsulation of all the details of your machine learning model.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.1+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+

```swift
class MLModel
```

### Overview

`MLModel` encapsulates a model's prediction methods, configuration, and model description.

In most cases, you can use Core ML without accessing the `MLModel` class directly. Instead, use the programmer-friendly wrapper class that Xcode automatically generates when you add a model. If your app needs the `MLModel` interface, use the wrapper class's `model` property.

With the `MLModel` interface, you can:

- Make a prediction with your app's custom `MLFeatureProvider` by calling `prediction(from:)` or `prediction(from:options:)`
- Make multiple predictions with your app's custom `MLBatchProvider` by calling `predictions(fromBatch:)` or `predictions(from:options:)`
- Inspect your model's `metadata` and `MLFeatureDescription` instances through `modelDescription`

If your app downloads and compiles a model on the user's device, you must use the `MLModel` class directly to make predictions.

### Topics

#### Loading a Model
- `class func load(contentsOf: URL, configuration: MLModelConfiguration) async throws -> MLModel`
- `class func load(MLModelAsset, configuration: MLModelConfiguration, completionHandler: (MLModel?, (any Error)?) -> Void)`
- `class func load(contentsOf: URL, configuration: MLModelConfiguration, completionHandler: (Result<MLModel, any Error>) -> Void)`
- `convenience init(contentsOf: URL) throws`
- `convenience init(contentsOf: URL, configuration: MLModelConfiguration) throws`

#### Compiling a Model
- `class func compileModel(at: URL) async throws -> URL`
- `class func compileModel(at: URL, completionHandler: (Result<URL, any Error>) -> Void)`
- `class func compileModel(at: URL) throws -> URL` (Deprecated)

#### Making Predictions
- `func prediction(from: any MLFeatureProvider) throws -> any MLFeatureProvider`
- `func prediction(from: [String : MLTensor]) async throws -> [String : MLTensor]`
- `func prediction(from: any MLFeatureProvider, options: MLPredictionOptions) throws -> any MLFeatureProvider`
- `func prediction(from: any MLFeatureProvider, options: MLPredictionOptions) async throws -> any MLFeatureProvider`
- `func predictions(fromBatch: any MLBatchProvider) throws -> any MLBatchProvider`
- `func predictions(from: any MLBatchProvider, options: MLPredictionOptions) throws -> any MLBatchProvider`
- `func prediction(from: [String : MLTensor], using: MLState) async throws -> [String : MLTensor]`
- `func prediction(from: any MLFeatureProvider, using: MLState) throws -> any MLFeatureProvider`
- `func prediction(from: any MLFeatureProvider, using: MLState, options: MLPredictionOptions) async throws -> any MLFeatureProvider`
- `func prediction(from: any MLFeatureProvider, using: MLState, options: MLPredictionOptions) throws -> any MLFeatureProvider`

#### Inspecting a Model
- `static var availableComputeDevices: [MLComputeDevice]`
- `var configuration: MLModelConfiguration`
- `var modelDescription: MLModelDescription`
- `func parameterValue(for: MLParameterKey) throws -> Any`

#### Supporting Types
- `class MLModelConfiguration`
- `struct MLOptimizationHints`
- `class MLKey`

#### Instance Methods
- `func makeState() -> MLState`

---

## MLModelConfiguration

### Class: MLModelConfiguration

The settings for creating or updating a machine learning model.

iOS 12.0+iPadOS 12.0+Mac Catalyst 13.1+macOS 10.14+tvOS 12.0+visionOS 1.0+watchOS 5.0+

```swift
class MLModelConfiguration
```

### Overview

Use a model configuration to:

- Set or override model parameters
- Designate which device the model uses to make predictions, such as a GPU
- Restrict the model to use a specific computational device category, such as a CPU

You typically use a model configuration instance to configure an `MLModel` instance as you create it with `init(contentsOf:configuration:)` or create an `MLUpdateTask`.

Configure your model parameters by setting values for each relevant `MLParameterKey` in the `parameters` property.

### Topics

#### Configuring Model Parameters
- `var modelDisplayName: String?`
- `var parameters: [MLParameterKey : Any]?`
- `class MLParameterKey`

#### Configuring GPU Usage
- `var preferredMetalDevice: (any MTLDevice)?`
- `var allowLowPrecisionAccumulationOnGPU: Bool`

#### Allowing Access to Processing Units
- `var computeUnits: MLComputeUnits`
- `enum MLComputeUnits`

#### Instance Properties
- `var optimizationHints: MLOptimizationHints`
- `var functionName: String?`

---

## MLComputeUnits

### Enumeration: MLComputeUnits

The set of processing-unit configurations the model can use to make predictions.

iOS 12.0+iPadOS 12.0+Mac Catalyst 13.1+macOS 10.14+tvOS 12.0+visionOS 1.0+watchOS 5.0+

```swift
enum MLComputeUnits
```

### Overview

Use this enumeration to set or inspect the processing units you allow a model to use when it makes a prediction.

Use `all` to allow the OS to select the best processing unit to use (including the neural engine, if available).

Use `MLComputeUnits.cpuOnly` to restrict the model to the CPU, if your app might run in the background or runs other GPU intensive tasks.

### Topics

#### Processing Unit Configurations

- `case all`: The option you choose to allow the model to use all compute units available, including the neural engine.
- `case cpuOnly`: The option you choose to limit the model to only use the CPU.
- `case cpuAndGPU`: The option you choose to allow the model to use both the CPU and GPU, but not the neural engine.
- `case cpuAndNeuralEngine`: The option you choose to allow the model to use both the CPU and neural engine, but not the GPU.

---

## MLFeatureProvider

### Protocol: MLFeatureProvider

An interface that represents a collection of values for either a model's input or its output.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.1+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+

```swift
protocol MLFeatureProvider
```

### Overview

Use `MLFeatureProvider` to customize the way your app gets data to and from your model when the model's dynamically generated interface doesn't meet your app's needs.

Consider adopting this protocol in your data source if any of the following apply:

- Your data is collected asynchronously
- Using the autogenerated interface leads to copying excessive amounts of data
- Your data source is otherwise complicated

The interface is mainly an accessor for `MLFeatureValue` instances, making it straightforward to implement. Adopting this protocol allows you to integrate your data directly with `MLModel`, which means the model can query your data sources without constructing a separate input instance.

To customize your app's interaction with a model:

1. Adopt the `MLFeatureProvider` protocol in a class or structure so that the model can query it for input feature values via `featureValue(for:)`
2. Pass your app's `MLFeatureProvider` to your `MLModel` with `prediction(from:)` or `prediction(from:options:)`
3. Use the `MLFeatureProvider` returned from a `prediction(from:)` method to get the output feature values for that prediction

### Topics

#### Accessing Values
- `func featureValue(for: String) -> MLFeatureValue?` (Required): Accesses the feature value given the feature's name.
- `var featureNames: Set<String>` (Required): The set of valid feature names.

---

## MLPredictionOptions

### Class: MLPredictionOptions

The options available when making a prediction.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.1+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+

```swift
class MLPredictionOptions
```

### Topics

#### Getting features
- `var outputBackings: [String : Any]`: A dictionary of feature names and client-allocated buffers.

#### Restricting computation to the CPU
- `var usesCPUOnly: Bool`: A Boolean value that indicates whether a prediction is computed using only the CPU. (Deprecated)

---

## MLMultiArray

### Class: MLMultiArray

A machine learning collection type that stores numeric values in an array with multiple dimensions.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.1+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+

```swift
class MLMultiArray
```

### Overview

A multidimensional array, or _multiarray_, is one of the underlying types of an `MLFeatureValue` that stores numeric values in multiple dimensions. All elements in an `MLMultiArray` instance are one of the same type, and one of the types that `MLMultiArrayDataType` defines:

- `MLMultiArrayDataType.int32`: 32-bit integer
- `MLMultiArrayDataType.float16`: 16-bit floating point number
- `MLMultiArrayDataType.float32`: 32-bit floating point number (also known as `float`)
- `float64`: 64-bit floating point number (also known as `double` in Swift)

Each dimension in a multiarray is typically significant or meaningful. For example, a model could have an input that accepts images as a multiarray of pixels with three dimensions, C x H x W. The first dimension, C, represents the number of color channels, and the second and third dimensions, H and W, represent the image's height and width, respectively. The number of dimensions and size of each dimension define the multiarray's _shape_.

The `shape` property is an integer array that has an element for each dimension in the multiarray. Each element in `shape` defines the size of the corresponding dimension.

### Topics

#### Creating a Multiarray
- `convenience init<C>(C) throws`: Creates a multiarray from a collection
- `init(shape: [NSNumber], dataType: MLMultiArrayDataType) throws`
- `init(dataPointer: UnsafeMutableRawPointer, shape: [NSNumber], dataType: MLMultiArrayDataType, strides: [NSNumber], deallocator: ((UnsafeMutableRawPointer) -> Void)?) throws`
- `convenience init(byConcatenatingMultiArrays: [MLMultiArray], alongAxis: Int, dataType: MLMultiArrayDataType)`
- `init(pixelBuffer: CVPixelBuffer, shape: [NSNumber])`

#### Inspecting a Multiarray
- `var count: Int`: The total number of elements in the multiarray
- `var dataType: MLMultiArrayDataType`: The underlying type of the multiarray
- `var shape: [NSNumber]`: The multiarray's multidimensional shape
- `var strides: [NSNumber]`: Number of memory locations that span the length of each dimension

#### Providing buffer access
- `func withUnsafeBufferPointer<S, R>(ofType: S.Type, (UnsafeBufferPointer<S>) throws -> R) rethrows -> R`
- `func withUnsafeBytes<R>((UnsafeRawBufferPointer) throws -> R) rethrows -> R`
- `func withUnsafeMutableBufferPointer<S, R>(ofType: S.Type, (UnsafeMutableBufferPointer<S>, [Int]) throws -> R) rethrows -> R`
- `func withUnsafeMutableBytes<R>((UnsafeMutableRawBufferPointer, [Int]) throws -> R) rethrows -> R`

#### Accessing a Multiarray's Elements
- `subscript(Int) -> NSNumber`: Accesses the multiarray by using a linear offset
- `subscript([NSNumber]) -> NSNumber`: Accesses the multiarray by using a number array
- `var pixelBuffer: CVPixelBuffer?`: A reference to the multiarray's underlying pixel buffer
- `var dataPointer: UnsafeMutableRawPointer` (Deprecated)

---

## MLComputePlan

### Class: MLComputePlan

A class representing the compute plan of a model.

iOS 17.4+iPadOS 17.4+Mac Catalyst 17.4+macOS 14.4+tvOS 17.4+visionOS 1.0+watchOS 10.4+

```swift
class MLComputePlan
```

### Overview

The application can use the compute plan to estimate the necessary cost and resources of the model before running the predictions.

```swift
// Load the compute plan of an ML Program model.
let computePlan = try await MLComputePlan.load(contentsOf: modelURL, configuration: configuration)
guard case let .program(program) = computePlan.modelStructure else {
   fatalError("Unexpected model type.")
}
// Get the main function.
guard let mainFunction = program.functions["main"] else {
   fatalError("Missing main function.")
}

let operations = mainFunction.block.operations
for operation in operations {
   // Get the compute device usage for the operation.
   let computeDeviceUsage = computePlan.deviceUsage(for: operation)
   // Get the estimated cost of executing the operation.
   let estimatedCost = computePlan.estimatedCost(of: operation)
}
```

### Topics

#### Instance Properties
- `let modelStructure: MLModelStructure`

#### Instance Methods
- `func deviceUsage(for: MLModelStructure.NeuralNetwork.Layer) -> MLComputePlan.DeviceUsage?`
- `func deviceUsage(for: MLModelStructure.Program.Operation) -> MLComputePlan.DeviceUsage?`
- `func estimatedCost(of: MLModelStructure.Program.Operation) -> MLComputePlan.Cost?`

#### Type Methods
- `static func load(asset: MLModelAsset, configuration: MLModelConfiguration) async throws -> MLComputePlan`
- `static func load(contentsOf: URL, configuration: MLModelConfiguration) async throws -> MLComputePlan`

#### Structures
- `struct Cost`
- `struct DeviceUsage`

---

## MLNeuralEngineComputeDevice

### Class: MLNeuralEngineComputeDevice

An object that represents a Neural Engine compute device.

iOS 17.0+iPadOS 17.0+Mac Catalyst 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+

```swift
class MLNeuralEngineComputeDevice
```

### Topics

#### Getting the Total Core Count
- `var totalCoreCount: Int`: The total number of cores in the Neural Engine.

### Relationships

Conforms To:
- `MLComputeDeviceProtocol`
- `Sendable`

---

## MLState

### Class: MLState

Handle to the state buffers.

iOS 18.0+iPadOS 18.0+Mac Catalyst 18.0+macOS 15.0+tvOS 18.0+visionOS 2.0+watchOS 11.0+

```swift
class MLState
```

### Overview

A stateful model maintains a state from one prediction to another by storing the information in the state buffers. To use such a model, the client must request the model to create state buffers and get `MLState` object, which is the handle to those buffers. Then, at the prediction time, pass the `MLState` object in one of the stateful prediction functions.

```swift
// Load a stateful model
let modelAsset = try MLModelAsset(url: modelURL)
let model = try await MLModel.load(asset: modelAsset, configuration: MLModelConfiguration())

// Request a state
let state = model.newState()

// Run predictions
for _ in 0 ..< 42 {
  _ = try await model.prediction(from: inputFeatures, using: state)
}

// Access the state buffer.
state.withMultiArray(for: "accumulator") { stateMultiArray in
  ...
}
```

The object is a handle to the state buffers. The client shall not read or write the buffers while a prediction is in-flight.

Each stateful prediction that uses the same `MLState` must be serialized. Otherwise, if two such predictions run concurrently, the behavior is undefined.

### Topics

#### Instance Methods
- `func withMultiArray<R>(for: String, (MLMultiArray) throws -> R) rethrows -> R`

---

## Vision Framework Integration

### Framework: Vision

Apply computer vision algorithms to perform a variety of tasks on input images and videos.

iOS 11.0+iPadOS 11.0+Mac Catalyst 13.0+macOS 10.13+tvOS 11.0+visionOS 1.0+

### Overview

The Vision framework combines machine learning technologies and Swift's concurrency features to perform computer vision tasks in your app. Use the Vision framework to analyze images for a variety of purposes:

- Tracking human and animal body poses or the trajectory of an object
- Recognizing text in 18 different languages
- Detecting faces and face landmarks, such as eyes, nose, and mouth
- Performing hand tracking to enable new device interactions
- Calculating an aesthetics score to determine how memorable a photo is

To begin using the framework, you create a request for the type of analysis you want to do. Each request conforms to the `VisionRequest` protocol. You then perform the request to get an observation object — or an array of observations — with the analysis details for the request. There are more than 25 requests available to choose from. Vision also allows the use of custom Core ML models for tasks like classification or object detection.

### Key Topics

#### Still-image analysis
- Classifying images for categorization and search
- `struct ClassifyImageRequest`
- `protocol ImageProcessingRequest`
- `class ImageRequestHandler`
- `protocol VisionRequest`
- `protocol VisionObservation`

#### Machine learning image analysis
- `struct CoreMLRequest`: An image-analysis request that uses a Core ML model to process images
- `struct CoreMLFeatureValueObservation`
- `struct ClassificationObservation`
- `struct PixelBufferObservation`

---

## Create ML Framework

### Framework: Create ML

Create machine learning models for use in your app.

iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 10.14+tvOS 16.0+visionOS 1.0+

### Overview

Use Create ML with familiar tools like Swift and macOS playgrounds to create and train custom machine learning models on your Mac. You can train models to perform tasks like recognizing images, extracting meaning from text, or finding relationships between numerical values.

You train a model to recognize patterns by showing it representative samples. For example, you can train a model to recognize dogs by showing it lots of images of different dogs. After you've trained the model, you test it out on data it hasn't seen before, and evaluate how well it performed the task. When the model is performing well enough, you're ready to integrate it into your app using Core ML.

Create ML leverages the machine learning infrastructure built in to Apple products like Photos and Siri. This means your image classification and natural language models are smaller and take much less time to train.

### Model Types

#### Image Models
- Creating an Image Classifier Model
- `struct MLImageClassifier`: A model you train to classify images
- `struct MLObjectDetector`: A model you train to classify one or more objects within an image
- `struct MLHandPoseClassifier`: A task that creates a hand pose classification model

#### Video Models
- Creating an Action Classifier Model
- `struct MLActionClassifier`: A model you train with videos to classify a person's body movements
- `struct MLHandActionClassifier`: A task that creates a hand action classification model
- `struct MLStyleTransfer`: A model you train to apply an image's style to other images or videos

#### Text Models
- Creating a text classifier model
- `struct MLTextClassifier`: A model you train to classify natural language text
- `struct MLWordTagger`: A word-tagging model you train to classify natural language text at the word level
- `struct MLGazetteer`: A collection of terms and their labels
- `struct MLWordEmbedding`: A map of strings in a vector space

#### Sound Models
- `struct MLSoundClassifier`: A machine learning model you train with audio files to recognize and identify sounds

#### Motion Models
- `struct MLActivityClassifier`: A model you train to classify motion sensor data

#### Tabular Models
- Creating a Model from Tabular Data
- `enum MLClassifier`: A model you train to classify data into discrete categories
- `enum MLRegressor`: A model you train to estimate continuous values
- `struct MLRecommender`: A model you train to make recommendations based on item similarity

### Model Training and Evaluation

#### Model Accuracy
- Improving Your Model's Accuracy
- `struct MLClassifierMetrics`
- `struct MLRegressorMetrics`
- `struct MLWordTaggerMetrics`
- `struct MLRecommenderMetrics`
- `struct MLObjectDetectorMetrics`

#### Model Training Control
- `class MLJob`: The representation of a model's asynchronous training session
- `class MLTrainingSession`: The current state of a model's asynchronous training session
- `struct MLTrainingSessionParameters`: The configuration settings for a training session
- `struct MLCheckpoint`: The state of a model's asynchronous training session at a specific point in time

---

## Summary

This comprehensive documentation covers the essential CoreML components for machine learning on Apple devices:

1. **Core ML Framework**: The foundation for on-device machine learning with optimized performance across CPU, GPU, and Neural Engine
2. **MLModel**: The core class for loading and using machine learning models
3. **MLModelConfiguration**: Configuration settings for models including compute unit selection
4. **MLComputeUnits**: Control over which processing units (CPU, GPU, Neural Engine) the model uses
5. **MLFeatureProvider**: Protocol for custom data input/output handling
6. **MLPredictionOptions**: Options for making predictions
7. **MLMultiArray**: Multi-dimensional array for numeric data
8. **MLComputePlan**: Analyze model execution and resource usage
9. **MLNeuralEngineComputeDevice**: Access to Neural Engine properties
10. **MLState**: Support for stateful models that maintain state between predictions
11. **Vision Framework**: Integration with computer vision tasks
12. **Create ML**: Tools for creating and training custom models

The Neural Engine optimization features are particularly important for M4 and other Apple Silicon devices, providing hardware acceleration for machine learning workloads with automatic optimization when using `MLComputeUnits.all`.