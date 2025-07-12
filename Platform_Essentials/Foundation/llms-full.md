# Foundation Framework - Full Documentation

## Foundation Framework Overview
https://developer.apple.com/documentation/foundation

The Foundation framework provides a base layer of functionality for apps and frameworks, including data storage and persistence, text processing, date and time calculations, sorting and filtering, and networking. The classes, protocols, and data types defined by Foundation are used throughout the macOS, iOS, watchOS, and tvOS SDKs.

### Topics

#### Fundamentals
- **Numbers, Data, and Basic Values**: Work with primitive values and other fundamental types used throughout Cocoa.
- **Strings and Text**: Create and process strings of Unicode characters, use regular expressions to find patterns, and perform natural language analysis of text.
- **Collections**: Use arrays, dictionaries, sets, and specialized collections to store and iterate groups of objects or values.
- **Dates and Times**: Compare dates and times, and perform calendar and time zone calculations.
- **Units and Measurement**: Label numeric quantities with physical dimensions to allow locale-aware formatting and conversion between related units.
- **Data Formatting**: Convert numbers, dates, measurements, and other values to and from locale-aware string representations.
- **Filters and Sorting**: Use predicates, expressions, and sort descriptors to examine elements in collections and other services.

#### App Support
- **Task Management**: Manage your app's work and how it interacts with system services like Handoff and Shortcuts.
- **Resources**: Access assets and other data bundled with your app.
- **Notifications**: Design patterns for broadcasting information and for subscribing to broadcasts.
- **App Extension Support**: Manage the interaction between an app extension and its hosting app.
- **Errors and Exceptions**: Respond to problem situations in your interactions with APIs, and fine-tune your app for better debugging.
- **Scripting Support**: Allow users to control your app with AppleScript and other automation technologies, or run scripts from within your app.

#### Files and Data Persistence
- **File System**: Create, read, write, and examine files and folders in the file system.
- **Archives and Serialization**: Convert objects and values to and from property list, JSON, and other flat binary representations.
- **Preferences**: Persistently store domain-scoped pieces of information for configuring your app.
- **Spotlight**: Search for files and other items on the local device, and index your app's content for searching.
- **iCloud**: Manage files and key-value data that automatically synchronize among a user's iCloud devices.

#### Networking
- **URL Loading System**: Interact with URLs and communicate with servers using standard Internet protocols.
- **Bonjour**: Advertise services for easy discovery on local networks, or discover services advertised by others.

#### Low-Level Utilities
- **XPC**: Manage secure interprocess communication.
- **Object Runtime**: Get low-level support for basic Objective-C features, Cocoa design patterns, and Swift integration.
- **Processes and Threads**: Manage your app's interaction with the host operating system and other processes, and implement low-level concurrency features.
- **Streams, Sockets, and Ports**: Use low-level Unix features to manage input and output among files, processes, and the network.

---

## Date
https://developer.apple.com/documentation/foundation/date

A specific point in time, independent of any calendar or time zone.

```swift
struct Date
```

### Overview

A `Date` value encapsulates a single point in time, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.

The `Date` structure provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. Use date values in conjunction with `DateFormatter` instances to create localized representations of dates and times and with `Calendar` instances to perform calendar arithmetic.

`Date` bridges to the `NSDate` class. You can use these interchangeably in code that interacts with Objective-C APIs.

### Key Methods and Properties

#### Creating a Date
- `init()` - Creates a date value initialized to the current date and time.
- `init(timeIntervalSinceNow: TimeInterval)` - Creates a date value initialized relative to the current date and time by a given number of seconds.
- `init(timeInterval: TimeInterval, since: Date)` - Creates a date value initialized relative to another given date by a given number of seconds.
- `init(timeIntervalSinceReferenceDate: TimeInterval)` - Creates a date value initialized relative to 00:00:00 UTC on 1 January 2001 by a given number of seconds.
- `init(timeIntervalSince1970: TimeInterval)` - Creates a date value initialized relative to 00:00:00 UTC on 1 January 1970 by a given number of seconds.

#### Retrieving the Current Date
- `static var now: Date` - Returns a date instance that represents the current date and time, at the moment of access.

#### Getting Temporal Boundaries
- `static let distantFuture: Date` - A date value representing a date in the distant future.
- `static let distantPast: Date` - A date value representing a date in the distant past.

#### Comparing Dates
- `static func == (Date, Date) -> Bool` - Returns true if the two Date values represent the same point in time.
- `static func > (Date, Date) -> Bool` - Returns true if the left hand Date is later in time than the right hand Date.
- `static func < (Date, Date) -> Bool` - Returns true if the left hand Date is earlier in time than the right hand Date.
- `func compare(Date) -> ComparisonResult` - Compares another date to this one.

