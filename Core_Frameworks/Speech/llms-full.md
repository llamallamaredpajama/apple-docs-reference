# Speech Framework - Full Documentation

## Overview

The Speech framework enables apps to perform speech recognition on live or prerecorded audio. It provides sophisticated speech-to-text capabilities with support for multiple languages and customization options.

## Main Speech Framework Page
URL: https://developer.apple.com/documentation/speech

### Framework Overview
The Speech framework allows you to perform speech recognition on live or prerecorded audio, and receive transcriptions, alternative interpretations, and confidence levels of the results.

Use the Speech framework to recognize spoken words in recorded or live audio. The keyboard's dictation support uses speech recognition to translate audio content into text. This framework provides similar behavior, except that you can use it without the presence of the keyboard. For example, you might use speech recognition to recognize verbal commands or to handle text dictation in other parts of your app.

The framework provides a class, `SpeechAnalyzer`, and a number of modules that can be added to the analyzer to provide specific types of analysis and transcription. Many use cases only need a `SpeechTranscriber` module, which provides speech-to-text transcriptions.

The `SpeechAnalyzer` class is responsible for:
- Holding associated modules
- Accepting audio speech input
- Controlling the overall analysis

Each module is responsible for:
- Providing guidance on input that it can accept
- Providing its analysis or transcription output

The framework makes extensive use of Swift concurrency features. Where an Objective-C API might use a delegate to provide results, the Swift API's modules provide their results via an `AsyncSequence`. Similarly, you provide speech input to this API via an `AsyncSequence` created and populated by you.

### Performing Analysis Steps

To perform analysis on audio files and streams:

1. Create and configure the modules you want to use
2. Create the input sequence you will use to provide speakers' audio
3. Create and configure the analyzer with the modules and input sequence
4. Supply audio
5. Perform analysis
6. Act on results
7. Finish analysis when desired

```swift
import Speech

// Step 1: Modules
guard let locale = SpeechTranscriber.supportedLocale(equivalentTo: Locale.current) else {
    /* Note unsupported language */
}
let transcriber = SpeechTranscriber(locale: locale, preset: .offlineTranscription)

// Step 2: Input sequence
let (inputSequence, inputBuilder) = AsyncStream.makeStream(of: AnalyzerInput.self)

// Step 3: Analyzer
let audioFormat = await SpeechAnalyzer.bestAvailableAudioFormat(compatibleWith: [transcriber])
let analyzer = SpeechAnalyzer(inputSequence: inputSequence, modules: [transcriber])

// Step 4: Supply audio
Task {
    while /* audio remains */ {
        /* Get some audio */
        /* Convert to audioFormat */
        let pcmBuffer = /* an AVAudioPCMBuffer containing some converted audio */
        let input = AnalyzerInput(buffer: pcmBuffer)
        inputBuilder.yield(input)
    }
    inputBuilder.finish()
}

// Step 6: Act on results
Task {
    do {
        for try await result in transcriber.results {
            let bestTranscription = result.text // an AttributedString
            let plainTextBestTranscription = String(bestTranscription.characters) // a String
            print(plainTextBestTranscription)
        }
    } catch {
        /* Handle error */
    }
}

// Step 5: Perform analysis
let lastSampleTime = try await analyzer.analyzeSequence(inputSequence)

// Step 7: Finish analysis
if let lastSampleTime {
    try await analyzer.finalizeAndFinish(through: lastSampleTime)
} else {
    try analyzer.cancelAndFinishNow()
}
```

## SFSpeechRecognizer
URL: https://developer.apple.com/documentation/speech/sfspeechrecognizer

An object you use to check for the availability of the speech recognition service, and to initiate the speech recognition process.

### Overview
An `SFSpeechRecognizer` object is the central object for managing the speech recognizer process. Use this object to:
- Request authorization to use speech recognition services
- Specify the language to use during the recognition process
- Initiate new speech recognition tasks

### Setting Up Speech Recognition

Each speech recognizer supports only one language, which you specify at creation time. The successful creation of a speech recognizer does not guarantee that speech recognition services are available. For some languages, the recognizer might require an Internet connection. Use the `isAvailable` property to find out if speech recognition services are available for the current language.

