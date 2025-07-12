# AVFoundation Framework - Full Documentation for Audio Recording and Processing

This file contains the full content of the most essential AVFoundation documentation pages for audio recording and processing, scraped from Apple's developer documentation.

---

## AVFoundation Framework Overview

**URL:** https://developer.apple.com/documentation/avfoundation

Work with audiovisual assets, control device cameras, process audio, and configure system audio interactions.

**Platforms:** iOS 2.2+, iPadOS 13.1+, Mac Catalyst 13.1+, macOS 10.7+, tvOS 9.0+, visionOS 1.0+, watchOS 3.0+

### Overview

AVFoundation combines several major technology areas that together encompass a wide range of tasks for inspecting, playing, capturing, and processing audiovisual media on Apple platforms.

### Topics

#### Common
- **Media assets** - Load media assets from files and streams to inspect their attributes, tracks, and embedded metadata.
- **Media reading and writing** - Read images from video, export to alternative formats, and perform sample-level reading and writing of media data.
- **Media types and utilities** - Identify the types of content and file formats that AVFoundation supports.
- **Video settings** - Configure video processing settings using standard key and value constants.
- **Audio settings** - Configure audio processing settings using standard key and value constants.

#### Playback
- **Media playback** - Manage the playback of media assets and interstitial content, independent of how you present that content in your interface.
- **Offline playback and storage** - Download streamed content to disk to allow offline playback, and define policies to automatically remove downloaded assets.
- **Streaming and AirPlay** - Stream content wirelessly to other devices using AirPlay, and handle requests involving FairPlay-protected assets.
- **Sample buffer playback** - Create custom controllers to play and synchronize the timing of sample buffer streams.

#### Capture
- **Capture setup** - Configure built-in cameras and microphones, and external capture devices, for media capture.
- **Photo capture** - Capture high-quality still images, Live Photos, and supporting photo data.
- **Audio and video capture** - Capture audio and video directly to media files, or capture streams of media for direct access to media sample buffers.
- **Additional data capture** - Capture additional data including depth and metadata, and synchronize capture from multiple outputs.

#### Audio
- **Audio playback, recording, and processing** - Play, record, and process audio; configure your app's system audio behavior.
- **Speech synthesis** - Configure voices to speak strings of text.

---

## Audio Playback, Recording, and Processing

**URL:** https://developer.apple.com/documentation/avfoundation/audio-playback-recording-and-processing

Play, record, and process audio; configure your app's system audio behavior.

### Topics

#### System audio
- **Handling audio interruptions** - Observe audio session notifications to ensure that your app responds appropriately to interruptions.
- **Responding to audio route changes** - Observe audio session notifications to ensure that your app responds appropriately to route changes.
- **Capturing stereo audio from built-In microphones** - Configure an iOS device's built-in microphones to add stereo recording capabilities to your app.
- **AVAudioSession** - An object that communicates to the system how you intend to use audio in your app.
- **AVAudioApplication** - An object that manages one or more audio sessions that belong to an app.
- **AVAudioRoutingArbiter** - An object for configuring macOS apps to participate in AirPods Automatic Switching.

#### Basic playback and recording
- **AVAudioPlayer** - An object that plays audio data from a file or buffer.
- **AVAudioRecorder** - An object that records audio data to a file.
- **AVMIDIPlayer** - An object that plays MIDI data through a system sound module.

#### Advanced audio processing
- **Audio Engine** - Perform advanced real-time and offline audio processing, implement 3D spatialization, and work with MIDI and samplers.

---

## Audio Engine

**URL:** https://developer.apple.com/documentation/AVFAudio/audio-engine

Perform advanced real-time and offline audio processing, implement 3D spatialization, and work with MIDI and samplers.

### Overview

The audio engine provides a powerful, feature-rich API to simplify audio generation, processing, and input/output tasks. The engine contains a group of nodes that connect to form an audio signal processing chain. These nodes perform a variety of tasks on a signal before rendering to an output destination.

Audio Engine helps you achieve simple, as well as complex, audio processing tasks. With Audio Engine, your apps can:

- Play audio using files and buffers
- Capture audio at any point during the processing chain
- Add built-in effects like reverb, delay, distortion, and your custom effects
- Perform stereo and 3D mixing
- Provide MIDI playback and control over sampler instruments

### Topics