#### Getting Time Intervals
- `func timeIntervalSince(Date) -> TimeInterval` - Returns the interval between this date and another given date.
- `var timeIntervalSinceNow: TimeInterval` - The time interval between the date value and the current date and time.
- `var timeIntervalSinceReferenceDate: TimeInterval` - The interval between the date value and 00:00:00 UTC on 1 January 2001.
- `var timeIntervalSince1970: TimeInterval` - The interval between the date value and 00:00:00 UTC on 1 January 1970.

#### Formatting a Date
- `func formatted() -> String` - Generates a locale-aware string representation of a date using the default date format style.
- `func formatted(date: Date.FormatStyle.DateStyle, time: Date.FormatStyle.TimeStyle) -> String` - Generates a locale-aware string representation of a date using specified date and time format styles.

---

## URLSession
https://developer.apple.com/documentation/foundation/urlsession

An object that coordinates a group of related, network data transfer tasks.

```swift
class URLSession
```

### Overview

The `URLSession` class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs. Your app can also use this API to perform background downloads when your app isn't running or, in iOS, while your app is suspended. You can use the related `URLSessionDelegate` and `URLSessionTaskDelegate` to support authentication and receive events like redirection and task completion.

Your app creates one or more `URLSession` instances, each of which coordinates a group of related data-transfer tasks. For example, if you're creating a web browser, your app might create one session per tab or window, or one session for interactive use and another for background downloads. Within each session, your app adds a series of tasks, each of which represents a request for a specific URL (following HTTP redirects, if necessary).

### Types of URL Sessions

The tasks within a given URL session share a common session configuration object, which defines connection behavior, like the maximum number of simultaneous connections to make to a single host, whether connections can use the cellular network, and so on.

