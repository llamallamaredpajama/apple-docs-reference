# https://developer.apple.com/documentation/os/logging llms.txt

## Overview
The unified logging system provides a comprehensive and performant API to capture telemetry across all levels of the system. This system centralizes the storage of log data in memory and on disk, rather than writing that data to a text-based log file.

## Core Documentation Pages

### Logging Essentials
- [Logging Collection](https://developer.apple.com/documentation/os/logging): Capture telemetry from your app for debugging and performance analysis using the unified logging system.
- [Generating Log Messages from Your Code](https://developer.apple.com/documentation/os/generating-log-messages-from-your-code): Record useful debugging and analysis information, and include dynamic content in your messages.
- [Viewing Log Messages](https://developer.apple.com/documentation/os/viewing-log-messages): Use various tools to retrieve log information.
- [Customizing Logging Behavior While Debugging](https://developer.apple.com/documentation/os/customizing-logging-behavior-while-debugging): Control which log events are recorded.

### Logger and OSLog
- [Logger Structure](https://developer.apple.com/documentation/os/logger): An object for writing interpolated string messages to the unified logging system.
- [OSLog Class](https://developer.apple.com/documentation/os/oslog): A log object that contains configuration data.
- [Logger.init()](https://developer.apple.com/documentation/os/logger/init()): Creates a logger that uses the default subsystem.
- [Logger.init(subsystem:category:)](https://developer.apple.com/documentation/os/logger/init(subsystem:category:)): Creates a logger for the specified subsystem and category.

### Log Levels and Types
- [OSLogType Structure](https://developer.apple.com/documentation/os/oslogtype): The various log levels that the unified logging system provides.
- [Logger.debug(_:)](https://developer.apple.com/documentation/os/logger/debug(_:)): Writes a debug message to the log.
- [Logger.info(_:)](https://developer.apple.com/documentation/os/logger/info(_:)): Writes an informative message to the log.
- [Logger.notice(_:)](https://developer.apple.com/documentation/os/logger/notice(_:)): Writes a message to the log using the default log type.
- [Logger.warning(_:)](https://developer.apple.com/documentation/os/logger/warning(_:)): Writes information about a warning to the log.
- [Logger.error(_:)](https://developer.apple.com/documentation/os/logger/error(_:)): Writes information about an error to the log.
- [Logger.fault(_:)](https://developer.apple.com/documentation/os/logger/fault(_:)): Writes a message to the log about a bug that occurs when your app executes.
- [Logger.critical(_:)](https://developer.apple.com/documentation/os/logger/critical(_:)): Writes a message to the log about a critical event in your app's execution.
- [Logger.log(level:_:)](https://developer.apple.com/documentation/os/logger/log(level:_:)): Writes a message to the log using the specified log type.

### Message Formatting
- [Message Argument Formatters](https://developer.apple.com/documentation/os/message-argument-formatters): Manage the privacy and presentation of the message's interpolated values using type-aware formatters.
- [OSLogMessage Structure](https://developer.apple.com/documentation/os/oslogmessage): An object that represents a log message.
- [OSLogStringAlignment](https://developer.apple.com/documentation/os/oslogstringalignment): String alignment options for log messages.
- [OSLogIntegerFormatting](https://developer.apple.com/documentation/os/oslogintegerformatting): Integer formatting options for log messages.
- [OSLogFloatFormatting](https://developer.apple.com/documentation/os/oslogfloatformatting): Floating-point formatting options for log messages.
- [OSLogBoolFormat](https://developer.apple.com/documentation/os/oslogboolformat): Boolean formatting options for log messages.

### Privacy Controls
- [OSLogPrivacy](https://developer.apple.com/documentation/os/oslogprivacy): Privacy options for log message values.
- [OSLogPrivacy.public](https://developer.apple.com/documentation/os/oslogprivacy/public): Makes a private value public in logs.
- [OSLogPrivacy.private](https://developer.apple.com/documentation/os/oslogprivacy/private): Marks a value as private in logs.
- [OSLogPrivacy.Mask.hash](https://developer.apple.com/documentation/os/oslogprivacy/mask/hash): Replaces private values with a hash for correlation.

### Performance Logging with Signposts
- [Recording Performance Data](https://developer.apple.com/documentation/os/recording-performance-data): Add signposts to record interesting time-based events.
- [OSSignposter Structure](https://developer.apple.com/documentation/os/ossignposter): An object for measuring task performance using the unified logging system.
- [OSSignposter.init()](https://developer.apple.com/documentation/os/ossignposter/init()): Creates a signposter that uses the default subsystem.
- [OSSignposter.init(subsystem:category:)](https://developer.apple.com/documentation/os/ossignposter/init(subsystem:category:)-94xpb): Creates a signposter that uses the specified subsystem and category.
- [OSSignposter.init(logger:)](https://developer.apple.com/documentation/os/ossignposter/init(logger:)): Creates a signposter that uses the subsystem and category of an existing logger.
- [OSSignposter.disabled](https://developer.apple.com/documentation/os/ossignposter/disabled): A shared signposter that doesn't emit signposts at runtime.

### Signpost Operations
- [OSSignpostID Structure](https://developer.apple.com/documentation/os/ossignpostid): An identifier that disambiguates signposted intervals.
- [OSSignposter.makeSignpostID()](https://developer.apple.com/documentation/os/ossignposter/makesignpostid()): Returns an identifier that's unique within the scope of the signposter.
- [OSSignposter.makeSignpostID(from:)](https://developer.apple.com/documentation/os/ossignposter/makesignpostid(from:)): Returns an identifier that the signposter derives from the specified object.
- [OSSignposter.beginInterval(_:id:)](https://developer.apple.com/documentation/os/ossignposter/begininterval(_:id:)): Begins a signposted interval.
- [OSSignposter.endInterval(_:_:)](https://developer.apple.com/documentation/os/ossignposter/endinterval(_:_:)): Ends the signposted interval that corresponds to the specified name and state.
- [OSSignposter.withIntervalSignpost(_:id:around:)](https://developer.apple.com/documentation/os/ossignposter/withintervalsignpost(_:id:around:)): Measures the execution of the specified closure.
- [OSSignposter.emitEvent(_:id:)](https://developer.apple.com/documentation/os/ossignposter/emitevent(_:id:)): Marks a point of interest in time.

### Signpost State Management
- [OSSignpostIntervalState Class](https://developer.apple.com/documentation/os/ossignpostintervalstate): An object that tracks the state of a signposted interval.
- [OSSignpostType Structure](https://developer.apple.com/documentation/os/ossignposttype): The different kinds of signpost.
- [OSSignpostType.begin](https://developer.apple.com/documentation/os/ossignposttype/begin): A signpost that marks the start of a time interval of interest in your code.
- [OSSignpostType.end](https://developer.apple.com/documentation/os/ossignposttype/end): A signpost that marks the end of a time interval of interest in your code.
- [OSSignpostType.event](https://developer.apple.com/documentation/os/ossignposttype/event): A signpost that marks an event in your code.

### Console Integration
- [Console App Documentation](https://developer.apple.com/documentation/os/logging#topics): Use the Console app for a graphical interface to read and sort through log data.
- [log Command-Line Tool](https://developer.apple.com/documentation/os/viewing-log-messages): Use the log tool to retrieve log messages from a command-line.
- [Xcode Debug Console](https://developer.apple.com/documentation/os/viewing-log-messages): When running with the debugger attached, Xcode automatically displays logged messages.

### OSLog Framework Access
- [OSLog Framework](https://developer.apple.com/documentation/OSLog): Access log messages programmatically using the OSLog framework.
- [OSLogStore](https://developer.apple.com/documentation/oslog/oslogstore): A set of methods for retrieving log information from the unified logging system.
- [OSLogEntry](https://developer.apple.com/documentation/oslog/oslogentry): A single entry in the unified logging system.

### Legacy Symbols
- [Legacy Signpost Symbols](https://developer.apple.com/documentation/os/legacy-signpost-symbols): Migrate your code away from using these legacy symbols.
- [os_signpost(_:dso:log:name:signpostID:)](https://developer.apple.com/documentation/os/os_signpost(_:dso:log:name:signpostid:)-2oz8u): Deprecated signpost function.
- [OSSignpostAnimationBegin](https://developer.apple.com/documentation/os/ossignpostanimationbegin): Deprecated animation signpost options.

## Key Features

### Log Levels (in increasing order of severity)
1. **Debug**: Captures verbose information during development (not persisted to disk)
2. **Info**: Captures helpful but not essential information (persisted only with log tool)
3. **Notice (Default)**: Captures essential troubleshooting information (persisted to disk)
4. **Error**: Captures errors during execution (persisted to disk)
5. **Fault**: Captures faults and bugs in code (persisted to disk)

### Privacy Features
- Automatic redaction of dynamic strings and complex objects
- Public/private modifiers for controlling data visibility
- Hash masks for correlating log messages while protecting privacy

### Performance Measurement
- Signposts for measuring task duration
- Animation-specific signpost support
- Cross-process signpost support with serializable state

### Formatting Options
- Custom formatting for integers (decimal, hex, octal)
- Floating-point formatting (fixed, exponential, hybrid)
- Boolean formatting (true/false, yes/no)
- String alignment and width specification
- Built-in formatters for time values, byte sizes, and UUIDs

## Best Practices
- Use reverse-DNS notation for subsystem strings (e.g., com.example.myapp)
- Choose appropriate log levels based on message severity
- Protect user privacy by marking sensitive data as private
- Use signposts to measure performance-critical code sections
- Include static strings and avoid dynamic content when possible