To initiate the speech recognition process:

1. Request authorization to use speech recognition
2. Create an `SFSpeechRecognizer` object
3. Verify the availability of services using the `isAvailable` property
4. Prepare your audio content
5. Create a recognition request object—an object that descends from `SFSpeechRecognitionRequest`
6. Call the `recognitionTask(with:delegate:)` or `recognitionTask(with:resultHandler:)` method to begin the recognition process

The type of recognition request object you create depends on whether you are processing an existing audio file or an incoming stream of audio. For existing audio files, create a `SFSpeechURLRecognitionRequest` object. For audio streams, create a `SFSpeechAudioBufferRecognitionRequest` object.

### Best Practices for User Experience

- **Be prepared to handle failures caused by speech recognition limits.** Individual devices may be limited in the number of recognitions that can be performed per day, and each app may be throttled globally based on the number of requests it makes per day.
- **Plan for a one-minute limit on audio duration.** Speech recognition places a relatively high burden on battery life and network usage.
- **Remind the user when your app is recording.** Display a visual indicator and play sounds at the beginning and end of speech recognition.
- **Do not perform speech recognition on private or sensitive information.** Don't send passwords, health or financial data, and other sensitive speech for recognition.

## SFSpeechRecognitionRequest
URL: https://developer.apple.com/documentation/speech/sfspeechrecognitionrequest

An abstract class that represents a request to recognize speech from an audio source.

### Overview
Don't create `SFSpeechRecognitionRequest` objects directly. Create an `SFSpeechURLRecognitionRequest` or `SFSpeechAudioBufferRecognitionRequest` object instead. Use the properties of this class to configure various aspects of your request object before you start the speech recognition process.

### Key Properties

- `requiresOnDeviceRecognition`: A Boolean value that determines whether a request must keep its audio data on the device
- `shouldReportPartialResults`: A Boolean value that indicates whether you want intermediate results returned for each utterance
- `contextualStrings`: An array of phrases that should be recognized, even if they are not in the system vocabulary
- `taskHint`: A value that indicates the type of speech recognition being performed
- `addsPunctuation`: A Boolean value that indicates whether to add punctuation to speech recognition results

## SFSpeechAudioBufferRecognitionRequest
URL: https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest

A request to recognize speech from captured audio content, such as audio from the device's microphone.

### Overview
Use an `SFSpeechAudioBufferRecognitionRequest` object to perform speech recognition on live audio, or on a set of existing audio buffers. For example, use this request object to route audio from a device's microphone to the speech recognizer.

The request object contains no audio initially. As you capture audio, call `append(_:)` or `appendAudioSampleBuffer(_:)` to add audio samples to the request object. The speech recognizer continuously analyzes the audio you appended, stopping only when you call the `endAudio()` method. You must call `endAudio()` explicitly to stop the speech recognition process.

### Key Methods

- `append(AVAudioPCMBuffer)`: Appends audio in the PCM format to the end of the recognition request
- `appendAudioSampleBuffer(CMSampleBuffer)`: Appends audio to the end of the recognition request
- `endAudio()`: Marks the end of audio input for the recognition request

### Properties

- `nativeAudioFormat`: The preferred audio format for optimal speech recognition

## SFSpeechRecognitionTask
URL: https://developer.apple.com/documentation/speech/sfspeechrecognitiontask

A task object for monitoring the speech recognition progress.

### Overview
Use an `SFSpeechRecognitionTask` object to determine the state of a speech recognition task, to cancel an ongoing task, or to signal the end of the task.

You don't create speech recognition task objects directly. Instead, you receive one of these objects after calling `recognitionTask(with:resultHandler:)` or `recognitionTask(with:delegate:)` on your `SFSpeechRecognizer` object.

### Key Methods

- `cancel()`: Cancels the current speech recognition task
- `finish()`: Stops accepting new audio and finishes processing on the audio input that has already been accepted

### Properties

- `isCancelled`: A Boolean value that indicates whether the speech recognition task was canceled
- `isFinishing`: A Boolean value that indicates whether audio input has stopped
- `state`: The current state of the speech recognition task
- `error`: An error object that specifies the error that occurred during a speech recognition task

