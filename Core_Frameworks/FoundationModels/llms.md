# https://developer.apple.com/documentation/foundationmodels llms.txt

## Foundation Models Framework - Core Documentation

- [Foundation Models Framework](https://developer.apple.com/documentation/foundationmodels): Access Apple's on-device large language model that powers Apple Intelligence for intelligent tasks.
- [Generating Content and Performing Tasks](https://developer.apple.com/documentation/foundationmodels/generating-content-and-performing-tasks-with-foundation-models): Enhance your app by using generative models to create content or perform tasks.
- [Adding Intelligent App Features](https://developer.apple.com/documentation/foundationmodels/adding-intelligent-app-features-with-generative-models): Build robust apps with guided generation and tool calling.
- [Improving Safety from Model Output](https://developer.apple.com/documentation/foundationmodels/improving-safety-from-generative-model-output): Use feedback utilities to improve safety from generative model output.

## Core Types and Protocols
- [SystemLanguageModel](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel): The main entry point for accessing Apple's language model.
- [SystemLanguageModel.UseCase](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/usecase): Different use cases for the language model.
- [LanguageModelSession](https://developer.apple.com/documentation/foundationmodels/languagemodelsession): A session context for generating content with state maintenance.
- [Generable Protocol](https://developer.apple.com/documentation/foundationmodels/generable): A type that the model uses when responding to prompts.
- [Prompt](https://developer.apple.com/documentation/foundationmodels/prompt): Represents a prompt for the language model.
- [Instructions](https://developer.apple.com/documentation/foundationmodels/instructions): Provides instructions to guide model behavior.

## Generation and Response
- [Response Stream](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/responsestream): Stream responses from the language model.
- [Response Transcript Entries](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/response/transcriptentries): Access transcript entries from responses.
- [GenerationGuide](https://developer.apple.com/documentation/foundationmodels/generationguide): Guide the generation process with constraints.
- [GenerationError](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/generationerror): Errors that can occur during generation.
- [DynamicGenerationSchema](https://developer.apple.com/documentation/foundationmodels/dynamicgenerationschema): Dynamic schema for guided generation.

## Guided Generation
- [Generating Swift Data Structures](https://developer.apple.com/documentation/foundationmodels/generating-swift-data-structures-with-guided-generation): Generate type-safe Swift data structures.
- [Generation Guide Minimum](https://developer.apple.com/documentation/foundationmodels/generationguide/minimum(_:)): Set minimum constraints for generation.
- [Generation Guide Maximum Count](https://developer.apple.com/documentation/foundationmodels/generationguide/maximumcount(_:)): Set maximum count constraints.
- [Generation Guide Range](https://developer.apple.com/documentation/foundationmodels/generationguide/range(_:)): Set range constraints for generation.

## Tool Calling
- [Expanding Generation with Tool Calling](https://developer.apple.com/documentation/foundationmodels/expanding-generation-with-tool-calling): Enable the model to call functions and tools.
- [Tool Protocol](https://developer.apple.com/documentation/foundationmodels/tool): Define tools that the model can use.
- [Tool Name](https://developer.apple.com/documentation/foundationmodels/tool/name): Name property for tools.
- [Tool Description](https://developer.apple.com/documentation/foundationmodels/tool/description): Description property for tools.
- [Tool Schema in Instructions](https://developer.apple.com/documentation/foundationmodels/tool/includesschemaininstructions): Include tool schema in instructions.
- [Tool Output](https://developer.apple.com/documentation/foundationmodels/tooloutput/init(_:)): Initialize tool output.
- [Tool Call Error](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/toolcallerror): Errors related to tool calling.

## Session Management
- [Initialize Session](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/init(model:guardrails:tools:transcript:)): Initialize a language model session.
- [Initialize with Instructions](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/init(model:guardrails:tools:instructions:)): Initialize with custom instructions.
- [Prewarm Session](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/prewarm()): Prewarm the session for better performance.
- [Session Guardrails](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/guardrails): Safety guardrails for the session.
- [Session Transcript](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/transcript): Access the session transcript.

## Response Methods
- [Respond to Prompt](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/respond(options:isolation:prompt:)): Generate a response to a prompt.
- [Respond with Schema](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/respond(to:schema:includeschemainprompt:options:isolation:)): Respond with a specific schema.
- [Stream Response](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/streamresponse(options:prompt:)): Stream responses for real-time output.
- [Stream with Schema](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/streamresponse(to:schema:includeschemainprompt:options:)): Stream with schema constraints.

## Prompt Building
- [PromptBuilder](https://developer.apple.com/documentation/foundationmodels/promptbuilder): Build complex prompts programmatically.
- [Build Expression](https://developer.apple.com/documentation/foundationmodels/promptbuilder/buildexpression(_:)): Build prompt expressions.
- [Build Optional](https://developer.apple.com/documentation/foundationmodels/promptbuilder/buildoptional(_:)): Build optional prompt components.
- [Build Block](https://developer.apple.com/documentation/foundationmodels/promptbuilder/buildblock(_:)): Build prompt blocks.

## Data Conversion
- [ConvertibleFromGeneratedContent](https://developer.apple.com/documentation/foundationmodels/convertiblefromgeneratedcontent): Convert from generated content.
- [Initialize from Generated Content](https://developer.apple.com/documentation/foundationmodels/convertiblefromgeneratedcontent/init(_:)): Initialize types from generated content.

## Feedback and Safety
- [LanguageModelFeedbackAttachment](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedbackattachment): Attach feedback for model improvement.
- [Transcript](https://developer.apple.com/documentation/foundationmodels/transcript): Access conversation transcripts.
- [Transcript Entry Tool Calls](https://developer.apple.com/documentation/foundationmodels/transcript/entry/toolcalls(_:)): Tool calls in transcript entries.

## Sample Code
- [Generate Dynamic Game Content](https://developer.apple.com/documentation/FoundationModels/generate-dynamic-game-content-with-guided-generation-and-tools): Make gameplay more lively with AI generated dialog and encounters.
- [Generable Description](https://developer.apple.com/documentation/foundationmodels/generable(description:)): Add descriptions to generable types.