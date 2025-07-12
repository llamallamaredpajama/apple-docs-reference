# Foundation Models Framework - Comprehensive Documentation

> Apple's on-device large language model framework powering Apple Intelligence
> https://developer.apple.com/documentation/foundationmodels

## Framework Overview

The Foundation Models framework provides access to Apple's on-device large language models that power Apple Intelligence features across iOS, iPadOS, macOS, tvOS, watchOS, and visionOS. This framework enables developers to integrate advanced AI capabilities directly into their apps while maintaining user privacy through on-device processing.

### Key Capabilities

- **On-Device Processing**: All model inference happens on-device, ensuring user privacy and eliminating network latency
- **Apple Intelligence Integration**: Direct access to the same models powering Apple's system-wide AI features
- **Type-Safe Generation**: Use Swift's type system with `@Generable` macro for structured output
- **Streaming Responses**: Real-time content generation with AsyncSequence support
- **Tool Calling**: Extend model capabilities by allowing it to call your app's functions
- **Guided Generation**: Constrain outputs to specific formats and schemas
- **Multi-Modal Support**: Process text, generate structured data, and integrate with other Apple frameworks

### Platform Requirements

- iOS 18.0+ (Enhanced features in iOS 26.0+)
- iPadOS 18.0+ (Enhanced features in iPadOS 26.0+)
- macOS 15.0+ (Enhanced features in macOS 16.0+)
- Mac Catalyst 18.0+
- tvOS 18.0+
- watchOS 11.0+
- visionOS 2.0+
- Xcode 16.0+

### Hardware Requirements

- Apple Silicon Macs (M1 or later)
- iPhone 15 Pro or later (A17 Pro chip)
- iPad with M1 chip or later
- Optimized for Neural Engine and M4 chip capabilities

## Core Architecture

### SystemLanguageModel

The main entry point for accessing Apple's language models:

```swift
import FoundationModels

// Access the system language model
let model = SystemLanguageModel.shared

// Create a session for interaction
let session = LanguageModelSession(
    model: model,
    guardrails: .default,
    tools: [],
    instructions: Instructions("You are a helpful assistant.")
)
```

### Use Cases

The framework supports multiple predefined use cases optimized for different scenarios:

- `.general`: General-purpose language tasks
- `.code`: Code generation and analysis
- `.creative`: Creative writing and content generation
- `.analytical`: Data analysis and structured reasoning
- `.conversational`: Natural dialogue and chat
- `.summarization`: Content summarization
- `.translation`: Language translation

## Generable Protocol and Macro

The `@Generable` macro is a powerful feature that enables type-safe generation of Swift data structures:

```swift
@Generable
struct Recipe {
    let name: String
    let ingredients: [Ingredient]
    let instructions: [String]
    let prepTime: Int
    let difficulty: Difficulty
    
    @Generable
    struct Ingredient {
        let name: String
        let amount: String
        let unit: String
    }
    
    @Generable
    enum Difficulty: String, CaseIterable {
        case easy, medium, hard
    }
}

// Generate structured data
let recipe: Recipe = try await session.respond(
    to: "Create a recipe for chocolate chip cookies",
    as: Recipe.self
)
```

### How @Generable Works

1. **Automatic Schema Generation**: The macro generates JSON Schema from your Swift types
2. **Validation**: Ensures generated content matches your type constraints
3. **Type Safety**: Compile-time guarantees for generated content structure
4. **Nested Support**: Works with nested types, arrays, and enums
5. **Custom Constraints**: Add validation rules through property wrappers

## Session Management

### Creating Sessions

```swift
// Basic session
let session = LanguageModelSession(model: .shared)

// Session with custom configuration
let session = LanguageModelSession(
    model: .shared,
    guardrails: Guardrails(
        maxTokens: 2000,
        temperature: 0.7,
        topP: 0.95
    ),
    tools: [weatherTool, calculatorTool],
    instructions: Instructions("""
        You are an expert iOS developer familiar with SwiftUI and UIKit.
        Provide clear, concise code examples.
        """)
)

// Prewarm for better performance
await session.prewarm()
```

### Session Lifecycle

- Sessions maintain conversation context
- Transcript persists between interactions
- Sessions can be serialized for persistence
- Memory management handled automatically

## Generating Content

### Basic Generation

```swift
// Simple text generation
let response = try await session.respond(to: "Explain SwiftUI property wrappers")

// Access the generated text
print(response.text)

// Access token usage
print("Tokens used: \(response.usage.totalTokens)")
```

### Streaming Responses