#### Essentials
- **AVAudioEngine** - An object that manages a graph of audio nodes, controls playback, and configures real-time rendering constraints.

#### Nodes
- **AVAudioNode** - An object you use for audio generation, processing, or an I/O block.
- **AVAudioInputNode** - An object that connects to the system's audio input.
- **AVAudioOutputNode** - An object that connects to the system's audio output.
- **AVAudioIONode** - An object that performs audio input or output in the engine.

#### Playback
- **Playing custom audio with your own player** - Construct an audio player to play your custom audio data, and optionally take advantage of the advanced features of AirPlay 2.
- **Using voice processing** - Add voice-processing capabilities to your app by using audio engine.
- **AVAudioPlayerNode** - An object for scheduling the playback of buffers or segments of audio files.

#### MIDI
- **AVAudioSequencer** - An object that plays audio from a collection of MIDI events the system organizes into music tracks.
- **AVAudioUnitSampler** - An object that you configure with one or more instrument samples, based on Apple's Sampler audio unit.

#### Mixing
- **AVAudioMixerNode** - An object that takes any number of inputs and converts them into a single output.
- **AVAudioMixing** - A collection of properties that are applicable to the input bus of a mixer node.

#### Effects
- **Creating custom audio effects** - Add custom audio-effect processing to apps like Logic Pro X and GarageBand by creating Audio Unit (AU) plug-ins.
- **Audio Units** - The data type for a plug-in component that provides audio processing or audio data generation.

#### Rendering
- **Building a signal generator** - Use an audio source node and a custom render callback to generate audio signals.
- **Performing offline audio processing** - Add offline audio processing features to your app by enabling offline manual rendering mode.
- **AVAudioSourceNode** - An object that supplies audio data.
- **AVAudioSinkNode** - An object that receives audio data.

#### Conversion
- **AVAudioConverter** - An object that converts streams of audio between formats.

#### Spatial audio
- **AVAudioEnvironmentNode** - An object that simulates a 3D audio environment.
- **AVAudioEnvironmentDistanceAttenuationParameters** - An object that specifies the amount of attenuation distance, the gradual loss in audio intensity, and other characteristics.
- **AVAudioEnvironmentReverbParameters** - A class that encapsulates the parameters that you use to control the reverb of the environment node class.
- **AVAudio3DMixing** - A collection of properties that define 3D mixing properties.
- **AVAudio3DPoint** - A structure that represents a point in 3D space.
- **AVAudio3DVectorOrientation** - A structure that represents two orthogonal vectors that describe the orientation of the listener in 3D space.
- **AVAudio3DAngularOrientation** - A structure that represents the angular orientation of the listener in 3D space.

#### Supporting data types
- **AVAudioBuffer** - An object that represents a buffer of audio data with a format.
- **AVAudioFile** - An object that represents an audio file that the system can open for reading or writing.
- **AVAudioTime** - An object you use to represent a moment in time.
- **Audio settings** - Configure audio processing settings using standard key and value constants.

---

## AVAudioSession

**URL:** https://developer.apple.com/documentation/AVFAudio/AVAudioSession

An object that communicates to the system how you intend to use audio in your app.

