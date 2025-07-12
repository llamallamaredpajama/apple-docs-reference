# https://developer.apple.com/documentation/speech llms.txt

## Speech Framework - Core Documentation

- [Speech Framework](https://developer.apple.com/documentation/speech): Perform speech recognition on live or prerecorded audio.
- [Recognizing Speech in Live Audio](https://developer.apple.com/documentation/speech/recognizing-speech-in-live-audio): Process live audio streams for real-time transcription.
- [SpeechAnalyzer](https://developer.apple.com/documentation/speech/speechanalyzer): Advanced speech analysis capabilities for iOS 26+.
- [SpeechTranscriber](https://developer.apple.com/documentation/speech/speechtranscriber): High-level transcription API for speech processing.
- [SpeechModels](https://developer.apple.com/documentation/speech/speechmodels): Access and manage speech recognition models.

## Core Recognition Classes
- [SFSpeechRecognizer](https://developer.apple.com/documentation/speech/sfspeechrecognizer): The primary object for speech recognition.
- [SFSpeechRecognizer.Locale](https://developer.apple.com/documentation/speech/sfspeechrecognizer/locale): Available locales for speech recognition.
- [SFSpeechRecognizer.isAvailable](https://developer.apple.com/documentation/speech/sfspeechrecognizer/isavailable): Check availability of speech recognition.
- [SFSpeechRecognizer.delegate](https://developer.apple.com/documentation/speech/sfspeechrecognizer/delegate): Delegate for speech recognizer events.
- [SFSpeechRecognizerDelegate](https://developer.apple.com/documentation/speech/sfspeechrecognizerdelegate): Protocol for handling recognizer availability changes.

## Recognition Requests
- [SFSpeechRecognitionRequest](https://developer.apple.com/documentation/speech/sfspeechrecognitionrequest): Base class for recognition requests.
- [SFSpeechAudioBufferRecognitionRequest](https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest): Recognition request for audio buffers.
- [SFSpeechURLRecognitionRequest](https://developer.apple.com/documentation/speech/sfspeechurlrecognitionrequest): Recognition request for audio files.
- [AddsPunctuation](https://developer.apple.com/documentation/speech/sfspeechrecognitionrequest/addspunctuation): Automatically add punctuation to transcripts.
- [ContextualStrings](https://developer.apple.com/documentation/speech/sfspeechrecognitionrequest/contextualstrings): Provide context for better recognition.
- [TaskHint](https://developer.apple.com/documentation/speech/sfspeechrecognitionrequest/taskhint): Optimize recognition for specific use cases.

## Recognition Tasks
- [SFSpeechRecognitionTask](https://developer.apple.com/documentation/speech/sfspeechrecognitiontask): A speech recognition task.
- [SFSpeechRecognitionTaskState](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskstate): States of a recognition task.
- [SFSpeechRecognitionTaskDelegate](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskdelegate): Delegate for task progress updates.
- [Task State](https://developer.apple.com/documentation/speech/sfspeechrecognitiontask/state): Current state of the recognition task.
- [Task Error](https://developer.apple.com/documentation/speech/sfspeechrecognitiontask/error): Error information for failed tasks.
- [Is Finishing](https://developer.apple.com/documentation/speech/sfspeechrecognitiontask/isfinishing): Check if task is finishing.

## Recognition Results
- [SFSpeechRecognitionResult](https://developer.apple.com/documentation/speech/sfspeechrecognitionresult): Results from speech recognition.
- [Best Transcription](https://developer.apple.com/documentation/speech/sfspeechrecognitionresult/besttranscription): The most likely transcription.
- [SFTranscription](https://developer.apple.com/documentation/speech/sftranscription): A transcription of recognized speech.
- [SFTranscriptionSegment](https://developer.apple.com/documentation/speech/sftranscriptionsegment): A time-aligned segment of transcription.
- [Segment Substring](https://developer.apple.com/documentation/speech/sftranscriptionsegment/substring): The text of a transcription segment.
- [Segment Confidence](https://developer.apple.com/documentation/speech/sftranscriptionsegment/confidence): Confidence level for a segment.

## Advanced Features
- [SFSpeechRecognitionMetadata](https://developer.apple.com/documentation/speech/sfspeechrecognitionmetadata): Metadata about recognition results.
- [SFVoiceAnalytics](https://developer.apple.com/documentation/speech/sfvoiceanalytics): Voice quality analytics.
- [SFAcousticFeature](https://developer.apple.com/documentation/speech/sfacousticfeature): Acoustic features from speech.
- [Voice Analytics Jitter](https://developer.apple.com/documentation/speech/sfvoiceanalytics/jitter): Voice jitter measurements.
- [AnalysisContext](https://developer.apple.com/documentation/speech/analysiscontext): Context for speech analysis.
- [AnalyzerInput](https://developer.apple.com/documentation/speech/analyzerinput): Input for speech analyzer.

## Language Models
- [SFSpeechLanguageModel](https://developer.apple.com/documentation/speech/sfspeechlanguagemodel): Custom language models for recognition.
- [SFCustomLanguageModelData](https://developer.apple.com/documentation/speech/sfcustomlanguagemodeldata): Data for custom language models.
- [PhraseCountGenerator](https://developer.apple.com/documentation/speech/sfcustomlanguagemodeldata/phrasecountgenerator): Generate phrase counts for models.
- [DataInsertable](https://developer.apple.com/documentation/speech/datainsertable): Protocol for insertable data.
- [AssetInstallationRequest](https://developer.apple.com/documentation/speech/assetinstallationrequest): Request installation of speech assets.

## Authorization
- [SFSpeechRecognizerAuthorizationStatus](https://developer.apple.com/documentation/speech/sfspeechrecognizerauthorizationstatus): Authorization status for speech recognition.
- [Authorized Status](https://developer.apple.com/documentation/speech/sfspeechrecognizerauthorizationstatus/authorized): User has authorized speech recognition.
- [Restricted Status](https://developer.apple.com/documentation/speech/sfspeechrecognizerauthorizationstatus/restricted): Speech recognition is restricted.
- [Request Authorization](https://developer.apple.com/documentation/speech/sfspeechrecognizer/requestauthorization(_:)): Request user authorization.

## Task Hints
- [SFSpeechRecognitionTaskHint](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint): Hints to optimize recognition.
- [Dictation](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint/dictation): Optimize for dictation.
- [Search](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint/search): Optimize for search queries.
- [Confirmation](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint/confirmation): Optimize for confirmations.

## Audio Configuration
- [Native Audio Format](https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest/nativeaudioformat): Preferred audio format for recognition.
- [Append Audio PCM Buffer](https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest/appendaudiopcmbuffer(_:)): Add audio data to request.
- [Append Audio Sample Buffer](https://developer.apple.com/documentation/speech/sfspeechaudiobufferrecognitionrequest/appendaudiosamplebuffer(_:)): Add sample buffer data.

## Errors
- [SFSpeechError](https://developer.apple.com/documentation/speech/sfspeecherror): Errors that can occur during speech recognition.
- [Speech Enumerations](https://developer.apple.com/documentation/speech/speech-enumerations): All enumeration types in Speech framework.

## Module Results
- [SpeechModuleResult](https://developer.apple.com/documentation/speech/speechmoduleresult): Results from speech processing modules.
- [Starting State](https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskstate/starting): Task is starting state.