## Recognizing Speech in Live Audio
URL: https://developer.apple.com/documentation/speech/recognizing-speech-in-live-audio

This sample project demonstrates how to use the Speech framework to recognize words from captured audio.

### Overview
When the user taps the Start Recording button, the SpokenWord app begins capturing audio from the device's microphone. It routes that audio to the APIs of the Speech framework, which process the audio and send back any recognized text. The app displays the recognized text in its text view, continuously updating that text until you tap the Stop Recording button.

### Customizing the Language Model

Developers can enhance the `SFSpeechRecognizer` for specific use cases and applications by customizing its language model. The high-level steps in this process are:

1. Training data generation
2. Training data preparation
3. Request configuration

Training data samples can include exact phrases that the app is likely to encounter:

```swift
SFCustomLanguageModelData.PhraseCount(phrase: "Play the Albin counter gambit", count: 10)
```

The app can also define phrases using templates:

```swift
SFCustomLanguageModelData.PhraseCountsFromTemplates(classes: [
    "piece": ["pawn", "rook", "knight", "bishop", "queen", "king"],
    "royal": ["queen", "king"],
    "rank": Array(1...8).map({ String($0) })
]) {
    SFCustomLanguageModelData.TemplatePhraseCountGenerator.Template(
        "<piece> to <royal> <piece> <rank>",
        count: 10_000
    )
}
```

Custom vocabulary with pronunciation information:

```swift
SFCustomLanguageModelData.CustomPronunciation(grapheme: "Winawer", phonemes: ["w I n aU @r"])
SFCustomLanguageModelData.CustomPronunciation(grapheme: "Tartakower", phonemes: ["t A r t @ k aU @r"])
```

### Configuring the Microphone

```swift
private let audioEngine = AVAudioEngine()

// Configure the audio session for the app
let audioSession = AVAudioSession.sharedInstance()
try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
let inputNode = audioEngine.inputNode

// Configure the microphone input
let recordingFormat = inputNode.outputFormat(forBus: 0)
inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
    self.recognitionRequest?.append(buffer)
}

audioEngine.prepare()
try audioEngine.start()
```

### Creating the Speech Recognition Request

```swift
// Create and configure the speech recognition request
recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
guard let recognitionRequest = recognitionRequest else { 
    fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") 
}
recognitionRequest.shouldReportPartialResults = true

// Keep speech recognition data on device
if #available(iOS 13, *) {
    recognitionRequest.requiresOnDeviceRecognition = true
    if #available(iOS 17, *) {
        recognitionRequest.customizedLanguageModel = self.lmConfiguration
    }
}

// Create a recognition task for the speech recognition session
recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
    var isFinal = false

    if let result = result {
        // Update the text view with the results
        self.textView.text = result.bestTranscription.formattedString
        isFinal = result.isFinal
    }

    if error != nil || isFinal {
        // Stop recognizing speech if there is a problem
        self.audioEngine.stop()
        inputNode.removeTap(onBus: 0)

        self.recognitionRequest = nil
        self.recognitionTask = nil

        self.recordButton.isEnabled = true
        self.recordButton.setTitle("Start Recording", for: [])
    }
}
```

### Responding to Availability Changes

```swift
public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
    if available {
        recordButton.isEnabled = true
        recordButton.setTitle("Start Recording", for: [])
    } else {
        recordButton.isEnabled = false
        recordButton.setTitle("Recognition Not Available", for: .disabled)
    }
}
```

## Language Support
URL: https://developer.apple.com/documentation/speech/sfspeechrecognizer/supportedlocales()

Returns the set of locales that are supported by the speech recognizer.

### Overview
This method returns the locales for which speech recognition is supported. Support for a locale does not guarantee that speech recognition is currently possible for that locale. For some locales, the speech recognizer requires an active Internet connection to communicate with Apple's servers. If the speech recognizer is currently unable to process requests, `isAvailable` returns `false`.

Speech recognition supports the same locales that are supported by the keyboard's dictation feature.