**Platforms:** iOS 3.0+, iPadOS 3.0+, Mac Catalyst 13.1+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioSession
```

### Overview

An audio session acts as an intermediary between your app and the operating system — and, in turn, the underlying audio hardware. You use an audio session to communicate to the operating system the general nature of your app's audio without detailing the specific behavior or required interactions with the audio hardware. You delegate the management of those details to the audio session, which ensures that the operating system can best manage the user's audio experience.

All iOS, tvOS, and watchOS apps have a default audio session that comes preconfigured with the following behavior:

- It supports audio playback, but disallows audio recording.
- When the app plays audio, it silences any other background audio.
- In iOS, setting the Ring/Silent switch to silent mode silences any audio the app is playing.
- In iOS, locking a device silences the app's audio.

Although the default audio session provides useful behavior, it generally doesn't provide the audio behavior a media app needs. To change the default behavior, you configure your app's audio session category.

There are six possible categories you can use, but `playback` is the one that playback apps most commonly use. This category indicates that audio playback is a central feature of your app. When you specify this category, your app's audio continues with the Ring/Silent switch set to silent mode (iOS only). Using this category, you can also play background audio if you're using the Audio, AirPlay, and Picture in Picture background mode.

You use an `AVAudioSession` object to configure your app's audio session. This class is a singleton object used to set the audio session's category, mode, and other configurations. You can interact with the audio session throughout your app's life cycle, but it's often useful to perform this configuration at app launch, as shown in the following example.

```swift
func configureAudioSession() {
    // Retrieve the shared audio session.
    let audioSession = AVAudioSession.sharedInstance()
    do {
        // Set the audio session category and mode.
        try audioSession.setCategory(.playback, mode: .moviePlayback)
    } catch {
        print("Failed to set the audio session configuration")
    }
}
```

The audio session uses this configuration when you activate the session using the `setActive:error:` or `setActive(_:options:)` method.

### Topics

#### Accessing the shared audio session
- **sharedInstance()** - Returns the shared audio session instance.

#### Configuring standard audio behaviors
- **setCategory(_:mode:policy:options:)** - Sets the session category, mode, route-sharing policy, and options.
- **setCategory(_:mode:options:)** - Sets the audio session's category, mode, and options.
- **setCategory(_:options:)** - Sets the audio session's category with the specified options.
- **setCategory(_:)** - Sets the audio session's category.
- **setMode(_:)** - Sets the audio session's mode.

#### Activating the audio configuration
- **setActive(_:options:)** - Activates or deactivates your app's audio session using the specified options.
- **activate(options:completionHandler:)** - Activates an audio session asynchronously on watchOS.
- **AVAudioSessionActivationOptions** - Constants that describe the options to pass when activating the audio session.

#### Inspecting the category configuration
- **category** - The current audio session category.
- **availableCategories** - The audio session categories available on the current device.
- **Category** - Audio session category identifiers.
- **categoryOptions** - The set of options associated with the current audio session category.
- **CategoryOptions** - Constants that specify optional audio behaviors.

#### Inspecting mode configuration
- **mode** - The current audio session's mode.
- **availableModes** - The audio session modes available on the device.
- **Mode** - Audio session mode identifiers.

#### Mixing with other audio
- **isOtherAudioPlaying** - A Boolean value that indicates whether another app is playing audio.
- **secondaryAudioShouldBeSilencedHint** - A Boolean value that indicates whether another app, with a nonmixable audio session, is playing audio.
- **silenceSecondaryAudioHintNotification** - A notification the system posts when the primary audio from other apps starts and stops.
- **allowHapticsAndSystemSoundsDuringRecording** - A Boolean value that indicates whether system sounds and haptics play while recording from audio input.
- **setAllowHapticsAndSystemSoundsDuringRecording(_:)** - Sets a Boolean value that indicates whether system sounds and haptics play while recording from audio input.

#### Managing audio routing
- **Audio routing** - Inspect and configure audio routes, ports, and data sources.

#### Handling interruptions
- **prefersNoInterruptionsFromSystemAlerts** - A Boolean value that indicates a preference for not interrupting the session with system alerts.
- **setPrefersNoInterruptionsFromSystemAlerts(_:)** - Sets the preference for not interrupting the audio session with system alerts.
- **prefersInterruptionOnRouteDisconnect** - A Boolean value that indicates whether the system interrupts the audio session when the active route disconnects.
- **setPrefersInterruptionOnRouteDisconnect(_:)** - Sets a preference to interrupt the audio session when the active route disconnects.
- **interruptionNotification** - A notification the system posts when an audio interruption occurs.

#### Enabling stereo recording
- **inputOrientation** - An orientation value that dictates which directions represent left and right when capturing audio from a built-in microphone configured for stereo recording.
- **preferredInputOrientation** - The audio session's preferred stereo input orientation.
- **setPreferredInputOrientation(_:)** - Sets the audio session's preferred stereo input orientation.
- **StereoOrientation** - Constants that define the supported stereo orientations.

---

## AVAudioRecorder

**URL:** https://developer.apple.com/documentation/AVFAudio/AVAudioRecorder

An object that records audio data to a file.

**Platforms:** iOS 3.0+, iPadOS 3.0+, Mac Catalyst 13.1+, macOS 10.7+, tvOS 17.0+, visionOS 1.0+, watchOS 4.0+

```swift
class AVAudioRecorder
```

### Overview

Use an audio recorder to:

- Record audio from the system's active input device
- Record for a specified duration or until the user stops recording
- Pause and resume a recording
- Access recording-level metering data

To record audio in iOS or tvOS, configure your audio session to use the `record` or `playAndRecord` category.

### Topics

#### Creating an audio recorder
- **init(url:settings:)** - Creates an audio recorder with settings.
- **init(url:format:)** - Creates an audio recorder with an audio format.

#### Controlling recording
- **prepareToRecord()** - Creates an audio file and prepares the system for recording.
- **record()** - Starts or resumes audio recording.
- **record(atTime:)** - Records audio starting at a specific time.
- **record(forDuration:)** - Records audio for the indicated duration of time.
- **record(atTime:forDuration:)** - Records audio starting at a specific time for the indicated duration.
- **pause()** - Pauses an audio recording.
- **stop()** - Stops recording and closes the audio file.
- **isRecording** - A Boolean value that indicates whether the audio recorder is recording.
- **deleteRecording()** - Deletes a recorded audio file.

#### Accessing recorder timing
- **currentTime** - The time, in seconds, since the beginning of the recording.
- **deviceCurrentTime** - The time, in seconds, of the host audio device.

#### Managing audio channels
- **channelAssignments** - An array of channel descriptions associated with the audio recorder.

#### Managing audio-level metering
- **isMeteringEnabled** - A Boolean value that indicates whether you've enabled the recorder to generate audio-level metering data.
- **updateMeters()** - Refreshes the average and peak power values for all channels of an audio recorder.
- **averagePower(forChannel:)** - Returns the average power, in decibels full-scale (dBFS), for an audio channel.
- **peakPower(forChannel:)** - Returns the peak power, in decibels full-scale (dBFS), for an audio channel.

#### Responding to recorder events
- **delegate** - The delegate object for the audio recorder.
- **AVAudioRecorderDelegate** - A protocol that defines the methods to respond to audio recording events and encoding errors.

#### Inspecting the audio data
- **url** - The URL to which the recorder writes its data.
- **format** - The format of the recorded audio.
- **settings** - The settings that describe the format of the recorded audio.

---

## AVAudioPlayer

**URL:** https://developer.apple.com/documentation/AVFAudio/AVAudioPlayer

An object that plays audio data from a file or buffer.

**Platforms:** iOS 2.2+, iPadOS 2.2+, Mac Catalyst 13.1+, macOS 10.7+, tvOS 9.0+, visionOS 1.0+, watchOS 3.0+

```swift
class AVAudioPlayer
```

### Overview

Use an audio player to:

- Play audio of any duration from a file or buffer
- Control the volume, panning, rate, and looping behavior of the played audio
- Access playback-level metering data
- Play multiple sounds simultaneously by synchronizing the playback of multiple players

For more information about preparing your app to play audio, see Configuring your app for media playback.

### Topics

#### Creating an audio player
- **init(contentsOf:)** - Creates a player to play audio from a file.
- **init(contentsOf:fileTypeHint:)** - Creates a player to play audio from a file of a particular type.
- **init(data:)** - Creates a player to play in-memory audio data.
- **init(data:fileTypeHint:)** - Creates a player to play in-memory audio data of a particular type.

#### Controlling playback
- **prepareToPlay()** - Prepares the player for audio playback.
- **play()** - Plays audio asynchronously.
- **play(atTime:)** - Plays audio asynchronously, starting at a specified point in the audio output device's timeline.
- **pause()** - Pauses audio playback.
- **stop()** - Stops playback and undoes the setup the system requires for playback.
- **isPlaying** - A Boolean value that indicates whether the player is currently playing audio.

#### Configuring playback settings
- **volume** - The audio player's volume relative to other audio output.
- **setVolume(_:fadeDuration:)** - Changes the audio player's volume over a duration of time.
- **pan** - The audio player's stereo pan position.
- **enableRate** - A Boolean value that indicates whether you can adjust the playback rate of the audio player.
- **rate** - The audio player's playback rate.
- **numberOfLoops** - The number of times the audio repeats playback.

#### Accessing player timing
- **currentTime** - The current playback time, in seconds, within the audio timeline.
- **duration** - The total duration, in seconds, of the player's audio.

#### Managing audio channels
- **numberOfChannels** - The number of audio channels in the player's audio.
- **channelAssignments** - An array of channel descriptions for the audio player.

#### Managing audio-level metering
- **isMeteringEnabled** - A Boolean value that indicates whether the player is able to generate audio-level metering data.
- **updateMeters()** - Refreshes the average and peak power values for all channels of an audio player.
- **averagePower(forChannel:)** - Returns the average power, in decibels full-scale (dBFS), for an audio channel.
- **peakPower(forChannel:)** - Returns the peak power, in decibels full-scale (dBFS), for an audio channel.

#### Responding to player events
- **delegate** - The delegate object for the audio player.
- **AVAudioPlayerDelegate** - A protocol that defines the methods to respond to audio playback events and decoding errors.

#### Inspecting the audio data
- **url** - The URL of the audio file.
- **data** - The audio data associated with the player.
- **format** - The format of the player's audio data.
- **settings** - A dictionary that provides information about the player's audio data.

#### Accessing device information
- **currentDevice** - The unique identifier of the current audio player.
- **deviceCurrentTime** - The time value, in seconds, of the audio output device's clock.

---

## AVAudioFormat

**URL:** https://developer.apple.com/documentation/avfaudio/avaudioformat

An object that describes the representation of an audio format.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioFormat
```

