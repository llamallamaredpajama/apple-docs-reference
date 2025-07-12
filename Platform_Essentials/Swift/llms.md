# https://developer.apple.com/documentation/swift llms.txt

## Swift 6.0 and Strict Concurrency
- [Swift Updates](https://developer.apple.com/documentation/Updates/Swift): Learn about important changes to Swift.
- [Adopting strict concurrency in Swift 6 apps](https://developer.apple.com/documentation/swift/adoptingswift6): Enable strict concurrency checking to find data races at compile time.
- [Swift Language Documentation](https://developer.apple.com/documentation/swift): Build apps using a powerful open language.

## Swift Standard Library
- [Swift Standard Library](https://developer.apple.com/documentation/swift/swift-standard-library): Solve complex problems and write high-performance, readable code.
- [Int](https://developer.apple.com/documentation/swift/int): A signed integer value type.
- [Double](https://developer.apple.com/documentation/swift/double): A double-precision, floating-point value type.
- [String](https://developer.apple.com/documentation/swift/string): A Unicode string value that is a collection of characters.
- [Array](https://developer.apple.com/documentation/swift/array): An ordered, random-access collection.
- [Dictionary](https://developer.apple.com/documentation/swift/dictionary): A collection whose elements are key-value pairs.

## Actor Model and Distributed Actors
- [Distributed](https://developer.apple.com/documentation/distributed): Build systems that run distributed code across multiple processes and devices.
- [Actor](https://developer.apple.com/documentation/swift/actor): A reference type that provides synchronized access to its mutable state.
- [GlobalActor](https://developer.apple.com/documentation/swift/globalactor): A type that represents a globally-unique actor that can be used to isolate shared mutable state.
- [MainActor](https://developer.apple.com/documentation/swift/mainactor): A singleton actor whose executor is the main thread.

## Observation Framework
- [Observation](https://developer.apple.com/documentation/observation): Create and manage observable objects in Swift.
- [Observable](https://developer.apple.com/documentation/observation/observable): A protocol that defines an observable object.
- [ObservationTracking](https://developer.apple.com/documentation/observation/observationtracking): Track changes to observable objects.
- [ObservationRegistrar](https://developer.apple.com/documentation/observation/observationregistrar): Register observation of observable objects.

## Async/Await Patterns
- [Task](https://developer.apple.com/documentation/swift/task): A unit of asynchronous work.
- [TaskGroup](https://developer.apple.com/documentation/swift/taskgroup): A group of asynchronous tasks that run concurrently.
- [AsyncSequence](https://developer.apple.com/documentation/swift/asyncsequence): A protocol for types that provide asynchronous sequential access to their elements.
- [AsyncStream](https://developer.apple.com/documentation/swift/asyncstream): An asynchronous sequence generated from a closure that calls a continuation.
- [TaskPriority](https://developer.apple.com/documentation/swift/taskpriority): The priority of a task in a Swift concurrency task hierarchy.
- [Calling Objective-C APIs Asynchronously](https://developer.apple.com/documentation/swift/calling-objective-c-apis-asynchronously): Learn how functions and methods that take a completion handler are converted to Swift asynchronous functions.

## Property Wrappers
- [PropertyWrapper](https://developer.apple.com/documentation/swift/propertywrapper): A protocol that defines a property wrapper type.
- [State](https://developer.apple.com/documentation/swiftui/state): A property wrapper type that can read and write a value managed by SwiftUI.
- [Binding](https://developer.apple.com/documentation/swiftui/binding): A property wrapper type that can read and write a value owned by a source of truth.
- [Published](https://developer.apple.com/documentation/combine/published): A property wrapper that publishes changes to its wrapped value.
- [AppStorage](https://developer.apple.com/documentation/swiftui/appstorage): A property wrapper type that reflects a value from UserDefaults.

## Result Builders
- [ResultBuilder](https://developer.apple.com/documentation/swift/resultbuilder): A protocol used to define a result builder type.
- [RegexBuilder](https://developer.apple.com/documentation/regexbuilder): Use an expressive domain-specific language to build regular expressions.
- [ViewBuilder](https://developer.apple.com/documentation/swiftui/viewbuilder): A custom parameter attribute that constructs views from closures.

## Generics and Protocols
- [Protocol](https://developer.apple.com/documentation/swift/protocol): A blueprint of methods, properties, and other requirements.
- [Equatable](https://developer.apple.com/documentation/swift/equatable): A type that can be compared for value equality.
- [Comparable](https://developer.apple.com/documentation/swift/comparable): A type that can be compared using relational operators.
- [Hashable](https://developer.apple.com/documentation/swift/hashable): A type that can be hashed into a Hasher to produce an integer hash value.
- [Codable](https://developer.apple.com/documentation/swift/codable): A type that can convert itself into and out of an external representation.
- [Sendable](https://developer.apple.com/documentation/swift/sendable): A type whose values can safely be passed across concurrency domains.
- [Adopting Common Protocols](https://developer.apple.com/documentation/swift/adopting-common-protocols): Make your custom types easier to use by ensuring that they conform to Swift protocols.

## Data Modeling
- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes): Decide how to store data and model behavior.
- [Maintaining State in Your Apps](https://developer.apple.com/documentation/swift/maintaining-state-in-your-apps): Use enumerations to capture and track the state of your app.

## Control Flow
- [Preventing Timing Problems When Using Closures](https://developer.apple.com/documentation/swift/preventing-timing-problems-when-using-closures): Understand how different API calls to your closures can affect your app.

## Low-Level Operations
- [Synchronization](https://developer.apple.com/documentation/synchronization): Build synchronization constructs using low-level, primitive operations.

## Language Interoperability
- [Objective-C and C Code Customization](https://developer.apple.com/documentation/swift/objective-c-and-c-code-customization): Apply macros to your Objective-C APIs to customize how they're imported into Swift.
- [Migrating Your Objective-C Code to Swift](https://developer.apple.com/documentation/swift/migrating-your-objective-c-code-to-swift): Learn the recommended steps to migrate your code.
- [Cocoa Design Patterns](https://developer.apple.com/documentation/swift/cocoa-design-patterns): Adopt and interoperate with Cocoa design patterns in your Swift apps.
- [Handling Dynamically Typed Methods and Objects in Swift](https://developer.apple.com/documentation/swift/handling-dynamically-typed-methods-and-objects-in-swift): Cast instances of the Objective-C id type to a specific Swift type.
- [Using Objective-C Runtime Features in Swift](https://developer.apple.com/documentation/swift/using-objective-c-runtime-features-in-swift): Use selectors and key paths to interact with dynamic Objective-C APIs.
- [Imported C and Objective-C APIs](https://developer.apple.com/documentation/swift/imported-c-and-objective-c-apis): Use native Swift syntax to interoperate with types and functions in C and Objective-C.
- [Mixing Languages in an Xcode project](https://developer.apple.com/documentation/swift/mixinglanguagesinanxcodeproject): Use C++ APIs in Swift – and Swift APIs in C++ – in a single framework target.
- [Calling APIs Across Language Boundaries](https://developer.apple.com/documentation/swift/callingapisacrosslanguageboundaries): Use a variety of C++ APIs in Swift – and vice-versa – across multiple targets and frameworks.

## Additional Resources
- [The Swift Programming Language](https://docs.swift.org/swift-book/): Official Swift language guide and reference manual.
- [Swift.org](https://swift.org/): Open source Swift project and community.