## Authorization
URL: https://developer.apple.com/documentation/speech/sfspeechrecognizerauthorizationstatus

The app's authorization to perform speech recognition.

### Authorization Statuses

- `notDetermined`: The app's authorization status has not yet been determined
- `denied`: The user denied your app's request to perform speech recognition
- `restricted`: The device prevents your app from performing speech recognition
- `authorized`: The user granted your app's request to perform speech recognition

### Requesting Authorization
URL: https://developer.apple.com/documentation/speech/sfspeechrecognizer/requestauthorization(_:)

Call this method before performing any other tasks associated with speech recognition. This method executes asynchronously, returning shortly after you call it. At some point later, the system calls the provided handler block with the results.

When your app's authorization status is `notDetermined`, this method causes the system to prompt the user to grant or deny permission for your app to use speech recognition. The prompt includes the custom message you specify in the `NSSpeechRecognitionUsageDescription` key of your app's `Info.plist` file. The user's response is saved so that future calls to this method do not prompt the user again.

## SpeechAnalyzer (Beta - iOS 26.0+)
URL: https://developer.apple.com/documentation/speech/speechanalyzer

Analyzes spoken audio content in various ways and manages the analysis session.

### Overview
Analysis is asynchronous. Input, output, and session control are decoupled and may (and typically will) occur over several different tasks created by you or by the session.

The analyzer can only analyze one input sequence at a time.

### Autonomous Analysis
You can perform analysis using the `analyzeSequence(_:)` or `analyzeSequence(from:)` methods, which work well with Swift structured concurrency techniques.

For autonomous analysis, create the analyzer with one of the initializers that has an input sequence or file parameter, or call `start(inputSequence:)` or `start(inputAudioFile:finishAfterFile:)`.

### Analyzer States
Several methods cause the analysis session to finish. When an analysis session is finished, the analyzer will not take any additional input from the input sequence and will not accept a different input sequence or accept module changes. Modules' results streams terminate.

### Error Handling
When the analyzer or its modules' result streams throw an error, the analysis session becomes finished and the same error (or a `CancellationError`) is thrown from all waiting methods and result streams.

## SpeechTranscriber (Beta - iOS 26.0+)
URL: https://developer.apple.com/documentation/speech/speechtranscriber

A module that transcribes speech to text. This transcriber is appropriate for normal conversation and general purposes.

### Overview
Several transcriber instances can share the same backing engine instances and models, so long as the transcribers are configured similarly in certain respects.

### Key Features

- **Presets**: Predefined transcriber configurations for common use cases
- **Results**: Phrases or passages of transcribed speech sent in order
- **Locale Support**: Can check installed and supported locales
- **Options**: Various transcription, reporting, and attribute options

### Creating a Transcriber

```swift
// Using preset
convenience init(locale: Locale, preset: SpeechTranscriber.Preset)

// Using custom options
convenience init(
    locale: Locale, 
    transcriptionOptions: Set<SpeechTranscriber.TranscriptionOption>,
    reportingOptions: Set<SpeechTranscriber.ReportingOption>,
    attributeOptions: Set<SpeechTranscriber.ResultAttributeOption>
)
```

### Static Properties

- `installedLocales`: The locales that the transcriber can transcribe into, considering only locales that are installed on the device
- `supportedLocales`: The locales that the transcriber can transcribe into, including locales that may not be installed but are downloadable

## Summary

The Speech framework provides powerful speech recognition capabilities for iOS, iPadOS, macOS, and visionOS applications. It offers both the traditional SFSpeechRecognizer API for Objective-C compatibility and the newer SpeechAnalyzer API (iOS 26.0+) that leverages Swift concurrency for more flexible and powerful speech analysis.

Key features include:
- Live and prerecorded audio recognition
- Multiple language support
- Custom language models
- On-device recognition options
- Partial results and confidence levels
- Authorization management
- Advanced transcription options with the new SpeechAnalyzer API

When implementing speech recognition, remember to:
- Request appropriate authorization
- Handle network availability for languages requiring server connection
- Respect the one-minute duration limit
- Provide clear UI feedback during recording
- Avoid processing sensitive information
- Check locale availability before attempting recognition