### Overview

The `AVAudioFormat` class wraps Core Audio's `AudioStreamBasicDescription`, and includes convenience initializers and accessors for common formats, including Core Audio's standard deinterleaved 32-bit floating point format.

Instances of this class are immutable.

### Topics

#### Creating a New Audio Format Representation
- **init(standardFormatWithSampleRate:channelLayout:)** - Creates an audio format instance as a deinterleaved float with the specified sample rate and channel layout.
- **init?(standardFormatWithSampleRate:channels:)** - Creates an audio format instance with the specified sample rate and channel count.
- **init?(commonFormat:sampleRate:channels:interleaved:)** - Creates an audio format instance.
- **init(commonFormat:sampleRate:interleaved:channelLayout:)** - Creates an audio format instance with the specified audio format, sample rate, interleaved state, and channel layout.
- **init?(settings:)** - Creates an audio format instance using the specified settings dictionary.
- **init?(streamDescription:)** - Creates an audio format instance from a stream description.
- **init?(streamDescription:channelLayout:)** - Creates an audio format instance from a stream description and channel layout.
- **init(cmAudioFormatDescription:)** - Creates an audio format instance from a Core Media audio format description.

#### Getting the Audio Stream Description
- **streamDescription** - The audio format properties of a stream of audio data.

#### Comparing Instances
- **isEqual(_:)** - Indicates whether the audio format instance and a specified object are functionally equivalent.