`URLSession` has a singleton `shared` session (which doesn't have a configuration object) for basic requests. It's not as customizable as sessions you create, but it serves as a good starting point if you have very limited requirements.

For other kinds of sessions, you create a `URLSession` with one of three kinds of configurations:
- A default session behaves much like the shared session, but lets you configure it. You can also assign a delegate to the default session to obtain data incrementally.
- Ephemeral sessions are similar to shared sessions, but don't write caches, cookies, or credentials to disk.
- Background sessions let you perform uploads and downloads of content in the background while your app isn't running.

### Types of URL Session Tasks

Within a session, you create tasks that optionally upload data to a server and then retrieve data from the server either as a file on disk or as one or more `NSData` objects in memory. The `URLSession` API provides four types of tasks:

- Data tasks send and receive data using `NSData` objects. Data tasks are intended for short, often interactive requests to a server.
- Upload tasks are similar to data tasks, but they also send data (often in the form of a file), and support background uploads while the app isn't running.
- Download tasks retrieve data in the form of a file, and support background downloads and uploads while the app isn't running.
- WebSocket tasks exchange messages over TCP and TLS, using the WebSocket protocol defined in RFC 6455.

### Key Methods and Properties

#### Using the Shared Session
- `class var shared: URLSession` - The shared singleton session object.

#### Creating a Session
- `init(configuration: URLSessionConfiguration)` - Creates a session with the specified session configuration.
- `init(configuration: URLSessionConfiguration, delegate: (any URLSessionDelegate)?, delegateQueue: OperationQueue?)` - Creates a session with the specified session configuration, delegate, and operation queue.

#### Performing Asynchronous Transfers
- `func data(for: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)` - Downloads the contents of a URL based on the specified URL request and delivers the data asynchronously.
- `func data(from: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)` - Retrieves the contents of a URL and delivers the data asynchronously.
- `func download(for: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (URL, URLResponse)` - Retrieves the contents of a URL based on the specified URL request and delivers the URL of the saved file asynchronously.
- `func upload(for: URLRequest, from: Data, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)` - Uploads data to a URL based on the specified URL request and delivers the result asynchronously.

#### Adding Data Tasks to a Session
- `func dataTask(with: URL) -> URLSessionDataTask` - Creates a task that retrieves the contents of the specified URL.
- `func dataTask(with: URL, completionHandler: (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask` - Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
- `func dataTask(with: URLRequest) -> URLSessionDataTask` - Creates a task that retrieves the contents of a URL based on the specified URL request object.
- `func dataTask(with: URLRequest, completionHandler: (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask` - Creates a task that retrieves the contents of a URL based on the specified URL request object, and calls a handler upon completion.

### Protocol Support

The `URLSession` class natively supports the `data`, `file`, `ftp`, `http`, and `https` URL schemes, with transparent support for proxy servers and SOCKS gateways, as configured in the user's system preferences.

`URLSession` supports the HTTP/1.1, HTTP/2, and HTTP/3 protocols. HTTP/2 support, as described by RFC 7540, requires a server that supports Application-Layer Protocol Negotiation (ALPN).

### App Transport Security (ATS)

iOS 9.0 and macOS 10.11 and later use App Transport Security (ATS) for all HTTP connections made with `URLSession`. ATS requires that HTTP connections use HTTPS (RFC 2818).

---

## FileManager
https://developer.apple.com/documentation/foundation/filemanager

A convenient interface to the contents of the file system, and the primary means of interacting with it.

```swift
class FileManager
```

### Overview

A file manager object lets you examine the contents of the file system and make changes to it. The `FileManager` class provides convenient access to a shared file manager object that is suitable for most types of file-related manipulations. A file manager object is typically your primary mode of interaction with the file system. You use it to locate, create, copy, and move files and directories. You also use it to get information about a file or directory or change some of its attributes.

When specifying the location of files, you can use either `NSURL` or `NSString` objects. The use of the `NSURL` class is generally preferred for specifying file-system items because URLs can convert path information to a more efficient representation internally. You can also obtain a bookmark from an `NSURL` object, which is similar to an alias and offers a more sure way of locating the file or directory later.

### Threading Considerations

The methods of the shared `FileManager` object can be called from multiple threads safely. However, if you use a delegate to receive notifications about the status of move, copy, remove, and link operations, you should create a unique instance of the file manager object, assign your delegate to that object, and use that file manager to initiate your operations.

### Key Methods and Properties

#### Creating a File Manager
- `class var `default`: FileManager` - The shared file manager object for the process.

#### Accessing User Directories
- `var homeDirectoryForCurrentUser: URL` - The home directory for the current user.
- `func homeDirectory(forUser: String) -> URL?` - Returns the home directory for the specified user.
- `var temporaryDirectory: URL` - The temporary directory for the current user.

#### Locating System Directories
- `func url(for: FileManager.SearchPathDirectory, in: FileManager.SearchPathDomainMask, appropriateFor: URL?, create: Bool) throws -> URL` - Locates and optionally creates the specified common directory in a domain.
- `func urls(for: FileManager.SearchPathDirectory, in: FileManager.SearchPathDomainMask) -> [URL]` - Returns an array of URLs for the specified common directory in the requested domains.

#### Discovering Directory Contents
- `func contentsOfDirectory(at: URL, includingPropertiesForKeys: [URLResourceKey]?, options: FileManager.DirectoryEnumerationOptions) throws -> [URL]` - Performs a shallow search of the specified directory and returns URLs for the contained items.
- `func contentsOfDirectory(atPath: String) throws -> [String]` - Performs a shallow search of the specified directory and returns the paths of any contained items.
- `func enumerator(at: URL, includingPropertiesForKeys: [URLResourceKey]?, options: FileManager.DirectoryEnumerationOptions, errorHandler: ((URL, any Error) -> Bool)?) -> FileManager.DirectoryEnumerator?` - Returns a directory enumerator object that can be used to perform a deep enumeration of the directory at the specified URL.

#### Creating and Deleting Items
- `func createDirectory(at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey : Any]?) throws` - Creates a directory with the given attributes at the specified URL.
- `func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey : Any]?) -> Bool` - Creates a file with the specified content and attributes at the given location.
- `func removeItem(at: URL) throws` - Removes the file or directory at the specified URL.
- `func removeItem(atPath: String) throws` - Removes the file or directory at the specified path.
- `func trashItem(at: URL, resultingItemURL: AutoreleasingUnsafeMutablePointer<NSURL?>?) throws` - Moves an item to the trash.

#### Moving and Copying Items
- `func copyItem(at: URL, to: URL) throws` - Copies the file at the specified URL to a new location synchronously.
- `func copyItem(atPath: String, toPath: String) throws` - Copies the item at the specified path to a new location synchronously.
- `func moveItem(at: URL, to: URL) throws` - Moves the file or directory at the specified URL to a new location synchronously.
- `func moveItem(atPath: String, toPath: String) throws` - Moves the file or directory at the specified path to a new location synchronously.

#### Determining Access to Files
- `func fileExists(atPath: String) -> Bool` - Returns a Boolean value that indicates whether a file or directory exists at a specified path.
- `func fileExists(atPath: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool` - Returns a Boolean value that indicates whether a file or directory exists at a specified path.
- `func isReadableFile(atPath: String) -> Bool` - Returns a Boolean value that indicates whether the invoking object appears able to read a specified file.
- `func isWritableFile(atPath: String) -> Bool` - Returns a Boolean value that indicates whether the invoking object appears able to write to a specified file.
- `func isExecutableFile(atPath: String) -> Bool` - Returns a Boolean value that indicates whether the operating system appears able to execute a specified file.
- `func isDeletableFile(atPath: String) -> Bool` - Returns a Boolean value that indicates whether the invoking object appears able to delete a specified file.

#### Getting and Setting Attributes
- `func attributesOfItem(atPath: String) throws -> [FileAttributeKey : Any]` - Returns the attributes of the item at a given path.
- `func setAttributes([FileAttributeKey : Any], ofItemAtPath: String) throws` - Sets the attributes of the specified file or directory.

#### Managing iCloud-Based Items
- `var ubiquityIdentityToken: (any NSCoding & NSCopying & NSObjectProtocol)?` - An opaque token that represents the current user's iCloud Drive Documents identity.
- `func url(forUbiquityContainerIdentifier: String?) -> URL?` - Returns the URL for the iCloud container associated with the specified identifier and establishes access to that container.
- `func isUbiquitousItem(at: URL) -> Bool` - Returns a Boolean indicating whether the item is targeted for storage in iCloud.
- `func setUbiquitous(Bool, itemAt: URL, destinationURL: URL) throws` - Indicates whether the item at the specified URL should be stored in iCloud.
- `func startDownloadingUbiquitousItem(at: URL) throws` - Starts downloading (if necessary) the specified item to the local system.
- `func evictUbiquitousItem(at: URL) throws` - Removes the local copy of the specified item that's stored in iCloud.

---

## UserDefaults
https://developer.apple.com/documentation/foundation/userdefaults

An interface to the user's defaults database, where you store key-value pairs persistently across launches of your app.

```swift
class UserDefaults
```

### Overview

The `UserDefaults` class provides a programmatic interface for interacting with the defaults system. The defaults system allows an app to customize its behavior to match a user's preferences. For example, you can allow users to specify their preferred units of measurement or media playback speed. Apps store these preferences by assigning values to a set of parameters in a user's defaults database. The parameters are referred to as _defaults_ because they're commonly used to determine an app's default state at startup or the way it acts by default.

At runtime, you use `UserDefaults` objects to read the defaults that your app uses from a user's defaults database. `UserDefaults` caches the information to avoid having to open the user's defaults database each time you need a default value. When you set a default value, it's changed synchronously within your process, and asynchronously to persistent storage and other processes.

With the exception of managed devices in educational institutions, a user's defaults are stored locally on a single device, and persisted for backup and restore. To synchronize preferences and other data across a user's connected devices, use `NSUbiquitousKeyValueStore` instead.

### Storing Default Objects

The `UserDefaults` class provides convenience methods for accessing common types such as floats, doubles, integers, Boolean values, and URLs.

A default object must be a property list—that is, an instance of (or for collections, a combination of instances of) `NSData`, `NSString`, `NSNumber`, `NSDate`, `NSArray`, or `NSDictionary`. If you want to store any other type of object, you should typically archive it to create an instance of NSData.

Values returned from `UserDefaults` are immutable, even if you set a mutable object as the value. For example, if you set a mutable string as the value for "MyStringDefault", the string you later retrieve using the `string(forKey:)` method will be immutable.

### Key Methods and Properties

#### Getting the Standard User Defaults Object
- `class var standard: UserDefaults` - Returns the shared defaults object.

#### Creating User Defaults Objects
- `convenience init()` - Creates a user defaults object initialized with the defaults for the app and current user.
- `init?(suiteName: String?)` - Creates a user defaults object initialized with the defaults for the specified database name.

#### Getting Default Values
- `func object(forKey: String) -> Any?` - Returns the object associated with the specified key.
- `func url(forKey: String) -> URL?` - Returns the URL associated with the specified key.
- `func array(forKey: String) -> [Any]?` - Returns the array associated with the specified key.
- `func dictionary(forKey: String) -> [String : Any]?` - Returns the dictionary object associated with the specified key.
- `func string(forKey: String) -> String?` - Returns the string associated with the specified key.
- `func stringArray(forKey: String) -> [String]?` - Returns the array of strings associated with the specified key.
- `func data(forKey: String) -> Data?` - Returns the data object associated with the specified key.
- `func bool(forKey: String) -> Bool` - Returns the Boolean value associated with the specified key.
- `func integer(forKey: String) -> Int` - Returns the integer value associated with the specified key.
- `func float(forKey: String) -> Float` - Returns the float value associated with the specified key.
- `func double(forKey: String) -> Double` - Returns the double value associated with the specified key.

#### Setting Default Values
- `func set(Any?, forKey: String)` - Sets the value of the specified default key.
- `func set(Float, forKey: String)` - Sets the value of the specified default key to the specified float value.
- `func set(Double, forKey: String)` - Sets the value of the specified default key to the double value.
- `func set(Int, forKey: String)` - Sets the value of the specified default key to the specified integer value.
- `func set(Bool, forKey: String)` - Sets the value of the specified default key to the specified Boolean value.
- `func set(URL?, forKey: String)` - Sets the value of the specified default key to the specified URL.

#### Removing Defaults
- `func removeObject(forKey: String)` - Removes the value of the specified default key.

#### Maintaining Suites
- `func addSuite(named: String)` - Inserts the specified domain name into the receiver's search list.
- `func removeSuite(named: String)` - Removes the specified domain name from the receiver's search list.

#### Registering Defaults
- `func register(defaults: [String : Any])` - Adds the contents of the specified dictionary to the registration domain.

### Thread Safety

The UserDefaults class is thread-safe.

### Sandbox Considerations

A sandboxed app cannot access or modify the preferences for any other app, with the following exceptions:
- App extensions on macOS and iOS
- Other apps in your application group on macOS

Adding a third-party app's domain using the `addSuite(named:)` method doesn't allow your app to access to that app's preferences. Attempting to access or modify another app's preferences doesn't result in an error; instead, macOS reads and writes files located within your app's container, rather than the actual preference files for the other application.

---

## NotificationCenter
https://developer.apple.com/documentation/foundation/notificationcenter

A notification dispatch mechanism that enables the broadcast of information to registered observers.

```swift
class NotificationCenter
```

### Overview

Objects register with a notification center to receive notifications (`NSNotification` objects) using the `addObserver(_:selector:name:object:)` or `addObserver(forName:object:queue:using:)` methods. When an object adds itself as an observer, it specifies which notifications it should receive. An object may therefore call this method several times in order to register itself as an observer for several different notifications.

Each running app has a `default` notification center, and you can create new notification centers to organize communications in particular contexts.

A notification center can deliver notifications only within a single program; if you want to post a notification to other processes or receive notifications from other processes, use `DistributedNotificationCenter` instead.

### Key Methods and Properties

#### Getting the Default Notification Center
- `class var `default`: NotificationCenter` - The app's default notification center.

#### Adding and Removing Notification Observers
- `func addObserver(forName: NSNotification.Name?, object: Any?, queue: OperationQueue?, using: (Notification) -> Void) -> any NSObjectProtocol` - Adds an entry to the notification center to receive notifications that passed to the provided block.
- `func addObserver(Any, selector: Selector, name: NSNotification.Name?, object: Any?)` - Adds an entry to the notification center to call the provided selector with the notification.
- `func removeObserver(Any, name: NSNotification.Name?, object: Any?)` - Removes matching entries from the notification center's dispatch table.

#### Posting Notifications
- `func post(Notification)` - Posts a given notification to the notification center.
- `func post(name: NSNotification.Name, object: Any?, userInfo: [AnyHashable : Any]?)` - Creates a notification with a given name, sender, and information and posts it to the notification center.
- `func post(name: NSNotification.Name, object: Any?)` - Creates a notification with a given name and sender and posts it to the notification center.

#### Receiving Notifications as an Asynchronous Sequence
- `func notifications(named: Notification.Name, object: (any AnyObject & Sendable)?) -> NotificationCenter.Notifications` - Returns an asynchronous sequence of notifications produced by this center for a given notification name and optional source object.

#### Receiving Notifications as a Combine Publisher
- `func publisher(for: Notification.Name, object: AnyObject?) -> NotificationCenter.Publisher` - Returns a publisher that emits events when broadcasting notifications.

---

## JSONDecoder
https://developer.apple.com/documentation/foundation/jsondecoder

An object that decodes instances of a data type from JSON objects.

```swift
class JSONDecoder
```

### Overview

The example below shows how to decode an instance of a simple `GroceryProduct` type from a JSON object. The type adopts `Codable` so that it's decodable using a `JSONDecoder` instance.

```swift
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let product = try decoder.decode(GroceryProduct.self, from: json)

print(product.name) // Prints "Durian"
```

### Key Methods and Properties

#### Creating a Decoder
- `init()` - Creates a new, reusable JSON decoder with the default formatting settings and decoding strategies.

#### Decoding
- `func decode<T>(T.Type, from: Data) throws -> T` - Returns a value of the type you specify, decoded from a JSON object.

#### Customizing Decoding
- `var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy` - A value that determines how to decode a type's coding keys from JSON keys.
- `var userInfo: [CodingUserInfoKey : any Sendable]` - A dictionary you use to customize the decoding process by providing contextual information.
- `var allowsJSON5: Bool` - Specifies that decoding supports the JSON5 syntax.
- `var assumesTopLevelDictionary: Bool` - Specifies that decoding assumes the top level of the JSON data is a dictionary, even if it doesn't begin and end with braces.

#### Decoding Dates
- `var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy` - The strategy used when decoding dates from part of a JSON object.

#### Decoding Raw Data
- `var dataDecodingStrategy: JSONDecoder.DataDecodingStrategy` - The strategy that a decoder uses to decode raw data.

#### Decoding Exceptional Numbers
- `var nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy` - The strategy used by a decoder when it encounters exceptional floating-point values.

---

## JSONEncoder
https://developer.apple.com/documentation/foundation/jsonencoder

An object that encodes instances of a data type as JSON objects.

```swift
class JSONEncoder
```

### Overview

The example below shows how to encode an instance of a simple `GroceryProduct` type from a JSON object. The type adopts `Codable` so that it's encodable as JSON using a `JSONEncoder` instance.

```swift
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear.")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let data = try encoder.encode(pear)
print(String(data: data, encoding: .utf8)!)

/* Prints:
 {
   "name" : "Pear",
   "points" : 250,
   "description" : "A ripe pear."
 }
*/
```

### Key Methods and Properties

#### First Steps
- `init()` - Creates a new, reusable JSON encoder with the default formatting settings and encoding strategies.
- `func encode<T>(T) throws -> Data` - Returns a JSON-encoded representation of the value you supply.

#### Customizing Encoding
- `var outputFormatting: JSONEncoder.OutputFormatting` - A value that determines the readability, size, and element order of the encoded JSON object.
- `var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy` - A value that determines how to encode a type's coding keys as JSON keys.
- `var userInfo: [CodingUserInfoKey : any Sendable]` - A dictionary you use to customize the encoding process by providing contextual information.

#### Encoding Dates
- `var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy` - The strategy used when encoding dates as part of a JSON object.

#### Encoding Raw Data
- `var dataEncodingStrategy: JSONEncoder.DataEncodingStrategy` - The strategy that an encoder uses to encode raw data.

#### Encoding Exceptional Numbers
- `var nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy` - The strategy used by an encoder when it encounters exceptional floating-point values.

---

## NSArray
https://developer.apple.com/documentation/foundation/nsarray

A static ordered collection of objects.

```swift
class NSArray
```

### Overview

You can use this type in Swift instead of an `Array` constant in cases that require reference semantics.

`NSArray` and its subclass `NSMutableArray` manage ordered collections of objects called **arrays**. `NSArray` creates static arrays, and `NSMutableArray` creates dynamic arrays. You can use arrays when you need an ordered collection of objects.

`NSArray` is "toll-free bridged" with its Core Foundation counterpart, `CFArray`. See Toll-Free Bridging for more information on toll-free bridging.

### Creating NSArray Objects Using Array Literals

In addition to the provided initializers, such as `initWithObjects:`, you can create an `NSArray` object using an _array literal_.

```swift
let array: NSArray = [someObject, "Hello, World!", 42]
```

```objc
NSArray *array = @[someObject, @"Hello, World!", @42];
```

### Accessing Values Using Subscripting

In addition to the provided instance methods, such as `object(at:)`, you can access `NSArray` values by their indexes using _subscripting_.

```swift
let value = array[3]
```

```objc
id value = array[3];
```

### Key Methods and Properties

#### Creating an Array
- `init?(contentsOfURL: URL)` - Creates and returns an array containing the contents specified by a given URL.
- `convenience init(object: Any)` - Creates and returns an array containing a given object.
- `convenience init(objects: UnsafePointer<AnyObject>, count: Int)` - Creates and returns an array that includes a given number of objects from a given C array.

#### Querying an Array
- `func contains(Any) -> Bool` - Returns a Boolean value that indicates whether a given object is present in the array.
- `var count: Int` - The number of objects in the array.
- `var firstObject: Any?` - The first object in the array.
- `var lastObject: Any?` - The last object in the array.
- `func object(at: Int) -> Any` - Returns the object located at the specified index.
- `subscript(Int) -> Any` - Returns the object at the specified index.

#### Finding Objects in an Array
- `func index(of: Any) -> Int` - Returns the lowest index whose corresponding array value is equal to a given object.
- `func index(of: Any, in: NSRange) -> Int` - Returns the lowest index within a specified range whose corresponding array value is equal to a given object.

#### Sending Messages to Elements
- `func enumerateObjects((Any, Int, UnsafeMutablePointer<ObjCBool>) -> Void)` - Executes a given closure or block using each object in the array, starting with the first object and continuing through the array to the last object.

#### Comparing Arrays
- `func firstObjectCommon(with: [Any]) -> Any?` - Returns the first object contained in the receiving array that's equal to an object in another given array.
- `func isEqual(to: [Any]) -> Bool` - Compares the receiving array to another array.

#### Deriving New Arrays
- `func adding(Any) -> [Any]` - Returns a new array that is a copy of the receiving array with a given object added to the end.
- `func addingObjects(from: [Any]) -> [Any]` - Returns a new array that is a copy of the receiving array with the objects contained in another array added to the end.
- `func filtered(using: NSPredicate) -> [Any]` - Evaluates a given predicate against each object in the receiving array and returns a new array containing the objects for which the predicate returns true.
- `func subarray(with: NSRange) -> [Any]` - Returns a new array containing the receiving array's elements that fall within the limits specified by a given range.

#### Sorting
- `func sortedArray(using: [NSSortDescriptor]) -> [Any]` - Returns a copy of the receiving array sorted as specified by a given array of sort descriptors.
- `func sortedArray(using: Selector) -> [Any]` - Returns an array that lists the receiving array's elements in ascending order, as determined by the comparison method specified by a given selector.
- `func sortedArray(comparator: (Any, Any) -> ComparisonResult) -> [Any]` - Returns an array that lists the receiving array's elements in ascending order, as determined by the comparison method specified by a given `NSComparator` block.

---

## NSDictionary
https://developer.apple.com/documentation/foundation/nsdictionary

A static collection of objects associated with unique keys.

```swift
class NSDictionary
```

### Overview

You can use this type in Swift instead of a `Dictionary` in cases that require reference semantics.

The `NSDictionary` class declares the programmatic interface to objects that manage immutable associations of keys and values. For example, an interactive form could be represented as a dictionary, with the field names as keys, corresponding to user-entered values.

Use this class or its subclass `NSMutableDictionary` when you need a convenient and efficient way to retrieve data associated with an arbitrary key. `NSDictionary` creates static dictionaries, and `NSMutableDictionary` creates dynamic dictionaries. (For convenience, the term _dictionary_ refers to any instance of one of these classes without specifying its exact class membership.)

A key-value pair within a dictionary is called an entry. Each entry consists of one object that represents the key and a second object that is that key's value. Within a dictionary, the keys are unique. That is, no two keys in a single dictionary are equal (as determined by `isEqual(_:)`). In general, a key can be any object (provided that it conforms to the `NSCopying` protocol), but note that when using key-value coding the key must be a string. Neither a key nor a value can be `nil`; if you need to represent a null value in a dictionary, you should use `NSNull`.

`NSDictionary` is "toll-free bridged" with its Core Foundation counterpart, `CFDictionary`.

### Creating NSDictionary Objects Using Dictionary Literals

In addition to the provided initializers, such as `init(objects:forKeys:)`, you can create an `NSDictionary` object using a _dictionary literal_.

```swift
let dictionary: NSDictionary = [
    "anObject" : someObject,
    "helloString" : "Hello, World!",
    "magicNumber" : 42,
    "aValue" : someValue
]
```

```objc
NSDictionary *dictionary = @{
       @"anObject" : someObject,
    @"helloString" : @"Hello, World!",
    @"magicNumber" : @42,
         @"aValue" : someValue
};
```

### Accessing Values Using Subscripting

In addition to the provided instance methods, such as `object(forKey:)`, you can access `NSDictionary` values by their keys using _subscripting_.

```swift
let value = dictionary["helloString"]
```

```objc
id value = dictionary[@"helloString"];
```

### Key Methods and Properties

#### Creating a Dictionary from Objects and Keys
- `convenience init(objects: [Any], forKeys: [any NSCopying])` - Initializes a newly allocated dictionary with key-value pairs constructed from the provided arrays of keys and objects.
- `init(objects: UnsafePointer<AnyObject>?, forKeys: UnsafePointer<any NSCopying>?, count: Int)` - Initializes a newly allocated dictionary with the specified number of key-value pairs constructed from the provided C arrays of keys and objects.
- `convenience init(object: Any, forKey: any NSCopying)` - Creates a dictionary containing a given key and value.

#### Counting Entries
- `var count: Int` - The number of entries in the dictionary.

#### Comparing Dictionaries
- `func isEqual(to: [AnyHashable : Any]) -> Bool` - Returns a Boolean value that indicates whether the contents of the receiving dictionary are equal to the contents of another given dictionary.

#### Accessing Keys and Values
- `var allKeys: [Any]` - A new array containing the dictionary's keys, or an empty array if the dictionary has no entries.
- `func allKeys(for: Any) -> [Any]` - Returns a new array containing the keys corresponding to all occurrences of a given object in the dictionary.
- `var allValues: [Any]` - A new array containing the dictionary's values, or an empty array if the dictionary has no entries.
- `func value(forKey: String) -> Any?` - Returns the value associated with a given key.
- `func object(forKey: Any) -> Any?` - Returns the value associated with a given key.
- `subscript(any NSCopying) -> Any?` - Returns the value associated with a given key.

#### Enumerating Dictionaries
- `func keyEnumerator() -> NSEnumerator` - Provides an enumerator to access the keys in the dictionary.
- `func objectEnumerator() -> NSEnumerator` - Returns an enumerator object that lets you access each value in the dictionary.
- `func enumerateKeysAndObjects((Any, Any, UnsafeMutablePointer<ObjCBool>) -> Void)` - Applies a given block object to the entries of the dictionary.

#### Sorting Dictionaries
- `func keysSortedByValue(using: Selector) -> [Any]` - Returns an array of the dictionary's keys, in the order they would be in if the dictionary were sorted by its values.
- `func keysSortedByValue(comparator: (Any, Any) -> ComparisonResult) -> [Any]` - Returns an array of the dictionary's keys, in the order they would be in if the dictionary were sorted by its values using a given comparator block.

#### Filtering Dictionaries
- `func keysOfEntries(passingTest: (Any, Any, UnsafeMutablePointer<ObjCBool>) -> Bool) -> Set<AnyHashable>` - Returns the set of keys whose corresponding value satisfies a constraint described by a block object.

---

## NSData
https://developer.apple.com/documentation/foundation/nsdata

A static byte buffer in memory.

```swift
class NSData
```

### Overview

In Swift, the buffer bridges to `Data`; use `NSData` when you need reference semantics or other Foundation-specific behavior.

NSData and its mutable subclass `NSMutableData` provide data objects, or object-oriented wrappers for byte buffers. Data objects let simple allocated buffers (that is, data with no embedded pointers) take on the behavior of Foundation objects.

The size of the data is subject to a theoretical limit of about 8 exabytes (1 EB = 10¹⁸ bytes; in practice, the limit should not be a factor).

NSData is _toll-free bridged_ with its Core Foundation counterpart, `CFData`.

### Writing Data Atomically

NSData provides methods for atomically saving their contents to a file, which guarantee that the data is either saved in its entirety, or it fails completely. An atomic write first writes the data to a temporary file and then, only if this write succeeds, moves the temporary file to its final location.

Although atomic write operations minimize the risk of data loss due to corrupt or partially written files, they may not be appropriate when writing to a temporary directory, the user's home directory or other publicly accessible directories. When you work with a publicly accessible file, treat that file as an untrusted and potentially dangerous resource. An attacker may compromise or corrupt these files. The attacker can also replace the files with hard or symbolic links, causing your write operations to overwrite or corrupt other system resources.

### Key Methods and Properties

#### Creating Data
- `init(bytes: UnsafeRawPointer?, length: Int)` - Initializes a data object filled with a given number of bytes copied from a given buffer.
- `init(bytesNoCopy: UnsafeMutableRawPointer, length: Int)` - Initializes a data object filled with a given number of bytes of data from a given buffer.
- `init(bytesNoCopy: UnsafeMutableRawPointer, length: Int, deallocator: ((UnsafeMutableRawPointer, Int) -> Void)?)` - Initializes a data object filled with a given number of bytes of data from a given buffer, with a custom deallocator block.
- `init(data: Data)` - Initializes a data object with the contents of another data object.

#### Reading Data from a File
- `convenience init?(contentsOfURL: URL)` - Creates a data object from the data at the specified file URL.
- `init?(contentsOfFile: String)` - Initializes a data object with the content of the file at a given path.
- `init(contentsOfFile: String, options: NSData.ReadingOptions) throws` - Initializes a data object with the content of the file at a given path.

#### Writing Data to a File
- `func write(toFile: String, atomically: Bool) -> Bool` - Writes the data object's bytes to the file specified by a given path.
- `func write(toFile: String, options: NSData.WritingOptions) throws` - Writes the data object's bytes to the file specified by a given path.
- `func write(to: URL, atomically: Bool) -> Bool` - Writes the data object's bytes to the location specified by a given URL.
- `func write(to: URL, options: NSData.WritingOptions) throws` - Writes the data object's bytes to the location specified by a given URL.

#### Encoding and Decoding Base64 Representations
- `init?(base64EncodedData: Data, options: NSData.Base64DecodingOptions)` - Initializes a data object with the given Base64 encoded data.
- `init?(base64EncodedString: String, options: NSData.Base64DecodingOptions)` - Initializes a data object with the given Base64 encoded string.
- `func base64EncodedData(options: NSData.Base64EncodingOptions) -> Data` - Creates a Base64, UTF-8 encoded data object from the string using the given options.
- `func base64EncodedString(options: NSData.Base64EncodingOptions) -> String` - Creates a Base64 encoded string from the string using the given options.

#### Accessing Underlying Bytes
- `var bytes: UnsafeRawPointer` - A pointer to the data object's contents.
- `func enumerateBytes((UnsafeRawPointer, NSRange, UnsafeMutablePointer<ObjCBool>) -> Void)` - Enumerates each range of bytes in the data object using a block.
- `func getBytes(UnsafeMutableRawPointer, length: Int)` - Copies a number of bytes from the start of the data object into a given buffer.
- `func getBytes(UnsafeMutableRawPointer, range: NSRange)` - Copies a range of bytes from the data object into a given buffer.

#### Finding Data
- `func subdata(with: NSRange) -> Data` - Returns a new data object containing the data object's bytes that fall within the limits specified by a given range.
- `func range(of: Data, options: NSData.SearchOptions, in: NSRange) -> NSRange` - Finds and returns the range of the first occurrence of the given data, within the given range, subject to given options.

#### Testing Data
- `func isEqual(to: Data) -> Bool` - Returns a Boolean value indicating whether this data object is the same as another.
- `var length: Int` - The number of bytes contained by the data object.

#### Compressing and Decompressing Data
- `func compressed(using: NSData.CompressionAlgorithm) throws -> Self` - Returns a new data object by compressing the data object's bytes.
- `func decompressed(using: NSData.CompressionAlgorithm) throws -> Self` - Returns a new data object by decompressing data object's bytes.