# Swift Language Documentation - Full Content

This file contains the complete content scraped from the most important Swift language documentation pages.

## Table of Contents

1. [Swift Framework Overview](#swift-framework-overview)
2. [Swift Updates](#swift-updates)
3. [Adopting Swift 6 and Strict Concurrency](#adopting-swift-6-and-strict-concurrency)
4. [Actor Model](#actor-model)
5. [Tasks and Async/Await](#tasks-and-asyncawait)
6. [Observable and Observation Framework](#observable-and-observation-framework)
7. [AsyncSequence](#asyncsequence)
8. [Codable Protocol](#codable-protocol)
9. [Sendable Protocol](#sendable-protocol)
10. [Choosing Between Structures and Classes](#choosing-between-structures-and-classes)
11. [RegexBuilder](#regexbuilder)
12. [The Swift Programming Language Book](#the-swift-programming-language-book)

---

## Swift Framework Overview

Source: https://developer.apple.com/documentation/swift

Build apps using a powerful open language.

iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+

### Overview

Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.

```swift
var interestingNumbers = [
    "primes": [2, 3, 5, 7, 11, 13, 17],
    "triangular": [1, 3, 6, 10, 15, 21, 28],
    "hexagonal": [1, 6, 15, 28, 45, 66, 91]
]

for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}

print(interestingNumbers["primes"]!)
// Prints "[17, 13, 11, 7, 5, 3, 2]"
```

### Learn Swift

If you're new to Swift, read [The Swift Programming Language](https://docs.swift.org/swift-book/) for a quick tour, a comprehensive language guide, and a full reference manual. If you're new to programming, check out [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) on iPad.

Swift is developed in the open. To learn more about the open source Swift project and community, visit [Swift.org](https://swift.org/).

---

## Swift Updates

Source: https://developer.apple.com/documentation/Updates/Swift

Learn about important changes to Swift.

### Overview

Browse notable changes in Swift. For information about Swift language changes, refer to [The Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/revisionhistory).

### June 2024

#### Swift standard library

- Operate on noncontiguous ranges in collections using `RangeSet` and `DiscontiguousSlice`.
- Control which executor runs a task using `TaskExecutor`.
- Validate that C strings contain well-formed Unicode text when converting to them to `String` with `init(validatingCString:)` and `init(validating:as:)`.
- Preserve more information about thrown errors from `AsyncSequence` and `AsyncIteratorProtocol` using their `Failure` associated type.

---

## Adopting Swift 6 and Strict Concurrency

Source: https://developer.apple.com/documentation/swift/adoptingswift6

Enable strict concurrency checking to find data races at compile time.

### Overview

Strict concurrency checking in the Swift 6 language mode helps you find and fix data races at compile time.

Overlapping access to shared mutable state creates the risk for data races. Data races can cause your app to crash, misbehave, or corrupt user data. Because data races depend on the ordering of concurrent operations, they can be very difficult to reproduce and debug. Strict concurrency checking lets you confirm, when you compile your app, that its code is free from data races. When you identify a data race, you fix it by eliminating overlapping access, shared access, or mutable state.

For information about the language-level concurrency model in Swift, see [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) in _The Swift Programming Language_.

### Decide when to upgrade to strict checking

Xcode 16 supports the new Swift 6 language mode, which uses strict checking for concurrency, and it also still includes the Swift 5, 4.2, and 4 language modes. The Swift 6 language mode is opt-in: Your projects continue to build with their current language mode, and new projects default to the Swift 5 language mode.

Adopting the Swift 6 language mode can significantly improve the quality of your app by catching mistakes in concurrent code at compile time. It can be especially useful if you're experiencing hard-to-reproduce crashes and want to methodically eliminate the risk of data races. If you're actively working on integrating more concurrency to improve responsiveness and performance, adopting the Swift 6 language mode can ensure that those changes don't risk introducing new data races.

If your app is organized into multiple modules, you can migrate your code one module at a time. It's usually easier to migrate the app first, and the migrate the modules it depends on.

If you maintain a public Swift package, adopting the Swift 6 language mode helps your users who want to migrate their codebases too. You can follow along on the adoption of the Swift 6 language in popular packages on `SwiftPackageIndex.com`.

### Upgrade a project to Swift 6

You can start using new features from Swift 6, like strict concurrency checking, before upgrading your project to the Swift 6 language mode. To enable new language features, open your build settings, and choose Swift Compiler - Upcoming Features; then select Yes next to the features you want to adopt. As you prepare to upgrade to the Swift 6 language version, you can increase the level of concurrency checking by changing the Strict Concurrency Checking build setting from Minimal to Complete.

To upgrade your project to the Swift 6 language mode, open your build settings, and choose Swift Compiler - Language > Swift Language Version.

Upgrading to the Swift 6 language mode enables all of the new language features that are part of Swift 6, including strict concurrency checking.

After you turn on strict concurrency checking, you might see a large number of new compiler errors and warnings. However, fixing the data race in one part of your app often resolves multiple reported errors. You don't have to fix all of the reported data races at once. If you need to, you can fix some of them now, switch back to the Swift 5 language mode or switch back to minimal concurrency checking, and then continue fixing the remaining data races later.

For information about how to migrate, including techniques for interoperating with code that hasn't yet migrated to strict checking, see [Migrating to Swift 6](https://swift.org/migration).

---

## Actor Model

Source: https://developer.apple.com/documentation/swift/actor

Common protocol to which all actors conform.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+

```swift
protocol Actor : AnyObject, Sendable
```

### Overview

The `Actor` protocol generalizes over all `actor` types. Actor types implicitly conform to this protocol.

### Actors and SerialExecutors

By default, actors execute tasks on a shared global concurrency thread pool. This pool is shared by all default actors and tasks, unless an actor or task specified a more specific executor requirement.

It is possible to configure an actor to use a specific `SerialExecutor`, as well as impact the scheduling of default tasks and actors by using a `TaskExecutor`.

---

## Tasks and Async/Await

Source: https://developer.apple.com/documentation/swift/task

A unit of asynchronous work.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+

```swift
@frozen
struct Task<Success, Failure> where Success : Sendable, Failure : Error
```

### Overview

When you create an instance of `Task`, you provide a closure that contains the work for that task to perform. Tasks can start running immediately after creation; you don't explicitly start or schedule them. After creating a task, you use the instance to interact with it — for example, to wait for it to complete or to cancel it. It's not a programming error to discard a reference to a task without waiting for that task to finish or canceling it. A task runs regardless of whether you keep a reference to it. However, if you discard the reference to a task, you give up the ability to wait for that task's result or cancel the task.

To support operations on the current task, which can be either a detached task or child task, `Task` also exposes class methods like `yield()`. Because these methods are asynchronous, they're always invoked as part of an existing task.

Only code that's running as part of the task can interact with that task. To interact with the current task, you call one of the static methods on `Task`.

A task's execution can be seen as a series of periods where the task ran. Each such period ends at a suspension point or the completion of the task. These periods of execution are represented by instances of `PartialAsyncTask`. Unless you're implementing a custom executor, you don't directly interact with partial tasks.

For information about the language-level concurrency model that `Task` is part of, see [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) in [The Swift Programming Language](https://docs.swift.org/swift-book/).

### Task Cancellation

Tasks include a shared mechanism for indicating cancellation, but not a shared implementation for how to handle cancellation. Depending on the work you're doing in the task, the correct way to stop that work varies. Likewise, it's the responsibility of the code running as part of the task to check for cancellation whenever stopping is appropriate. In a long-task that includes multiple pieces, you might need to check for cancellation at several points, and handle cancellation differently at each point. If you only need to throw an error to stop the work, call the `Task.checkCancellation()` function to check for cancellation. Other responses to cancellation include returning the work completed so far, returning an empty result, or returning `nil`.

Cancellation is a purely Boolean state; there's no way to include additional information like the reason for cancellation. This reflects the fact that a task can be canceled for many reasons, and additional reasons can accrue during the cancellation process.

### Task closure lifetime

Tasks are initialized by passing a closure containing the code that will be executed by a given task.

After this code has run to completion, the task has completed, resulting in either a failure or result value, this closure is eagerly released.

Retaining a task object doesn't indefinitely retain the closure, because any references that a task holds are released after the task completes. Consequently, tasks rarely need to capture weak references to values.

---

## Observable and Observation Framework

Source: https://developer.apple.com/documentation/observation/observable

A type that emits notifications to observers when underlying data changes.

iOS 17.0+iPadOS 17.0+Mac Catalyst 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+

```swift
protocol Observable
```

### Overview

Conforming to this protocol signals to other APIs that the type supports observation. However, applying the `Observable` protocol by itself to a type doesn't add observation functionality to the type. Instead, always use the `Observable()` macro when adding observation support to a type.

---

## AsyncSequence

Source: https://developer.apple.com/documentation/swift/asyncsequence

A type that provides asynchronous, sequential, iterated access to its elements.

iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+

```swift
protocol AsyncSequence<Element, Failure>
```

### Overview

An `AsyncSequence` resembles the `Sequence` type — offering a list of values you can step through one at a time — and adds asynchronicity. An `AsyncSequence` may have all, some, or none of its values available when you first use it. Instead, you use `await` to receive values as they become available.

As with `Sequence`, you typically iterate through an `AsyncSequence` with a `for await`- `in` loop. However, because the caller must potentially wait for values, you use the `await` keyword. The following example shows how to iterate over `Counter`, a custom `AsyncSequence` that produces `Int` values from `1` up to a `howHigh` value:

```swift
for await number in Counter(howHigh: 10) {
    print(number, terminator: " ")
}
// Prints "1 2 3 4 5 6 7 8 9 10 "
```

An `AsyncSequence` doesn't generate or contain the values; it just defines how you access them. Along with defining the type of values as an associated type called `Element`, the `AsyncSequence` defines a `makeAsyncIterator()` method. This returns an instance of type `AsyncIterator`. Like the standard `IteratorProtocol`, the `AsyncIteratorProtocol` defines a single `next()` method to produce elements. The difference is that the `AsyncIterator` defines its `next()` method as `async`, which requires a caller to wait for the next value with the `await` keyword.

`AsyncSequence` also defines methods for processing the elements you receive, modeled on the operations provided by the basic `Sequence` in the standard library. There are two categories of methods: those that return a single value, and those that return another `AsyncSequence`.

Single-value methods eliminate the need for a `for await`- `in` loop, and instead let you make a single `await` call. For example, the `contains(_:)` method returns a Boolean value that indicates if a given value exists in the `AsyncSequence`. Given the `Counter` sequence from the previous example, you can test for the existence of a sequence member with a one-line call:

```swift
let found = await Counter(howHigh: 10).contains(5) // true
```

Methods that return another `AsyncSequence` return a type specific to the method's semantics. For example, the `.map(_:)` method returns a `AsyncMapSequence` (or a `AsyncThrowingMapSequence`, if the closure you provide to the `map(_:)` method can throw an error). These returned sequences don't eagerly await the next member of the sequence, which allows the caller to decide when to start work. Typically, you'll iterate over these sequences with `for await`- `in`, like the base `AsyncSequence` you started with.

---

## Codable Protocol

Source: https://developer.apple.com/documentation/swift/codable

A type that can convert itself into and out of an external representation.

iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+

```swift
typealias Codable = Decodable & Encodable
```

### Discussion

`Codable` is a type alias for the `Encodable` and `Decodable` protocols. When you use `Codable` as a type or a generic constraint, it matches any type that conforms to both protocols.

---

## Sendable Protocol

Source: https://developer.apple.com/documentation/swift/sendable

A thread-safe type whose values can be shared across arbitrary concurrent contexts without introducing a risk of data races.

iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+

```swift
protocol Sendable : SendableMetatype
```

### Overview

Values of the type may have no shared mutable state, or they may protect that state with a lock or by forcing it to only be accessed from a specific actor.

You can safely pass values of a sendable type from one concurrency domain to another — for example, you can pass a sendable value as the argument when calling an actor's methods. All of the following can be marked as sendable:

- Value types
- Reference types with no mutable storage
- Reference types that internally manage access to their state
- Functions and closures (by marking them with `@Sendable`)

Although this protocol doesn't have any required methods or properties, it does have semantic requirements that are enforced at compile time. These requirements are listed in the sections below. Conformance to `Sendable` must be declared in the same file as the type's declaration.

To declare conformance to `Sendable` without any compiler enforcement, write `@unchecked Sendable`. You are responsible for the correctness of unchecked sendable types, for example, by protecting all access to its state with a lock or a queue. Unchecked conformance to `Sendable` also disables enforcement of the rule that conformance must be in the same file.

For information about the language-level concurrency model that `Task` is part of, see [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) in [The Swift Programming Language](https://docs.swift.org/swift-book/).

### Sendable Structures and Enumerations

To satisfy the requirements of the `Sendable` protocol, an enumeration or structure must have only sendable members and associated values. In some cases, structures and enumerations that satisfy the requirements implicitly conform to `Sendable`:

- Frozen structures and enumerations
- Structures and enumerations that aren't public and aren't marked `@usableFromInline`.

Otherwise, you need to declare conformance to `Sendable` explicitly.

Structures that have nonsendable stored properties and enumerations that have nonsendable associated values can be marked as `@unchecked Sendable`, disabling compile-time correctness checks, after you manually verify that they satisfy the `Sendable` protocol's semantic requirements.

### Sendable Actors

All actor types implicitly conform to `Sendable` because actors ensure that all access to their mutable state is performed sequentially.

### Sendable Classes

To satisfy the requirements of the `Sendable` protocol, a class must:

- Be marked `final`
- Contain only stored properties that are immutable and sendable
- Have no superclass or have `NSObject` as the superclass

Classes marked with `@MainActor` are implicitly sendable, because the main actor coordinates all access to its state. These classes can have stored properties that are mutable and nonsendable.

Classes that don't meet the requirements above can be marked as `@unchecked Sendable`, disabling compile-time correctness checks, after you manually verify that they satisfy the `Sendable` protocol's semantic requirements.

### Sendable Functions and Closures

Instead of conforming to the `Sendable` protocol, you mark sendable functions and closures with the `@Sendable` attribute. Any values that the function or closure captures must be sendable. In addition, sendable closures must use only by-value captures, and the captured values must be of a sendable type.

In a context that expects a sendable closure, a closure that satisfies the requirements implicitly conforms to `Sendable` — for example, in a call to `Task.detached(priority:operation:)`.

You can explicitly mark a closure as sendable by writing `@Sendable` as part of a type annotation, or by writing `@Sendable` before the closure's parameters — for example:

```swift
let sendableClosure = { @Sendable (number: Int) -> String in
    if number > 12 {
        return "More than a dozen."
    } else {
        return "Less than a dozen"
    }
}
```

### Sendable Tuples

To satisfy the requirements of the `Sendable` protocol, all of the elements of the tuple must be sendable. Tuples that satisfy the requirements implicitly conform to `Sendable`.

### Sendable Metatypes

Metatypes such as `Int.Type` implicitly conform to the `Sendable` protocol.

---

## Choosing Between Structures and Classes

Source: https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes

Decide how to store data and model behavior.

### Overview

Structures and classes are good choices for storing data and modeling behavior in your apps, but their similarities can make it difficult to choose one over the other.

Consider the following recommendations to help choose which option makes sense when adding a new data type to your app.

- Use structures by default.
- Use classes when you need Objective-C interoperability.
- Use classes when you need to control the identity of the data you're modeling.
- Use structures along with protocols to adopt behavior by sharing implementations.

### Choose Structures by Default

Use structures to represent common kinds of data. Structures in Swift include many features that are limited to classes in other languages: They can include stored properties, computed properties, and methods. Moreover, Swift structures can adopt protocols to gain behavior through default implementations. The Swift standard library and Foundation use structures for types you use frequently, such as numbers, strings, arrays, and dictionaries.

Using structures makes it easier to reason about a portion of your code without needing to consider the whole state of your app. Because structures are value types—unlike classes—local changes to a structure aren't visible to the rest of your app unless you intentionally communicate those changes as part of the flow of your app. As a result, you can look at a section of code and be more confident that changes to instances in that section will be made explicitly, rather than being made invisibly from a tangentially related function call.

### Use Classes When You Need Objective-C Interoperability

If you use an Objective-C API that needs to process your data, or you need to fit your data model into an existing class hierarchy defined in an Objective-C framework, you might need to use classes and class inheritance to model your data. For example, many Objective-C frameworks expose classes that you are expected to subclass.

### Use Classes When You Need to Control Identity

Classes in Swift come with a built-in notion of identity because they're reference types. This means that when two different class instances have the same value for each of their stored properties, they're still considered to be different by the identity operator ( `===`). It also means that when you share a class instance across your app, changes you make to that instance are visible to every part of your code that holds a reference to that instance. Use classes when you need your instances to have this kind of identity. Common use cases are file handles, network connections, and shared hardware intermediaries like `CBCentralManager`.

For example, if you have a type that represents a local database connection, the code that manages access to that database needs full control over the state of the database as viewed from your app. It's appropriate to use a class in this case, but be sure to limit which parts of your app get access to the shared database object.

### Use Structures When You Don't Control Identity

Use structures when you're modeling data that contains information about an entity with an identity that you don't control.

In an app that consults a remote database, for example, an instance's identity may be fully owned by an external entity and communicated by an identifier. If the consistency of an app's models is stored on a server, you can model records as structures with identifiers. In the example below, `jsonResponse` contains an encoded `PenPalRecord` instance from a server:

```swift
struct PenPalRecord {
    let myID: Int
    var myNickname: String
    var recommendedPenPalID: Int
}

var myRecord = try JSONDecoder().decode(PenPalRecord.self, from: jsonResponse)
```

Local changes to model types like `PenPalRecord` are useful. For example, an app might recommend multiple different penpals in response to user feedback. Because the `PenPalRecord` structure doesn't control the identity of the underlying database records, there's no risk that the changes made to local `PenPalRecord` instances accidentally change values in the database.

If another part of the app changes `myNickname` and submits a change request back to the server, the most recently rejected penpal recommendation won't be mistakenly picked up by the change. Because the `myID` property is declared as a constant, it can't change locally. As a result, requests to the database won't accidentally change the wrong record.

### Use Structures and Protocols to Model Inheritance and Share Behavior

Structures and classes both support a form of inheritance. Structures and protocols can only adopt protocols; they can't inherit from classes. However, the kinds of inheritance hierarchies you can build with class inheritance can be also modeled using protocol inheritance and structures.

If you're building an inheritance relationship from scratch, prefer protocol inheritance. Protocols permit classes, structures, and enumerations to participate in inheritance, while class inheritance is only compatible with other classes. When you're choosing how to model your data, try building the hierarchy of data types using protocol inheritance first, then adopt those protocols in your structures.

---

## RegexBuilder

Source: https://developer.apple.com/documentation/regexbuilder

Use an expressive domain-specific language to build regular expressions, for operations like searching and replacing in text.

iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+tvOS 16.0+watchOS 9.0+

### Overview

Regular expressions, also known as regexes, are a powerful tool for matching patterns in text. Swift supports several ways to create a regular expression, including from a string, as a literal, and using this DSL. For example:

```swift
let word = OneOrMore(.word)
let emailPattern = Regex {
    Capture {
        ZeroOrMore {
            word
            "."
        }
        word
    }
    "@"
    Capture {
        word
        OneOrMore {
            "."
            word
        }
    }
}

let text = "My email is my.name@example.com."
if let match = text.firstMatch(of: emailPattern) {
    let (wholeMatch, name, domain) = match.output
    // wholeMatch is "my.name@example.com"
    // name is "my.name"
    // domain is "example.com"
}
```

---

## The Swift Programming Language Book

Source: https://docs.swift.org/swift-book/

The Swift Programming Language (6.2)

### Topics

#### Welcome to Swift

- **About Swift**: Understand the high-level goals of the language.
- **Version Compatibility**: Learn what functionality is available in older language modes.
- **A Swift Tour**: Explore the features and syntax of Swift.

#### Language Guide

- **The Basics**: Work with common kinds of data and write basic syntax.
- **Basic Operators**: Perform operations like assignment, arithmetic, and comparison.
- **Strings and Characters**: Store and manipulate text.
- **Collection Types**: Organize data using arrays, sets, and dictionaries.
- **Control Flow**: Structure code with branches, loops, and early exits.
- **Functions**: Define and call functions, label their arguments, and use their return values.
- **Closures**: Group code that executes together, without creating a named function.
- **Enumerations**: Model custom types that define a list of possible values.
- **Structures and Classes**: Model custom types that encapsulate data.
- **Properties**: Access stored and computed values that are part of an instance or type.
- **Methods**: Define and call functions that are part of an instance or type.
- **Subscripts**: Access the elements of a collection.
- **Inheritance**: Subclass to add or override functionality.
- **Initialization**: Set the initial values for a type's stored properties and perform one-time setup.
- **Deinitialization**: Release resources that require custom cleanup.
- **Optional Chaining**: Access members of an optional value without unwrapping.
- **Error Handling**: Respond to and recover from errors.
- **Concurrency**: Perform asynchronous operations.
- **Macros**: Use macros to generate code at compile time.
- **Type Casting**: Determine a value's runtime type and give it more specific type information.
- **Nested Types**: Define types inside the scope of another type.
- **Extensions**: Add functionality to an existing type.
- **Protocols**: Define requirements that conforming types must implement.
- **Generics**: Write code that works for multiple types and specify requirements for those types.
- **Opaque and Boxed Protocol Types**: Hide implementation details about a value's type.
- **Automatic Reference Counting**: Model the lifetime of objects and their relationships.
- **Memory Safety**: Structure your code to avoid conflicts when accessing memory.
- **Access Control**: Manage the visibility of code by declaration, file, and module.
- **Advanced Operators**: Define custom operators, perform bitwise operations, and use builder syntax.

#### Language Reference

- **About the Language Reference**: Read the notation that the formal grammar uses.
- **Lexical Structure**: Use the lowest-level components of the syntax.
- **Types**: Use built-in named and compound types.
- **Expressions**: Access, modify, and assign values.
- **Statements**: Group expressions and control the flow of execution.
- **Declarations**: Introduce types, operators, variables, and other names and constructs.
- **Attributes**: Add information to declarations and types.
- **Patterns**: Match and destructure values.
- **Generic Parameters and Arguments**: Generalize declarations to abstract away concrete types.
- **Summary of the Grammar**: Read the whole formal grammar.

#### Revision History

- **Document Revision History**: Review the recent changes to this book.

---

## Swift Standard Library

Source: https://developer.apple.com/documentation/swift/swift-standard-library

Solve complex problems and write high-performance, readable code.

### Overview

The Swift standard library defines a base layer of functionality for writing Swift programs, including:

- Fundamental data types such as `Int`, `Double`, and `String`
- Common data structures such as `Array`, `Dictionary`, and `Set`
- Global functions such as `print(_:separator:terminator:)` and `abs(_:)`
- Protocols, such as `Collection` and `Equatable`, that describe common abstractions.
- Protocols, such as `CustomDebugStringConvertible` and `CustomReflectable`, that you use to customize operations that are available to all types.
- Protocols, such as `OptionSet`, that you use to provide implementations that would otherwise require boilerplate code.

### Topics

#### Values and Collections

- **Numbers and Basic Values**: Model data with numbers, Boolean values, and other fundamental types.
- **Strings and Text**: Work with text using Unicode-safe strings.
- **Collections**: Store and organize data using arrays, dictionaries, sets, and other data structures.
- **Time**: Measure how long an operation takes and determine schedules in the future.

#### Tools for Your Types

- **Basic Behaviors**: Use your custom types in operations that depend on testing for equality or order and as members of sets and dictionaries.
- **Encoding, Decoding, and Serialization**: Serialize and deserialize instances of your types with implicit or customized encoding.
- **Initialization with Literals**: Allow values of your type to be expressed using different kinds of literals.

#### Programming Tasks

- **Input and Output**: Print values to the console, read from and write to text streams, and use command line arguments.
- **Debugging and Reflection**: Fortify your code with runtime checks, and examine your values' runtime representation.
- **Macros**: Generate boilerplate code and perform other compile-time operations.
- **Concurrency**: Perform asynchronous and parallel operations.
- **Key-Path Expressions**: Use key-path expressions to access properties dynamically.
- **Manual Memory Management**: Allocate and manage memory manually.
- **Type Casting and Existential Types**: Perform casts between types or represent values of any type.
- **C Interoperability**: Use imported C types or call C variadic functions.
- **Operator Declarations**: Work with prefix, postfix, and infix operators.

---

This comprehensive documentation provides a complete reference for Swift language features, including Swift 6.0's strict concurrency, the actor model, async/await patterns, property wrappers, result builders, generics, and much more. The content covers both the core language features and the standard library, making it an essential resource for Swift developers.