#### Getting Audio Format Values
- **sampleRate** - The audio format sampling rate, in hertz.
- **channelCount** - The number of channels of audio data.
- **channelLayout** - The underlying audio channel layout.
- **formatDescription** - The audio format description to use with Core Media APIs.

#### Determining the Audio Format
- **isInterleaved** - A Boolean value that indicates whether the samples mix into one stream.
- **isStandard** - A Boolean value that indicates whether the format is in a deinterleaved native-endian float state.
- **commonFormat** - The common format identifier instance.
- **settings** - A dictionary that represents the format as a dictionary using audio setting keys.
- **magicCookie** - An object that contains metadata that encoders and decoders require.

#### Constants
- **AVAudioCommonFormat** - The format options that describe common audio formats.

---

## AVAudioPCMBuffer

**URL:** https://developer.apple.com/documentation/avfaudio/avaudiopcmbuffer

An object that represents an audio buffer you use with PCM audio formats.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioPCMBuffer
```

### Overview

The PCM buffer class provides methods that are useful for manipulating buffers of audio in PCM format.

### Topics

#### Creating a PCM Audio Buffer
- **init?(pcmFormat:frameCapacity:)** - Creates a PCM audio buffer instance for PCM audio data.
- **init?(pcmFormat:bufferListNoCopy:deallocator:)** - Creates a PCM audio buffer instance without copying samples, for PCM audio data, with a specified buffer list and a deallocator closure.

#### Getting and Setting the Frame Length
- **frameLength** - The current number of valid sample frames in the buffer.

#### Accessing PCM Buffer Data
- **floatChannelData** - The buffer's audio samples as floating point values.
- **frameCapacity** - The buffer's capacity, in audio sample frames.
- **int16ChannelData** - The buffer's 16-bit integer audio samples.
- **int32ChannelData** - The buffer's 32-bit integer audio samples.
- **stride** - The buffer's number of interleaved channels.

---

## AVAudioFile

**URL:** https://developer.apple.com/documentation/avfaudio/avaudiofile

An object that represents an audio file that the system can open for reading or writing.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioFile
```

