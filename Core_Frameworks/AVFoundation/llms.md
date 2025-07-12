# https://developer.apple.com/documentation/avfoundation llms.txt

## AVFoundation Framework - Audio and Media Documentation

- [AVFoundation Framework](https://developer.apple.com/documentation/avfoundation): Work with audiovisual assets, control device cameras, process audio, and configure system audio.
- [AVAudioEngine](https://developer.apple.com/documentation/avfoundation/avaudioengine): A group of connected audio node objects used to generate and process audio signals.
- [AVAudioSession](https://developer.apple.com/documentation/avfoundation/avaudiosession): The shared audio session instance for managing audio behavior.
- [AVAudioRecorder](https://developer.apple.com/documentation/avfoundation/avaudiorecorder): A class for recording audio in your app.
- [AVAudioPlayer](https://developer.apple.com/documentation/avfoundation/avaudioplayer): A class for playing audio data from a file or memory.

## Audio Recording and Processing
- [AVAudioNode](https://developer.apple.com/documentation/avfoundation/avaudionode): An abstract class for an audio generation, processing, or I/O block.
- [AVAudioInputNode](https://developer.apple.com/documentation/avfoundation/avaudioinputnode): A node that connects to the system's audio input.
- [AVAudioOutputNode](https://developer.apple.com/documentation/avfoundation/avaudiooutputnode): A node that connects to the system's audio output.
- [AVAudioMixerNode](https://developer.apple.com/documentation/avfoundation/avaudimixernode): A node that mixes multiple inputs to a single output.
- [AVAudioUnitEQ](https://developer.apple.com/documentation/avfoundation/avaudiouniteq): An audio unit that implements a multiband equalizer.

## Audio Formats and Buffers
- [AVAudioFormat](https://developer.apple.com/documentation/avfoundation/avaudioformat): A class that contains information about the format of an audio stream.
- [AVAudioPCMBuffer](https://developer.apple.com/documentation/avfoundation/avaudiopcmbuffer): A buffer of audio in PCM format.
- [AVAudioCompressedBuffer](https://developer.apple.com/documentation/avfoundation/avaudiocompressedbuffer): A buffer of audio in a compressed format.
- [AVAudioTime](https://developer.apple.com/documentation/avfoundation/avaudiotime): A class for representing timestamps and time intervals.
- [AVAudioFramePosition](https://developer.apple.com/documentation/avfoundation/avaudioframeposition): A position in an audio file or stream.

## Audio Session Management
- [AVAudioSessionCategory](https://developer.apple.com/documentation/avfoundation/avaudiosessioncategory): Categories for audio sessions to define audio behavior.
- [AVAudioSessionMode](https://developer.apple.com/documentation/avfoundation/avaudiosessionmode): Modes to specialize the behavior of audio session categories.
- [AVAudioSessionRouteDescription](https://developer.apple.com/documentation/avfoundation/avaudiosessionroutedescription): Information about the current audio route.
- [AVAudioSessionPortDescription](https://developer.apple.com/documentation/avfoundation/avaudiosessionportdescription): Information about an audio port.
- [AVAudioSessionInterruptionType](https://developer.apple.com/documentation/avfoundation/avaudiosessioninterruptiontype): Constants that indicate the type of audio interruption.

## Speech Synthesis
- [AVSpeechSynthesizer](https://developer.apple.com/documentation/avfoundation/avspeechsynthesizer): A class that produces synthesized speech from text.
- [AVSpeechUtterance](https://developer.apple.com/documentation/avfoundation/avspeechutterance): A chunk of text to be spoken, along with parameters.
- [AVSpeechSynthesisVoice](https://developer.apple.com/documentation/avfoundation/avspeechsynthesisvoice): A voice for use with a speech synthesizer.
- [AVSpeechSynthesizerDelegate](https://developer.apple.com/documentation/avfoundation/avspeechsynthesizerdelegate): Methods for responding to speech synthesis events.

## Audio Effects and Processing
- [AVAudioUnit](https://developer.apple.com/documentation/avfoundation/avaudiounit): A class that represents an audio unit.
- [AVAudioUnitReverb](https://developer.apple.com/documentation/avfoundation/avaudiounitreverb): An audio unit that implements a reverb effect.
- [AVAudioUnitDelay](https://developer.apple.com/documentation/avfoundation/avaudiounitdelay): An audio unit that implements a delay effect.
- [AVAudioUnitDistortion](https://developer.apple.com/documentation/avfoundation/avaudiounitdistortion): An audio unit that implements distortion effects.
- [AVAudioUnitEffect](https://developer.apple.com/documentation/avfoundation/avaudiouniteffect): A class that processes audio in real time.

## Audio Files and Assets
- [AVAudioFile](https://developer.apple.com/documentation/avfoundation/avaudiofile): A class for reading and writing audio files.
- [AVAsset](https://developer.apple.com/documentation/avfoundation/avasset): An abstract class for representing timed audiovisual media.
- [AVURLAsset](https://developer.apple.com/documentation/avfoundation/avurlasset): An asset that represents media at a specified URL.
- [AVAssetTrack](https://developer.apple.com/documentation/avfoundation/avassettrack): A track in an asset that presents media of a uniform type.
- [AVAssetReader](https://developer.apple.com/documentation/avfoundation/avassetreader): A reader object for obtaining media data from an asset.

## Capture Session
- [AVCaptureSession](https://developer.apple.com/documentation/avfoundation/avcapturesession): An object that manages capture activity and coordinates data flow.
- [AVCaptureDevice](https://developer.apple.com/documentation/avfoundation/avcapturedevice): A device that provides input for capture sessions.
- [AVCaptureInput](https://developer.apple.com/documentation/avfoundation/avcaptureinput): An abstract class for objects that provide input data.
- [AVCaptureOutput](https://developer.apple.com/documentation/avfoundation/avcaptureoutput): An abstract class for objects that output capture data.
- [AVCaptureConnection](https://developer.apple.com/documentation/avfoundation/avcaptureconnection): A connection between capture inputs and outputs.

## Audio Data Output
- [AVCaptureAudioDataOutput](https://developer.apple.com/documentation/avfoundation/avcaptureaudiodataoutput): A capture output for audio sample buffers.
- [AVCaptureAudioDataOutputSampleBufferDelegate](https://developer.apple.com/documentation/avfoundation/avcaptureaudiodataoutputsamplebufferdelegate): Methods for receiving audio sample buffers.
- [AVCaptureAudioFileOutput](https://developer.apple.com/documentation/avfoundation/avcaptureaudiofileoutput): A capture output that records audio to a file.

## Audio Mixing
- [AVAudioMix](https://developer.apple.com/documentation/avfoundation/avaudiomix): An object that manages the audio mix parameters.
- [AVMutableAudioMix](https://developer.apple.com/documentation/avfoundation/avmutableaudiomix): A mutable object for audio mixing parameters.
- [AVAudioMixInputParameters](https://developer.apple.com/documentation/avfoundation/avaudiomixinputparameters): Parameters for an individual audio track.

## Spatial Audio
- [AVAudioSpatializationFormats](https://developer.apple.com/documentation/avfoundation/avaudiospatializationformats): Constants that describe spatialization formats.
- [AVAudio3DMixing](https://developer.apple.com/documentation/avfoundation/avaudio3dmixing): A protocol for 3D audio mixing.
- [AVAudioEnvironmentNode](https://developer.apple.com/documentation/avfoundation/avaudioenvironmentnode): A mixer node that simulates 3D audio environments.

## Performance and Metrics
- [AVMetrics](https://developer.apple.com/documentation/avfoundation/avmetrics): Framework for collecting and analyzing playback metrics.
- [AVVideoPerformanceMetrics](https://developer.apple.com/documentation/avfoundation/avvideoperformancemetrics): Metrics for video playback performance.

## Common Tasks
- [Observing Playback State in SwiftUI](https://developer.apple.com/documentation/avfoundation/observing-playback-state-in-swiftui): Monitor and respond to playback state changes.
- [Recording Audio](https://developer.apple.com/documentation/avfoundation/audio_recording): Capture audio from the device's microphone.
- [Playing Audio](https://developer.apple.com/documentation/avfoundation/audio_playback): Play audio files and streams in your app.