```swift
// Stream responses for real-time output
for try await partial in session.streamResponse(to: prompt) {
    print(partial.text, terminator: "")
}
```

### Guided Generation

```swift
// Generate with constraints
let guide = GenerationGuide()
    .minimum(100)  // Minimum tokens
    .maximum(500)  // Maximum tokens
    .temperature(0.8)
    .topP(0.9)

let response = try await session.respond(
    options: guide,
    to: "Write a haiku about Swift programming"
)
```

## Tool Calling

Enable the model to call functions and extend its capabilities:

```swift
// Define a tool
struct WeatherTool: Tool {
    static let name = "get_weather"
    static let description = "Get current weather for a location"
    
    @Generable
    struct Input {
        let location: String
        let units: TemperatureUnit
        
        enum TemperatureUnit: String, CaseIterable {
            case celsius, fahrenheit
        }
    }
    
    func execute(input: Input) async throws -> ToolOutput {
        // Implement weather API call
        let weather = try await weatherAPI.getWeather(
            location: input.location,
            units: input.units
        )
        
        return ToolOutput(weather.description)
    }
}

// Create session with tools
let session = LanguageModelSession(
    model: .shared,
    tools: [WeatherTool()]
)

// Model can now call the weather tool
let response = try await session.respond(
    to: "What's the weather like in San Francisco?"
)
```

### Tool Execution Flow

1. Model identifies need for tool
2. Generates structured tool input
3. Framework validates input against schema
4. Tool executes with typed input
5. Output incorporated into response

## Advanced Features

### Dynamic Schema Generation

```swift
// Create schemas at runtime
let schema = DynamicGenerationSchema(
    type: .object,
    properties: [
        "name": .string(minLength: 1, maxLength: 100),
        "age": .integer(minimum: 0, maximum: 150),
        "tags": .array(of: .string(), minItems: 1, maxItems: 10)
    ],
    required: ["name", "age"]
)

let result = try await session.respond(
    to: "Generate a user profile",
    schema: schema
)
```

### Prompt Building

```swift
@PromptBuilder
func buildPrompt(context: String, question: String) -> Prompt {
    "Given the following context:"
    context
    
    "Please answer this question:"
    question
    
    if let examples = getRelevantExamples() {
        "Here are some examples:"
        for example in examples {
            "- \(example)"
        }
    }
}
```

### Feedback and Safety

```swift
// Attach feedback for model improvement
let feedback = LanguageModelFeedbackAttachment(
    transcript: session.transcript,
    rating: .positive,
    comment: "Accurate and helpful response"
)

// Submit feedback
try await model.submitFeedback(feedback)

// Safety guardrails
let guardrails = Guardrails(
    contentFilter: .strict,
    personalInfoFilter: .enabled,
    maxRepetitions: 3
)
```

## Integration with Apple Frameworks

### Core ML Integration

Foundation Models works seamlessly with Core ML for enhanced capabilities:

```swift
import CoreML
import FoundationModels

// Use Core ML models as tools
struct ImageClassifierTool: Tool {
    let mlModel: MLModel
    
    func execute(imageData: Data) async throws -> ToolOutput {
        let prediction = try mlModel.prediction(from: imageData)
        return ToolOutput(prediction.label)
    }
}
```

### Vision Framework

Combine with Vision for multi-modal understanding:

```swift
import Vision
import FoundationModels

// Analyze image and generate description
let imageAnalysis = try await analyzeImage(image)
let description = try await session.respond(
    to: "Describe this image analysis: \(imageAnalysis)"
)
```

### Natural Language Framework

Enhanced language understanding:

```swift
import NaturalLanguage
import FoundationModels

// Extract entities and generate responses
let entities = extractEntities(from: text)
let response = try await session.respond(
    to: "Summarize information about these entities: \(entities)"
)
```

## Performance Optimization

### Neural Engine Utilization

- Models automatically leverage Neural Engine when available
- Optimized for Apple Silicon and A17 Pro+ chips
- Efficient memory management for large contexts

### Best Practices

1. **Prewarm Sessions**: Call `prewarm()` before first use
2. **Reuse Sessions**: Maintain session context for related queries
3. **Batch Processing**: Use array inputs when possible
4. **Stream for UX**: Use streaming for better perceived performance
5. **Cache Results**: Store generated content when appropriate

## Error Handling