### Overview

Regardless of the file format, you read and write using `AVAudioPCMBuffer` objects. These objects contain samples as `AVAudioCommonFormat` that the framework refers to as the file's processing format. You convert to and from using the file's actual format.

Reads and writes are always sequential. Random access is possible by setting the `framePosition` property.

### Topics

#### Creating an Audio File
- **init(forReading:)** - Opens a file for reading using the standard, deinterleaved floating point format.
- **init(forReading:commonFormat:interleaved:)** - Opens a file for reading using the specified processing format.
- **init(forWriting:settings:)** - Opens a file for writing using the specified settings.
- **init(forWriting:settings:commonFormat:interleaved:)** - Opens a file for writing using a specified processing format and settings.

#### Reading and Writing the Audio Buffer
- **read(into:)** - Reads an entire audio buffer.
- **read(into:frameCount:)** - Reads a portion of an audio buffer using the number of frames you specify.
- **write(from:)** - Writes an audio buffer sequentially.
- **close()** - Closes the audio file.

#### Getting Audio File Properties
- **url** - The location of the audio file.
- **fileFormat** - The on-disk format of the file.
- **processingFormat** - The processing format of the file.
- **length** - The number of sample frames in the file.
- **AVAudioFramePosition** - A position in an audio file or stream.
- **framePosition** - The position in the file where the next read or write operation occurs.
- **AVAudioFrameCount** - A number of audio sample frames.
- **AVAudioFileTypeKey** - A string that indicates the audio file type.
- **isOpen** - A Boolean value that indicates whether the file is open.

---

## AVAudioEngine

**URL:** https://developer.apple.com/documentation/avfaudio/avaudioengine

An object that manages a graph of audio nodes, controls playback, and configures real-time rendering constraints.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioEngine
```

### Overview

An audio engine object contains a group of `AVAudioNode` instances that you attach to form an audio processing chain.

You can connect, disconnect, and remove audio nodes during runtime with minor limitations. Removing an audio node that has differing channel counts, or that's a mixer, can break the graph. Reconnect audio nodes only when they're upstream of a mixer.

By default, Audio Engine renders to a connected audio device in real time. You can configure the engine to operate in manual rendering mode when you need to render at, or faster than, real time. In that mode, the engine disconnects from audio devices and your app drives the rendering.

### Create an Engine for Audio File Playback

To play an audio file, you create an `AVAudioFile` with a file that's open for reading. Create an audio engine object and an `AVAudioPlayerNode` instance, and then attach the player node to the engine. Next, connect the player node to the audio engine's output node. The engine performs audio output through an output node, which is a singleton that the engine creates the first time you access it.

```swift
let audioFile = /* An AVAudioFile instance that points to file that's open for reading. */
let audioEngine = AVAudioEngine()
let playerNode = AVAudioPlayerNode()

// Attach the player node to the audio engine.
audioEngine.attach(playerNode)

// Connect the player node to the output node.
audioEngine.connect(playerNode,
                    to: audioEngine.outputNode,
                    format: audioFile.processingFormat)
```

Then schedule the audio file for full playback. The callback notifies your app when playback completes.

```swift
playerNode.scheduleFile(audioFile,
                        at: nil,
                        completionCallbackType: .dataPlayedBack) { _ in
    /* Handle any work that's necessary after playback. */
}
```

Before you play the audio, start the engine.

```swift
do {
    try audioEngine.start()
    playerNode.play()
} catch {
    /* Handle the error. */
}
```

When you're done, stop the player and the engine.

```swift
playerNode.stop()
audioEngine.stop()
```

### Topics

#### Creating an Audio Engine
- **init()** - Creates an audio engine instance for rendering in real time.

#### Attaching and Detaching Audio Nodes
- **attach(_:)** - Attaches an audio node to the audio engine.
- **detach(_:)** - Detaches an audio node from the audio engine.
- **attachedNodes** - A read-only set that contains the nodes you attach to the audio engine.

#### Getting the Input, Output, and Main Mixer Nodes
- **inputNode** - The audio engine's singleton input audio node.
- **outputNode** - The audio engine's singleton output audio node.
- **mainMixerNode** - The audio engine's optional singleton main mixer node.

#### Connecting and Disconnecting Audio Nodes
- **connect(_:to:format:)** - Establishes a connection between two nodes.
- **connect(_:to:fromBus:toBus:format:)** - Establishes a connection between two nodes, specifying the input and output busses.
- **disconnectNodeInput(_:)** - Removes all input connections of the node.
- **disconnectNodeInput(_:bus:)** - Removes the input connection of a node on the specified bus.
- **disconnectNodeOutput(_:)** - Removes all output connections of a node.
- **disconnectNodeOutput(_:bus:)** - Removes the output connection of a node on the specified bus.

#### Playing Audio
- **prepare()** - Prepares the audio engine for starting.
- **start()** - Starts the audio engine.
- **isRunning** - A Boolean value that indicates whether the audio engine is running.
- **pause()** - Pauses the audio engine.
- **stop()** - Stops the audio engine and releases any previously prepared resources.
- **reset()** - Resets all audio nodes in the audio engine.
- **musicSequence** - The music sequence instance that you attach to the audio engine, if any.

#### Manually Rendering an Audio Engine
- **enableManualRenderingMode(_:format:maximumFrameCount:)** - Sets the engine to operate in manual rendering mode with the render format and maximum frame count you specify.
- **disableManualRenderingMode()** - Sets the engine to render to or from an audio device.
- **renderOffline(_:to:)** - Makes a render call to the engine operating in the offline manual rendering mode.

#### Getting Manual Rendering Properties
- **AVAudioEngineManualRenderingBlock** - The type that represents a block that renders the engine when operating in manual rendering mode.
- **manualRenderingBlock** - The block that renders the engine when operating in manual rendering mode.
- **manualRenderingFormat** - The render format of the engine in manual rendering mode.
- **manualRenderingMaximumFrameCount** - The maximum number of PCM sample frames the engine produces in any single render call in manual rendering mode.
- **manualRenderingMode** - The manual rendering mode configured on the engine.
- **manualRenderingSampleTime** - An indication of where the engine is on its render timeline in manual rendering mode.
- **isAutoShutdownEnabled** - A Boolean value that indicates whether autoshutdown is in an enabled state.
- **isInManualRenderingMode** - A Boolean value that indicates whether the engine is operating in manual rendering mode.

#### Using Connection Points
- **AVAudioConnectionPoint** - A representation of either a source or destination connection point in the audio engine.
- **connect(_:to:fromBus:format:)** - Establishes a connection between a source node and multiple destination nodes.

#### Constants
- **AVAudioEngineManualRenderingError** - Constants that describe error codes that the framework returns from manual rendering mode methods.
- **AVAudioEngineManualRenderingMode** - The two modes for manual rendering.
- **AVAudioEngineManualRenderingStatus** - Status codes that return from the render call to the engine operating in manual rendering mode.

---

## AVAudioNode

**URL:** https://developer.apple.com/documentation/avfaudio/avaudionode

An object you use for audio generation, processing, or an I/O block.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+, watchOS 2.0+

```swift
class AVAudioNode
```

### Overview

An `AVAudioEngine` object contains instances of audio nodes that you attach, and this base class provides common functionality. Instances of this class don't provide useful functionality until you attach them to an engine.

Nodes have input and output busses that serve as connection points. For example, an effect has one input bus and one output bus, and a mixer has multiple input busses and one output bus.

A bus contains a format the framework expresses in terms of sample rate and channel count. Formats must match exactly when making connections between nodes, excluding `AVAudioMixerNode` and `AVAudioOutputNode`.

### Topics

#### Configuring an Input Format Bus
- **AVAudioNodeBus** - The index of a bus on an audio node.
- **inputFormat(forBus:)** - Gets the input format for the bus you specify.
- **name(forInputBus:)** - Gets the name of the input bus you specify.
- **numberOfInputs** - The number of input busses for the node.

#### Creating an Output Format Bus
- **outputFormat(forBus:)** - Retrieves the output format for the bus you specify.
- **name(forOutputBus:)** - Retrieves the name of the output bus you specify.
- **numberOfOutputs** - The number of output busses for the node.

#### Installing and Removing an Audio Tap
- **installTap(onBus:bufferSize:format:block:)** - Installs an audio tap on a bus you specify to record, monitor, and observe the output of the node.
- **removeTap(onBus:)** - Removes an audio tap on a bus you specify.
- **AVAudioNodeTapBlock** - The block that receives copies of the output of an audio node.

#### Getting the Audio Engine for the Node
- **engine** - The audio engine that manages the node, if any.

#### Getting the Latest Node Render Time
- **lastRenderTime** - The most recent render time.

#### Getting Audio Node Properties
- **auAudioUnit** - An audio unit object that wraps or underlies the implementation's audio unit.
- **latency** - The processing latency of the node, in seconds.
- **outputPresentationLatency** - The maximum render pipeline latency downstream of the node, in seconds.

#### Resetting the Audio Node
- **reset()** - Clears a unit's previous processing state.

#### Constants
- **AVAudioNodeCompletionHandler** - A general callback handler for an audio node.

---

## AVAudioInputNode

**URL:** https://developer.apple.com/documentation/avfaudio/avaudioinputnode

An object that connects to the system's audio input.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 11.0+, visionOS 1.0+, watchOS 4.0+

```swift
class AVAudioInputNode
```

### Overview

This node connects to the system's audio input when rendering to or from an audio device. In manual rendering mode, this node supplies input data to the engine.

This audio node has one element. The format of the input scope reflects:

- The audio hardware sample rate and channel count when it connects to hardware.
- The format of the PCM audio data that the node supplies to the engine in manual rendering mode.

When rendering from an audio device, the input node doesn't support format conversion. In this case, the format of the output scope must be the same as the input and the formats for all nodes connected to the input chain.

In manual rendering mode, the format of the output scope is initially the same as the input, but you may set it to a different format, which converts the node.

### Topics

#### Manually Giving Data to an Audio Engine
- **setManualRenderingInputPCMFormat(_:inputBlock:)** - Supplies the data through the input node to the engine while operating in the manual rendering mode.
- **AVAudioIONodeInputBlock** - The type that represents a block to render operation calls to get input data when in manual rendering mode.

#### Getting and Setting Voice Processing Properties
- **isVoiceProcessingInputMuted** - A Boolean that indicates whether the input of the voice processing unit is in a muted state.
- **isVoiceProcessingBypassed** - A Boolean that indicates whether the node bypasses all microphone uplink processing of the voice-processing unit.
- **isVoiceProcessingAGCEnabled** - A Boolean that indicates whether automatic gain control on the processed microphone uplink signal is active.
- **voiceProcessingOtherAudioDuckingConfiguration** - The ducking configuration of nonvoice audio.
- **AVAudioVoiceProcessingOtherAudioDuckingConfiguration** - The configuration of ducking non-voice audio.

#### Handling Muted Speech Events
- **setMutedSpeechActivityEventListener(_:)** - Sets a listener for muted speech activity events.
- **AVAudioVoiceProcessingSpeechActivityEvent** - Types of speech activity events.

---

## AVAudioUnit

**URL:** https://developer.apple.com/documentation/avfaudio/avaudiounit

A subclass of the audio node class that, processes audio either in real time or nonreal time, depending on the type of the audio unit.

**Platforms:** iOS 8.0+, iPadOS 8.0+, Mac Catalyst 13.1+, macOS 10.10+, tvOS 9.0+, visionOS 1.0+

```swift
class AVAudioUnit
```

### Topics

#### Getting the Core Audio audio unit
- **audioUnit** - The underlying Core Audio audio unit.

#### Loading an audio preset file
- **loadPreset(at:)** - Loads an audio unit using a specified preset.

#### Creating an audio unit component
- **instantiate(with:options:completionHandler:)** - Creates an instance of an audio unit component asynchronously and wraps it in an audio unit class.

#### Getting audio unit values
- **audioComponentDescription** - The audio component description that represents the underlying Core Audio audio unit.
- **manufacturerName** - The name of the manufacturer of the audio unit.
- **name** - The name of the audio unit.
- **version** - The version number of the audio unit.
- **auAudioUnit** - The audio unit class wrapping or underlying the implementation's audio unit.

---

This completes the full documentation for the most essential AVFoundation pages for audio recording and processing in iOS/macOS development.