```swift
do {
    let response = try await session.respond(to: prompt)
} catch let error as LanguageModelSession.GenerationError {
    switch error {
    case .modelUnavailable:
        // Handle model not available
    case .invalidInput:
        // Handle invalid input
    case .quotaExceeded:
        // Handle quota limits
    case .timeout:
        // Handle timeout
    }
} catch let error as LanguageModelSession.ToolCallError {
    switch error {
    case .toolNotFound:
        // Handle missing tool
    case .invalidToolInput:
        // Handle invalid tool input
    case .toolExecutionFailed:
        // Handle tool failure
    }
}
```

## Privacy and Security

### On-Device Processing

- All inference happens on-device
- No user data sent to servers
- Models stored encrypted on device
- Automatic model updates respect user privacy

### App Privacy

```swift
// Configure privacy settings
let privacyConfig = PrivacyConfiguration(
    allowPersonalization: false,
    allowTelemetry: false,
    dataRetention: .none
)

let model = SystemLanguageModel(privacy: privacyConfig)
```

## Future Enhancements (iOS 26+)

### Expected Features

- **Multi-Modal Models**: Native image and audio understanding
- **Larger Context Windows**: Extended conversation memory
- **Custom Model Fine-Tuning**: On-device model adaptation
- **Enhanced Tool Ecosystem**: System-wide tool sharing
- **Real-Time Collaboration**: Multi-user session support
- **Advanced Reasoning**: Chain-of-thought and planning capabilities

### M4 Chip Optimizations

- Dedicated AI compute units
- Faster token generation
- Larger model support
- Reduced power consumption

## Sample Applications

### Dynamic Game Content Generation

```swift
@Generable
struct GameEncounter {
    let description: String
    let characters: [Character]
    let dialogue: [DialogueLine]
    let choices: [PlayerChoice]
    
    @Generable
    struct Character {
        let name: String
        let role: String
        let personality: [String]
    }
    
    @Generable
    struct DialogueLine {
        let speaker: String
        let text: String
        let emotion: String
    }
    
    @Generable
    struct PlayerChoice {
        let text: String
        let consequence: String
    }
}

// Generate dynamic encounters
let encounter = try await session.respond(
    to: "Create a mysterious encounter in a dark forest with a traveling merchant",
    as: GameEncounter.self
)
```

### Intelligent Code Assistant

```swift
// Code generation with context
let codeSession = LanguageModelSession(
    model: .shared,
    useCase: .code,
    instructions: Instructions("""
        You are an expert Swift developer.
        Follow Apple's Swift style guidelines.
        Use modern Swift features and best practices.
        """)
)

let code = try await codeSession.respond(
    to: "Create a SwiftUI view for a custom slider with haptic feedback"
)
```

## Migration Guide

### From Other LLM Frameworks

```swift
// OpenAI-style to Foundation Models
// Before:
let completion = try await openai.completions.create(
    model: "gpt-4",
    prompt: prompt,
    max_tokens: 100
)

// After:
let response = try await session.respond(
    options: GenerationGuide().maximum(100),
    to: prompt
)
```

### From Core ML Models

```swift
// Enhance Core ML with language understanding
// Before:
let mlPrediction = try mlModel.prediction(input: features)

// After:
let enhancedResult = try await session.respond(
    to: "Explain this prediction: \(mlPrediction)",
    tools: [CoreMLTool(model: mlModel)]
)
```

## Troubleshooting

### Common Issues

1. **Model Not Available**
   - Ensure device meets hardware requirements
   - Check for sufficient storage space
   - Verify iOS version compatibility

2. **Slow Generation**
   - Use `prewarm()` before first request
   - Check for background app refresh settings
   - Consider using streaming for better UX

3. **Memory Warnings**
   - Limit context size
   - Clear session transcript periodically
   - Use smaller batch sizes

## Resources

- [Foundation Models Programming Guide](https://developer.apple.com/documentation/foundationmodels/programming-guide)
- [WWDC Sessions on Apple Intelligence](https://developer.apple.com/videos/frameworks/foundation-models)
- [Sample Code Gallery](https://developer.apple.com/documentation/foundationmodels/sample-code)
- [Human Interface Guidelines for AI](https://developer.apple.com/design/human-interface-guidelines/apple-intelligence)

## Related Frameworks

- [Core ML](https://developer.apple.com/documentation/coreml): Machine learning model deployment
- [Create ML](https://developer.apple.com/documentation/createml): On-device model training
- [Natural Language](https://developer.apple.com/documentation/naturallanguage): Language analysis
- [Speech](https://developer.apple.com/documentation/speech): Speech recognition
- [Vision](https://developer.apple.com/documentation/vision): Computer vision tasks

---

Note: This documentation represents expected capabilities based on current Apple framework patterns and the Foundation Models framework structure. Actual implementation details may vary upon official release.