# CoreSpotlight Framework - Full Documentation

## Table of Contents

1. [Framework Overview](#framework-overview)
2. [CSSearchableItem](#cssearchableitem)
3. [CSSearchableItemAttributeSet](#cssearchableitemattributeset)
4. [CSSearchableIndex](#cssearchableindex)
5. [Adding Content to Spotlight Indexes](#adding-content-to-spotlight-indexes)
6. [CSSearchQuery](#cssearchquery)
7. [Searching for Information in Your App](#searching-for-information-in-your-app)
8. [Building a Search Interface](#building-a-search-interface)
9. [Regenerating Indexes on Demand](#regenerating-indexes-on-demand)
10. [CSIndexExtensionRequestHandler](#csindexextensionrequesthandler)
11. [CSUserQuery](#csuserquery)
12. [Apple Intelligence Summarization and Prioritization](#apple-intelligence-summarization-and-prioritization)

---

## Framework Overview

**Core Spotlight**

Add search capabilities to your app, and index your content so people can find it from Spotlight and Safari.

iOS 9.0+iPadOS 9.0+Mac Catalyst 13.0+macOS 10.13+visionOS 1.0+

### Overview

Help people access activities and items within your app by adding details about those items to a Core Spotlight index. The framework provides APIs to add your content to an index, and search for items in that index. You decide what content makes sense to index, but typically you index anything that someone might look for in your app. For example, you might index photos, contacts, the items someone purchased, or data they see in your interface. You can then use Core Spotlight to search for your indexed content and display those results in your app.

Your app is responsible for indexing your app's content and maintaining those indexes. You can index content when your app runs, or provide an app extension to index content when the system requests it. You can index any content your app manages, including files and other content that your app isn't currently displaying. The indexes you create using Core Spotlight remain on device, and are private to the owner of the device. Devices don't share indexed data with Apple, or synchronize that data with the person's other devices.

In addition to indexing content, iOS provides additional strategies for making your app's content searchable:

- Use the search-related properties of `NSUserActivity` to add items to the on-device index, with the option to identify the items as eligible for public indexing. Learn more about `NSUserActivity` in Index Activities and Navigation Points.

- Use web markup to index content on your web server in Apple's server-side index, which makes the data available to all iOS users in Spotlight and Safari search results. For more information, see Mark Up Web Content in App Search Programming Guide.

### Topics

#### Essentials

- Adding your app's content to Spotlight indexes - Create a description for your app's content and add it to a Spotlight index to make it searchable.
- Enabling Apple Intelligence summarization and prioritization - Summarize and prioritize app content using Spotlight extensions.

#### Searchable items

- `class CSSearchableItem` - The details of your app-specific content that someone might search for on their devices.
- `class CSSearchableItemAttributeSet` - The detailed metadata for a searchable item.
- `class CSCustomAttributeKey` - A key associated with a custom attribute for a searchable item.
- `class CSLocalizedString` - An object that displays localized text in search results related to your app.
- `class CSPerson` - An object that represents a person in the context of search results.

#### Indexes

- `class CSSearchableIndex` - An on-device index for your app's searchable content.
- `protocol CSSearchableIndexDelegate` - A protocol that defines methods a delegate object or app extension uses to handle communication from the on-device index.

#### Spotlight app extensions

- Regenerating your app's indexes on demand - Create an app extension to maintain your app's indexes and regenerate them as needed.
- `class CSIndexExtensionRequestHandler` - An interface that implements an index-maintenance app extension.
- `class CSImportExtension` - An object that provides searchable attributes for file types that the app supports.

#### Queries

- Building a search interface for your app - Add a search interface to your app to execute Spotlight queries and offer suggested text completions.
- Searching for information in your app - Search for app-specific content and refine search results using predicates and filters.
- `class CSUserQuery` - A type you use to initiate searches from your interface and offer suggested text completions.
- `class CSUserQueryContext` - The configuration details to apply to a user query.
- `class CSSearchQuery` - A type you use to programmatically search the indexed app content.
- `class CSSearchQueryContext` - The behavior configuration to use for a search query.
- `class CSSuggestion` - The kind of suggestion to use in a query.

#### Errors

- `struct CSIndexError` - Index errors returned by Core Spotlight.
- `struct CSSearchQueryError` - Search query errors returned by Core Spotlight.
- CSIndex Errors - Index error codes and error domain.
- CSSearchQuery Errors - Search query error codes and error domain.

#### Version

- `var CoreSpotlightAPIVersion: Int32` - The API version number for Core Spotlight.

---

## CSSearchableItem

**The details of your app-specific content that someone might search for on their devices.**

iOS 9.0+iPadOS 9.0+Mac Catalyst 13.1+macOS 10.11+visionOS 1.0+

```swift
class CSSearchableItem
```

### Overview

A `CSSearchableItem` uniquely identifies a part of your app's content, and provides the metadata that Spotlight indexes and uses to find that content later. As part of indexing your app's content, you create searchable items and fill them with details about your app's content and where to find it. After indexing the content, you can then execute queries using the Core Spotlight APIs to find the items you indexed. People can also use the system's Spotlight search interface to find your app's content.

When you create or update content in your app, create a `CSSearchableItem` for that content if you want it to be searchable. A searchable item contains identification strings you use to locate that item in your content and a `CSSearchableItemAttributeSet` object with details about the item. For the metadata, you typically want to provide values for the `title`, `displayName`, and `contentType` attributes at a minimum. If you're indexing a file on disk, provide a value for the `contentURL` attribute. Fill in as many other attributes as makes sense for the content you're indexing.

After creating a searchable item, index it using a `CSSearchableIndex` object. As you update your app's content, update your `CSSearchableItem` objects for that content and index them right away. If you delete content, similarly delete the searchable items from the index. Keeping your app's indexes current ensures that searches return valid information. For more information on indexing your content, see Adding your app's content to Spotlight indexes.

### Topics

#### Getting a searchable item

- `init(uniqueIdentifier: String?, domainIdentifier: String?, attributeSet: CSSearchableItemAttributeSet)` - Returns a searchable item associated with the specified identifier, domain identifier, and attribute set.

#### Setting attributes on a searchable item

- `var uniqueIdentifier: String` - The value that uniquely identifies the searchable item within your app.
- `var domainIdentifier: String?` - An optional identifier that represents the domain or owner of the item.
- `var attributeSet: CSSearchableItemAttributeSet` - The set of attributes that contain metadata associated with the item in a `CSSearchableItemAttributeSet` object.
- `var expirationDate: Date!` - The date after which the searchable item should no longer exist.
- `var isUpdate: Bool` - A Boolean value that indicates whether to treat the item as an update instead of a new item.

#### Continuing a search or activity

- `let CSSearchableItemActionType: String` - Indicates that the activity type to continue is related to a searchable item.
- `let CSSearchableItemActivityIdentifier: String` - The key you use to access a searchable item in a user activity object.
- `let CSQueryContinuationActionType: String` - Indicates that the activity type to continue is a search or query.
- `let CSSearchQueryString: String` - Provides the key for the current query in the info dictionary of the user activity object.

#### Comparing items

- `func compare(byRank: CSSearchableItem) -> ComparisonResult` - Compares two items by rank and returns the result.

#### Structures

- `struct UpdateListenerOptions` - The set of options that contain metadata-associated summarization and prioritization of a searchable item.

#### Initializers

- `convenience init(appEntity: some IndexedEntity)` - Initializes a new searchable item with the relevant fields populated from the provided app entity.
- `convenience init<Entity>(appEntity: Entity, priority: Int)` - Initializes a new searchable item with the relevant fields populated from the provided app entity.

#### Instance Properties

- `var updateListenerOptions: CSSearchableItem.UpdateListenerOptions`

#### Instance Methods

- `func associateAppEntity(some IndexedEntity, priority: Int)` - Associates an app entity with this searchable item.

---

## CSSearchableItemAttributeSet

**The detailed metadata for a searchable item.**

iOS 9.0+iPadOS 9.0+Mac Catalyst 13.1+macOS 10.11+visionOS 1.0+

```swift
class CSSearchableItemAttributeSet
```

### Overview

A `CSSearchableItemAttributeSet` contains an extensive set of attributes that describe your app's content. Attributes include information such as its title and a brief description. They can also refer to who created the item, what kind of data it represents, when someone created it, and more. During the indexing process, you create `CSSearchableItem` objects and use a `CSSearchableItemAttributeSet` to fill in the attributes for that item. During a search, you can query the index for items with attributes that match specific values.

When creating a `CSSearchableItem`, it's important to fill out as much information in the accompanying `CSSearchableItemAttributeSet` object as possible. You don't have to provide values for every attribute. Instead, choose attributes that match the domain of your content. This type divides attributes into groups such as media, documents, events, places, music, images, and more. You can also add custom attributes to describe new types of content. When defining custom attributes, be as specific as possible in your definition, and provide a value for the `contentTypeTree` property so your custom attribute inherits from a known type.

### Topics

#### Getting an attribute set

- `init(contentType: UTType)` - Creates an attribute set for the specified content type.

#### Working with custom attributes

- `func setValue((any NSSecureCoding)?, forCustomKey: CSCustomAttributeKey)` - Sets the value for a custom attribute key.
- `func value(forCustomKey: CSCustomAttributeKey) -> (any NSSecureCoding)?` - Returns the value associated with the specified custom attribute key.

#### Describing Apple Intelligence prioritization and summarization

- `var isPriority: NSNumber?` - A Boolean value that indicates whether the mail or messages content represents a prioritized item.
- `var textContentSummary: String?` - A string that presents the Apple Intelligence summarization of the item.
- `var transcribedTextContent: String?` - A string that represents the text the system transcribed.

#### Describing documents

- `var audiences: [String]?` - A class of entity for which the item is intended or useful.
- `var contentDescription: String?` - A description of the item's content.
- `var creator: String?` - The name of the app that created the content.
- `var encodingApplications: [String]?` - The name of the apps that converted the original content into a PDF stream.
- `var fileSize: NSNumber?` - The size of the document file.
- `var fontNames: [String]?` - An array of font names the document uses.
- `var identifier: String?` - A formal identifier that references the document the item represents.
- `var kind: String?` - A description of the kind of document the item represents.
- `var pageCount: NSNumber?` - The number of pages in the document.
- `var pageHeight: NSNumber?` - The height of the document page, in points (72 points per inch).
- `var pageWidth: NSNumber?` - The width of the document page, in points (72 points per inch).
- `var securityMethod: String?` - The security method (a type of encryption) that protects the document file.
- `var subject: String?` - The subject of the document.
- `var theme: String?` - The theme of the document.

#### Describing general attributes

- `var alternateNames: [String]?` - An array of localized strings that represent alternate display names for the item.
- `var contentType: String?` - The uniform type identifier (UTI) of the item.
- `var contentTypeTree: [String]?` - An attribute type that identifies a custom hierarchy of types to describe the attributes of your item.
- `var contentURL: URL?` - The file URL of the content to index.
- `var darkThumbnailURL: URL?` - The local file URL of the thumbnail image for the item when Dark Mode is active.
- `var displayName: String?` - A localized string that contains the name of the item, suitable to display in the user interface.
- `var keywords: [String]?` - An array of keywords associated with the item, such as work, birthday, important, and so on.
- `var metadataModificationDate: Date?` - The date on which the last metadata attribute was changed.
- `var path: String?` - The complete path to the item.
- `var rankingHint: NSNumber?` - A number that indicates the relative importance of the item among other items from the app.
- `var relatedUniqueIdentifier: String?` - The unique identifier for the item to which the activity is related.
- `var thumbnailData: Data?` - Image data that represents the thumbnail of the item.
- `var thumbnailURL: URL?` - The local file URL of the thumbnail image for the item.
- `var title: String?` - The title of the item.
- `var domainIdentifier: String?` - An identifier that represents the domain or owner of the item.
- `var weakRelatedUniqueIdentifier: String?` - The unique identifier for the item to which the activity is related, but not linked.

#### Describing user involvement

- `var userCreated: NSNumber?` - A value that indicates the user created the item.
- `var userCurated: NSNumber?` - A value that indicates the user selected the item.
- `var userOwned: NSNumber?` - A value that indicates the user purchased or owns the item.

#### Describing events

- `var allDay: NSNumber?` - A value that indicates if the event covers an entire day.
- `var completionDate: Date?` - The date on which the item was completed.
- `var dueDate: Date?` - The date on which the item is due.
- `var endDate: Date?` - The end date for the item.
- `var importantDates: [Date]?` - An array of important dates associated with the item.
- `var startDate: Date?` - The start date for the item.

#### Describing places

- `var altitude: NSNumber?` - The altitude of the item in meters above sea level, expressed using the WGS84 datum.
- `var city: String?` - The city of the item's origin according to guidelines that the provider establishes.
- `var country: String?` - The full, publishable name of the country or region in which the intellectual property of the item was created, according to guidelines the provider establishes.
- `var latitude: NSNumber?` - The latitude of the item, in degrees north of the equator, expressed using the WGS84 datum.
- `var longitude: NSNumber?` - The longitude of the item, in degrees east of the prime meridian, expressed using the WGS84 datum.
- `var namedLocation: String?` - The name of the location or point of interest associated with the item.
- `var fullyFormattedAddress: String?` - The fully formatted address of the item, received from MapKit.
- `var postalCode: String?` - The postal code for the item according to guidelines the provider establishes.
- `var subThoroughfare: String?` - The sublocation, such as a street number, for the item according to guidelines the provider establishes.
- `var thoroughfare: String?` - The thoroughfare, such as a street name, associated with the location for the item according to guidelines the provider establishes.

#### Describing media

- `var comment: String?` - A comment related to the media file.
- `var contentCreationDate: Date?` - The creation date of an edited or optimized version of the song or composition.
- `var contentModificationDate: Date?` - The date on which the contents of the file was last modified.
- `var contentSources: [String]?` - An array of sources from which the media was obtained.
- `var copyright: String?` - The copyright date of the content.
- `var downloadedDate: Date?` - The most recent date on which the file was downloaded or received.
- `var duration: NSNumber?` - The duration (if appropriate) of the content of the file, in seconds.
- `var lastUsedDate: Date?` - The date on which the file was last used.
- `var playCount: NSNumber?` - A user-supplied play count for the media.
- `var rating: NSNumber?` - The user-supplied rating of the media.
- `var url: URL?` - The URL associated with the media.

#### Describing music

- `var album: String?` - The title for a collection of audio media.
- `var artist: String?` - The artist associated with the media.
- `var audioChannelCount: NSNumber?` - The number of channels in the audio data that the file contains.
- `var audioEncodingApplication: String?` - The name of the application that encoded the data the audio file contains.
- `var audioSampleRate: NSNumber?` - The sample rate of the audio data the file contains, as a float value representing Hz (audio frames per second), such as 44100.0 or 22254.54.
- `var audioTrackNumber: NSNumber?` - The track number of a song or audio composition when part of an album.
- `var composer: String?` - The composer of the song or audio composition that the audio file contains.
- `var keySignature: String?` - The musical key of the song or audio composition that the file contains, such as C, Dm, or F#m.
- `var lyricist: String?` - The lyricist or text writer for the song or audio composition that the file contains.
- `var musicalGenre: String?` - The musical genre of the song or audio composition that the file contains, such as jazz, pop, rock, or classical.
- `var recordingDate: Date?` - The recording date of the song or composition.
- `var tempo: NSNumber?` - The tempo of the music that the audio file contains, in beats per minute.
- `var timeSignature: String?` - The time signature of the musical composition that the audio or MIDI file contains, in a string, such as "4/4" or "7/8".

#### Describing images

- `var isoSpeed: NSNumber?` - The ISO speed setting at the time the camera captured the image.
- `var aperture: NSNumber?` - The size of the lens aperture at the time the camera captured the image, as a log-scale APEX value.
- `var bitsPerSample: NSNumber?` - The number of bits per sample.
- `var cameraOwner: String?` - The owner of the camera that captured the image.
- `var colorSpace: String?` - The color space model the image uses, such as RGB, CMYK, YUV, or YCbCr.
- `var flashOn: NSNumber?` - A value that indicates if the camera used a flash to capture the image.
- `var focalLength: NSNumber?` - The actual focal length of the lens, in millimeters.
- `var lensModel: String?` - The model of the lens that captured the image.
- `var orientation: NSNumber?` - The orientation of the data.
- `var pixelCount: NSNumber?` - The total number of pixels in the image.
- `var pixelHeight: NSNumber?` - The height of the item, such as image or video frame height, in pixels.
- `var pixelWidth: NSNumber?` - The width of the item, such as image or video frame width, in pixels.
- `var whiteBalance: NSNumber?` - The white balance setting when the camera captured the image.

#### Describing messages

- `var htmlContentData: Data?` - The HTML content of the document encoded as an NSData object representing a UTF-8 encoded string.
- `var accountHandles: [String]?` - An array of the canonical handles for the account with which the message is associated.
- `var accountIdentifier: String?` - The unique identifier for the account with which the message is associated, if any.
- `var additionalRecipients: [CSPerson]?` - An array of `CSPerson` objects representing the content of the Cc: field in an email message.
- `var authorAddresses: [String]?` - An array of addresses associated with the author of the message.
- `var authorEmailAddresses: [String]?` - An array of email addresses associated with the author of the message.
- `var authorNames: [String]?` - An array of names representing the authors who have worked on the message.
- `var authors: [CSPerson]?` - An array of `CSPerson` objects representing the content of the From: field in an item.
- `var emailAddresses: [String]?` - An array of email addresses associated with the message.
- `var emailHeaders: [String : [Any]]?` - A dictionary that contains all the headers of the message.
- `var hiddenAdditionalRecipients: [CSPerson]?` - An array of `CSPerson` objects representing the content of the Bcc: field in an email message.
- `var instantMessageAddresses: [String]?` - An array of instant message addresses for the message.
- `var likelyJunk: NSNumber` - A value that indicates if the message is likely to be considered junk.
- `var mailboxIdentifiers: [String]?` - An array of mailbox identifiers associated with the message.
- `var phoneNumbers: [String]?` - An array of phone numbers associated with the message.
- `var primaryRecipients: [CSPerson]?` - An array of `CSPerson` objects representing the content of the To: field in an email message.
- `var recipientAddresses: [String]?` - An array of addresses associated with the recipients of the message.
- `var recipientEmailAddresses: [String]?` - An array of email addresses associated with the recipient.
- `var recipientNames: [String]?` - An array of names representing the recipients of this message.
- `var textContent: String?` - The textual content of the message.

#### Supporting actions

- `var actionIdentifiers: [String]` - The identifiers that specify custom actions the app supports for the item.
- `var supportsNavigation: NSNumber?` - A value that indicates whether the item contains information sufficient to provide navigation to the location it represents.
- `var supportsPhoneCall: NSNumber?` - A value that indicates whether the item contains information sufficient to allow a phone call to a number associated with the item.
- `var sharedItemContentType: UTType?` - The file type of the item to enable the user to share items from Spotlight.

---

## CSSearchableIndex

**An on-device index for your app's searchable content.**

iOS 9.0+iPadOS 9.0+Mac Catalyst 13.1+macOS 10.11+visionOS 1.0+

```swift
class CSSearchableIndex
```

### Overview

A `CSSearchableIndex` object manages an on-device index for your app's searchable content. To make your app's content searchable, package it in one or more `CSSearchableItem` objects and add them to the index. You can create as many searchable indexes as you need to manage your content, and you can apply different levels of encryption to protect the content in each index. When you execute a query, Core Spotlight searches your app's indexes for the requested information and returns the results to your code.

Put your content into a custom `CSSearchableIndex` that you create. Custom indexes support batch operations and additional levels of data protection. Place sensitive personal information in protected indexes to encrypt that content, and prevent its disclosure without proper authorization from the owner of the device. Although you can put content into the default index, you can't encrypt the content in that index or perform batch operations to add content to it.

When adding large amounts of data to the index, consider adding it in batches to minimize risk. Batch-based updates make it easier to handle errors that might occur during the indexing process. For each batch, you provide client-state information to identify the current batch. If your app or extension crashes while a batch operation is in progress, you can use that state information to determine where to start indexing again later.

Modify custom `CSSearchableIndex` objects only on one thread or task at a time. It's a programming error to access a custom index from multiple threads simultaneously. When performing batch updates on an index, start each new batch operation only after calling the `endBatch(withClientState:completionHandler:)` or `endIndexBatch(expectedClientState:newClientState:completionHandler:)` method of the previous batch operation.

### Topics

#### Creating an index

- `class func default() -> Self` - Returns the default on-device index.
- `init(name: String)` - Returns an on-device index with the specified name.
- `init(name: String, protectionClass: FileProtectionType?)` - Returns an on-device index with the specified name and data protection class.

#### Determining if indexing is available

- `class func isIndexingAvailable() -> Bool` - Returns a Boolean value that indicates whether indexing is available on the current device.

#### Responding to index-related changes

- `protocol CSSearchableIndexDelegate` - A protocol that defines methods a delegate object or app extension uses to handle communication from the on-device index.
- `var indexDelegate: (any CSSearchableIndexDelegate)?` - The delegate object that can handle index-management tasks.

#### Managing items in an index

- `func indexSearchableItems([CSSearchableItem], completionHandler: (((any Error)?) -> Void)?)` - Adds or updates items in the index.
- `func deleteAllSearchableItems(completionHandler: (((any Error)?) -> Void)?)` - Deletes all searchable items from the index.
- `func deleteSearchableItems(withDomainIdentifiers: [String], completionHandler: (((any Error)?) -> Void)?)` - Removes from the index all searchable items associated with the specified domain.
- `func deleteSearchableItems(withIdentifiers: [String], completionHandler: (((any Error)?) -> Void)?)` - Removes from the index all items with the specified identifiers.

#### Batching index updates

- `func beginBatch()` - Begins a batch of updates to an index.
- `func endBatch(withClientState: Data, completionHandler: (((any Error)?) -> Void)?)` - Ends a batch of index updates and stores the specified state information.
- `func endIndexBatch(expectedClientState: Data?, newClientState: Data, completionHandler: (((any Error)?) -> Void)?)` - Ends a batch of index updates and stores the specified state information.
- `func fetchLastClientState(completionHandler: (Data?, (any Error)?) -> Void)` - Fetches the app's most recent client state information asynchronously.

---

## Adding Content to Spotlight Indexes

**Create a description for your app's content and add it to a Spotlight index to make it searchable.**

### Overview

Search makes your app's content easier to find, and plays a role both inside your app and for features like Spotlight Search, Handoff, Siri Suggestions, Reminders, and more. Making your content searchable enhances the overall user experience of your app and improves the discoverability of your content.

To help search find your content, create a private, on-device index using the Core Spotlight framework and add your app's data to that index. Search works best when you index content that the person cares about or interacts with directly, such as favorites, items they purchased, messages they sent and received, and so on.

In addition to the content people can see in your UI, enable the `isEligibleForSearch` property in relevant `NSUserActivity` objects that your app sends and receives. Enabling this property in user-initiated activities adds those activities to the on-device index and includes them in subsquent searches. For more information, see `NSUserActivity`.

### Assemble the item attributes

After you identify the content you want to index, collect some details about it. Regardless of whether an item is a file or some part of your app's data structures, you provide metadata for that item to the Core Spotlight index. You specify this metadata using a `CSSearchableItemAttributeSet` object, filling out only the properties that make sense for your content. Attribute sets include data for specific types of content, such as images and music. They also contain more general information about an item, such as its name, who created it, the subject matter, and more.

Create the `CSSearchableItemAttributeSet` object and fill in as many properties as makes sense for your data. Attribute sets store simple data types such as strings, numbers, and dates to make the information easier to search. The following example shows a method to index an app-specific data type that manages a spreadsheet document. The code retrieves data from the custom type to fill in the relevant attributes:

```swift
// Create an attribute set to describe an item.
func addSpreadsheetToIndex(_ item: MySpreadsheetType) {
    // Assemble the metadata for the spreadsheet file.
    let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.spreadsheet)
    attributeSet.title = item.title
    attributeSet.contentDescription = "Spreadsheet Document"
    attributeSet.thumbnailData = item.thumbnailImage
    attributeSet.contentURL = item.fileURL

    // Create the searchable item.

    // Add the item to the index.
}
```

The `CSSearchableItemAttributeSet` class supports making a phone call or getting directions to a location associated with an item. To enable these features, set the item's `supportsPhoneCall` or `supportsNavigation` property to `1` and fill in the relevant phone number or latitude and longitude information. Only enable these actions when it's appropriate and they represent a primary action someone is likely to take. For example, it makes sense to let someone call a business, but it doesn't make sense to let someone call a phone number that appears on a research paper.

### Create a searchable item to find your content later

With the attributes you collect for each item, create a `CSSearchableItem` to pass to the indexing system. For each searchable item, specify these details:

- A unique identifier string for locating the item in your app's data structures
- The attribute set with the item's metadata
- An optional string that specifies the domain or owner of the item.

Create searchable items as soon as you have the information to do so. When someone creates a new item in your app, create a searchable item for it immediately and add it to the index. When someone changes the title of an item or other details, update the attributes and add it to the index again. It's very important to keep your app's indexes up to date so that searches return current information. People are more likely to engage with your app if it returns good search results. A high level of engagement also helps increase the ranking of your searchable items.

The following code builds on the previous example by creating a searchable item for a custom app data structure. The code uses data from the data item itself to fill in various attributes.

```swift
// Create an attribute set to describe an item.
func addSpreadsheetToIndex(_ item: MySpreadsheetType) {
    // Assemble the metadata for the spreadsheet file.
    let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.spreadsheet)
    attributeSet.title = item.title
    attributeSet.contentDescription = "Spreadsheet Document"
    attributeSet.thumbnailData = item.thumbnailImage
    attributeSet.contentURL = item.fileURL

    // Create the searchable item.
    let item = CSSearchableItem(uniqueIdentifier: item.identifier, domainIdentifier: nil, attributeSet: attributeSet)

    // Add the item to the index.
}
```

If you expect an item to exist for an extended period of time, set an appropriate value in the item's `expirationDate` property. The system automatically expires items after a period of time, so setting an expiration date causes the system to preserve the item until the date you specify. If the person deletes the original data from your app, remove the associated item from the index.

### Add items to a searchable index

To make your items appear in search results, add them to a `CSSearchableIndex` object. Indexes store your app-specific data and remain on the device. You can create multiple indexes for your app, and might do so to protect someone's personal information. For example, a music app might place the general catalog of songs in the default index and someone's private playlists in an encrypted index.

The default `CSSearchableIndex` object supports the indexing of items that don't require special protection. When indexing content that contains more sensitive data, such as someone's contact information, create a more secure index using the `init(name:protectionClass:)` method. The following example creates a secure index in addition to retrieving the default index for data that doesn't require any specific protections:

```swift
// Get the default index.
let defaultIndex = CSSearchableIndex.default()

// Create an encrypted index.
let secureIndex = CSSearchableIndex(name:"MyIndex", protectionClass:.complete)
```

To add new items to an index, or to update items already in an index, call the `indexSearchableItems(_:completionHandler:)` method of that index. The method incorporates the items asynchronously into the index and notifies you when the work is done. Typically, you submit items only when they change, but you might also submit items to extend their expiration date.

```swift
secureIndex.indexSearchableItems([item]) { error in
    if error != nil {
        print(error?.localizedDescription)
    } else {
        print("Item indexed.")
    }
}
```

### Add multiple items to the index in batches

When adding or updating large numbers of items, consider breaking those updates into multiple batches. Batch updates make it easier for your code to recover from errors or crashes that happen during the indexing process. The system waits for you to specify your searchable items and end the batch update before it begins indexing the items. If an error occurs, the metadata you add to the batch lets you determine the extent of the indexing progress, and where the error occurred.

The following example shows a function that indexes several items using a batch update. You can specify any information you want for the client data, but must limit the total size of it to 250 bytes. If any errors occur during the batch update, you can call `fetchLastClientState(completionHandler:)` to determine where to start indexing your content again.

```swift
func indexBatch(_ items: [CSSearchableItem]) {
    let index = CSSearchableIndex(name: "MyIndex")

    var clientData = Data()
    // Fill clientData with something to identify the current items.

    index.beginBatch()
    index.indexSearchableItems(items)
    index.endBatch(withClientState: clientData) { error in
        if error != nil {
            // Handle the error.
        } else {
            // Success
        }
    }
}
```

---

## CSSearchQuery

**A type you use to programmatically search the indexed app content.**

iOS 10.0+iPadOS 10.0+Mac Catalyst 13.1+macOS 10.13+visionOS 1.0+

```swift
class CSSearchQuery
```

### Overview

Use a `CSSearchQuery` object to search your app's indexed content using a formatted search string. To perform a search, build a predicate string to specify the indexed attributes you want to search and the value you want them to match. After you start the query, you receive batches of results in the handlers you provide.

Each `CSSearchQuery` object you create performs a single search operation and delivers the results back to your code. Build each predicate with an attribute name, one or more values, and either a comparison operator or the `InRange` operator. Your predicate string takes one of the following forms:

- `attributeName operator value[modifiers]`
- `InRange(attributeName, minValue, maxValue)`

Queries search all of your app's indexes by default. If your app encrypts some of its indexed data, you can limit your search to one or more of the encrypted indexes by updating the query's `protectionClasses` property. The query must have access to the protected index to search it.

For more information about how to construct predicate strings for your query, see Searching for information in your app.

### Topics

#### Creating a query object

- `convenience init(queryString: String, attributes: [String]?)` - Initializes and returns a query object with the specified query string and item attributes. (Deprecated)
- `init(queryString: String, queryContext: CSSearchQueryContext?)` - Initializes and returns a query object with the specified query string and query context.

#### Continuing an activity

- `let CSSearchQueryString: String` - Provides the key for the current query in the info dictionary of the user activity object.
- `let CSQueryContinuationActionType: String` - Indicates that the activity type to continue is a search or query.

#### Specifying the indexes to search

- `var protectionClasses: [FileProtectionType]` - The protection types of the indexes you want to search.

#### Executing the query automatically

- `var results: CSSearchQuery.Results` - The results that match the current query string.
- `struct Results` - An asynchronous sequence that contains the results that match the query string.

#### Executing the query with handler blocks

- `func start()` - Starts searching the index for items that match the current query string and parameters.
- `func cancel()` - Cancels the current query operation.
- `var isCancelled: Bool` - A Boolean value that indicates whether the current query is no longer running.
- `var foundItemCount: Int` - The number of matching items found for the given query string.
- `var foundItemsHandler: (([CSSearchableItem]) -> Void)?` - The block to execute when the query delivers a new batch of matching items.
- `var completionHandler: (((any Error)?) -> Void)?` - The block to execute when the query finishes delivering all results.

---

## Searching for Information in Your App

**Search for app-specific content and refine search results using predicates and filters.**

### Overview

Add search capabilities to your app to find relevant information quickly. Instead of building your own custom search tools, index your content using the Core Spotlight APIs and use the framework-provided queries to retrieve information. Indexing your content makes it available to both your app and to the system's Spotlight search feature.

Use a `CSSearchQuery` object to execute a search of your app's indexed content. With this query object, you specify which attributes of an item to match, and the values that constitute a match. For example, you might tell the query to look for media clips with a duration in a specific range. Although you might incorporate input from your app's UI when building your query string, use this query type to match specific attributes of your indexed content. For information about how to search based solely on input from a person, see Building a search interface for your app.

### Select the attributes you want the query to retrieve

When you execute a query, the system doesn't automatically retrieve every property of your `CSSearchableItem` objects. Instead, it retrieves only the properties you specifically request. This behavior improves performance by not spending time to retrieve information your app doesn't need.

Identify the properties you want, and specify the property names as strings when you initialize your query. For example, to fetch the title and display name of each item, include "title" and "displayName" strings in the `fetchAttributes` property of your context object.

### Create a query string for your search

When you execute a query, Core Spotlight evaluates each item in the index against a query string you provide. Construct your query string from one or more predicates, and use each predicate to evaluate an attribute of the indexed item. If the predicates in the overall query string evaluate to true for an item, the query object returns the item in the search results. For each predicate in your query string, use one of the following formats:

- `attributeName operator value[modifiers]`
- `InRange(attributeName, minValue, maxValue)`

In both formats, `attributeName` is a property name from the `CSSearchableItemAttributeSet` class. For example, to evaluate the `title` property of the item, use "title" as the attribute name. The `InRange` predicate determines whether a property with a numeric value is between the specified minimum and maxium values. Other predicates compare the attribute to the value you specify using one of the following operators:

| Operator | Definition |
| --- | --- |
| == | Equal. |
| != | Not equal. |
| < | Less than. Works only for numeric and date values. |
| > | Greater than. Works only for numeric and date values. |
| <= | Less than or equal. Works only for numeric and date values. |
| >= | Greater than or equal. Works only for numeric and date values. |

When comparing text values, use modifiers to change the matching behavior the query applies to the comparison. Queries support the following modifiers:

| Modifier | Behavior |
| --- | --- |
| c | Performs a case-insensitive search. |
| d | Performs a search that ignores diacritical marks. |
| w | Matches on word boundaries. This modifier treats transitions from lowercase to uppercase as word boundaries. |
| t | Performs a search on a tokenized value. For example, a search field can contain tokenized values. |
| * | Performs a wildcard search. Match a substring at the beginning, end, or middle. |
| \ | Don't interpret the character that follows. Use this to include special characters. Examples include `\'` and `\"`. |

Combine two predicates using either an AND or OR operation, listed in the table below. Use parentheses to prioritize the evaluation of predicates.

| Combination operator | Definition |
| --- | --- |
| `&&` | AND operator. If both predicates are true, the entire result is true. If one predicate is false, the result is false. |
| `||` | OR operator. If either predicate is true, the entire result is true. Otherwise, the result is false. |

The following examples show how operators, modifiers, and parentheses work for query strings. When trying to match a specific word, notice that the `w` modifier is more precise than a wildcard because of how it matches word boundaries.

| Query string | Example matches |
| --- | --- |
| `title == "Paris"` | Matches "Paris" but not "paris" or "I love Paris". |
| `title == "Paris"c` | Matches "Paris" and "paris", but not "I love Paris". |
| `title == "Paris"wc` | Matches "Paris", "paris", "I love Paris", and "paris-france.jpg", but not "Comparison". |
| `title == "Window"w` | Matches "MyWindowClass" and "Broken Window", but not "NSWindow". |
| `authorNames == "Frédéric"` | Matches "Frédéric", but not "Frederic". |
| `authorNames == "Frédéric"cd` | Matches "Frédéric" and "Frederic", regardless of case. |
| `title == "paris*"` | Matches words that begin with "paris" like "paris" and "parisol" but not "comparison". |
| `title == "*paris"` | Matches words that end with "paris". |
| `title == "*paris*"` | Matches words that contain "paris" anywhere in the string, including "paris", "parisol", and "comparison". |
| `title == 'paris'` | Matches a value that is exactly equal to "paris". |
| `authorNames == "Steve"wc && contentType == "audio"wc'` | Matches audio items that Steve authored. |
| `authorNames == "Steve"wc && (contentType == "audio"wc || contentType == "video"wc)` | Matches any audio or video items that Steve authored. |

### Match dates and times in a query string

When an attribute contains a date or time value, there are two ways you can specify the value portion of your predicate:

- Specify a floating-point value with the number of seconds relative to January 1, 2001. You can get this value from a CFDate or `Date` type using the `CFDateGetAbsoluteTime(_:)` function.
- Specify a property of the built-in `$time` variable.

`CSSearchQuery` provides the `$time` variable as a convenient way to specify date values in your query strings. When you start a query, the system initializes this variable to the current date and time. Include this variable in the value portion of your predicate to compare a date-based attribute to the date you specify. The following table lists the properties of the variable you can use in your predicates and how the query matches them against attributes.

| `$time` property | Description |
| --- | --- |
| `$time.now` | Matches an attribute set to the current date and time. |
| `$time.today` | Matches an attribute set to the current date. |
| `$time.yesterday` | Matches an attribute set to yesterday's date. |
| `$time.last_week` | Matches an attribute set to a date from the week before the current week. |
| `$time.this_week` | Matches an attribute set to a date from this week. |
| `$time.this_month` | Matches an attribute set to a date in the current month. |
| `$time.this_year` | Matches an attribute set to a date in the current year. |
| `$time.now(NUMBER)` | Adds `NUMBER` seconds to the current date and time and matches the attribute against that value. You can specify negative or positive numbers. |
| `$time.today(NUMBER)` | Adds `NUMBER` days to the current date and matches the attribute against that value. You can specify negative or positive numbers. |
| `$time.this_week(NUMBER)` | Adds `NUMBER` weeks to the current date and matches the attribute against that value. You can specify negative or positive numbers. |
| `$time.this_month(NUMBER)` | Adds `NUMBER` months to the current date and matches the attribute against that value. You can specify negative or positive numbers. |
| `$time.this_year(NUMBER)` | Adds `NUMBER` years to the current date and matches the attribute against that value. You can specify negative or positive numbers. |
| `$time.iso(ISO-8601-STR)` | Matches the date you specify using an ISO-8601-STR compliant string. |

The following example shows a query string that includes different types of predicates and modifiers and uses the `$time` variable. The predicate matches an item if author is either Tim or Steve and the item's completion date occurred within the past 10 days. For the completion date check, adding a negative number to the `$time.today` variable creates a date in the past.

```swift
(authorNames == "Tim"wc || authorNames == "Steve"wc) &&
 InRange(completionDate,$time.today(-10),$time.today)
```

### Start the query and process the results

Search queries are one-shot objects. While they run, they deliver matching items asynchronously to the handlers you provide. When there are no more items, the query stops. You can also stop a query early by calling its `cancel()` method before the system delivers all matching results.

Create a new query using a query string and a `CSSearchQueryContext` object, which contains the query configuration parameters. Start the query by fetching the `results` property of the query object and iterating over the results. The property contains an `AsyncSequence`, and fetching it starts the query and begins the delivery of the results. The following function searches for items with a specific title and processes the results in an asynchronous task:

```swift
import CoreSpotlight

class QueryExample {
    func executeQuery(withTitle title : String) {
        var results = [CSSearchableItem]()
        // Fetch the items with a title that starts with the
        // specified string. Perform a case-insensitive comparison.
        let queryString = "title == '\(title)*'c"

        let context = CSSearchQueryContext()
        context.fetchAttributes = ["title", "displayName", "keywords", "contentType"]

       // Create the query and specify a handler for the results.
        let query = CSSearchQuery(queryString: queryString, queryContext: context)

        // Process the results asynchronously.
        Task {
            do {
                // Start the query and iterate over the results.
                for try await result in query.results {
                    let attributeSet = result.item.attributeSet
                    let foundTitle = attributeSet.title
                    let foundDisplayName = attributeSet.displayName

                    // Use the results here.
                }
            } catch {
                // Handle any errors.
            }
        }
    }
}
```

If you prefer not to process the results using an `AsyncSequence`, specify values for the `foundItemsHandler` and `completionHandler` properties. When using handler blocks, you're responsible for calling the `start()` method to start the query. To deliver results, the query calls your `foundItemsHandler` block one or more times, delivering new results with each call. The system executes your completion handler block only once after it finishes delivering all the results.

The following code shows a version of the previous method that uses handler blocks to process the results.

```swift
import CoreSpotlight

class QueryExample {
    private var query : CSSearchQuery? = nil
    mutating func executeQueryWithHandlers(withTitle title : String) {
        var results = [CSSearchableItem]()
        // Fetch the items with a title that starts with the
        // specified string. Perform a case-insensitive comparison.
        let queryString = "title == '\(title)*'c"

        let context = CSSearchQueryContext()
        context.fetchAttributes = ["title", "displayName", "keywords", "contentType"]

        // Create the query and specify a handler for the results.
        self.query = CSSearchQuery(queryString: queryString, queryContext: context)
        self.query?.foundItemsHandler = { (items : [CSSearchableItem]) -> Void in
            results.append(contentsOf: items)
        }

        // Display the results when the query finishes.
        self.query?.completionHandler = { (error) -> Void in
            if error == nil {
                for item in results {
                    let attributeSet = item.attributeSet
                    let foundTitle = attributeSet.title
                    let foundDisplayName = attributeSet.displayName

                    // Use the results here.
                }
            } else {
                // Handle the error.
            }
        }

        // Start the query.
        self.query?.start()
    }
}
```

---

## Building a Search Interface

**Add a search interface to your app to execute Spotlight queries and offer suggested text completions.**

### Overview

Adding search tools to your app gives people a way to find content more easily. Whether you add search controls to an app window or to one of the views in your interface, use Spotlight to generate the search results for your content. Spotlight searches the content you already indexed, and provides relevant text completions and results for you to display. In iOS 18 and macOS 15 and later, Spotlight also supports semantic searches of your content, in addition to lexical matching of a search term.

To take full advantage of search into your interface, make sure you index your app's content and provide it to Spotlight. As your app generates or changes its content, send the details of those changes to Spotlight so it can update its indexes. It's also important to provide an app extension that Spotlight can call to regenerate those details on demand. For more information about providing Spotlight with your app's data, see Adding your app's content to Spotlight indexes.

### Add a search field to your interface

Apple's UI frameworks provide search controls you can add to your interface, and support to provide a consistent search experience. Incorporate these controls into your views and use the built-in support to initiate searches and display the results.

- In SwiftUI, add a `searchable` modifier to a view in your interface. This modifier creates an implicit search field to your interface and binds it to the string you use to initiate queries. For more information, see Adding a search interface to your app.
- In UIKit, add a `UISearchBar` control to your interface, and display results using an associated `UISearchController`.
- In AppKit, `NSSearchField` provides a text field with search-related behaviors.

The built-in search controls provide features that people expect when searching for content, such as text completions and text tokens. You can also apply filters to limit the scope of the search to a particular part of your app. Core Spotlight helps you implement these features by providing the data you need for your app's interface in a compatible format.

### Prepare the search system

To ensure initial searches happen quickly, call the `prepare()` class method. Call this method before you need to perform queries, such as when the view that presents your search interface first appears. You don't need to call the method more than once when your app is running, and you don't need to execute the query itself. The method prepares Core Spotlight resources, which can take a noticeable amount of time. It also increases your app's memory footprint, so call it as late as possible to minimize the performance impact.

### Execute a query and receive the responses

When someone types a value into your app's search control, don't execute the query immediately. Instead, give the person a small amount of time to type more text into the search field. For example, wait 0.3 seconds after each new keystroke before starting a query with the current text. If a new keystroke arrives before the time elapses, reset the waiting period. Starting the query on a delay keeps your app responsive to keystrokes, and doesn't waste time executing searches and throwing away the results.

To configure a query with text from a search control, use a `CSUserQuery` object. User queries are for situations where your app takes input directly from a person. Pass the search text directly to the query object, along with a `CSUserQueryContext` object with any additional query parameters. The following example configures a context object with the attributes to fetch for search results and configures some additional search parameters. The `searchText` variable contains the string from the search control.

```swift
let queryContext = CSUserQueryContext()
queryContext.fetchAttributes = ["title", "textContent", "authorNames", "contentDescription"]
queryContext.maxSuggestionCount = 10
queryContext.enableRankedResults = true

let query = CSUserQuery(userQueryString: searchText, userQueryContext: queryContext)
```

To execute the query in Swift and get the results, fetch the `responses` property of the query object. This property contains an `AsyncSequence` that delivers values to your app as they become available. Fetching this sequence starts the query and begins delivering both results and suggestions asynchronously to your code. For each response, determine whether it is a search result or a suggested text completion and update your interface appropriately. The following example shows a template to use to process responses from the query:

```swift
Task {
    do {
        // Start the query and get the results.
        for try await element in query.responses {
            switch(element) {
                case .item(let item):
                    // Add the item to the list of search results to display.
                    break
                case .suggestion(let suggestion):
                    // Pass suggestions back to the search interface to display.
                    break
                @unknown default:
                    break
            }
        }
    } catch {
        // Handle any errors.
    }
}
```

If you're not using Swift or prefer to use process results and suggestions separately, configure the appropriate handlers for your query object and call the `start()` method. As Spotlight generates results, it delivers them to the handlers in the `foundItemsHandler` and `foundSuggestionsHandler` properties of the query object. Use those handlers to process results and suggestions and display them in your interface. You can also add a completion handler to the query to determine when Spotlight finishes delivering results.

When someone interacts with your search control, you typically create multiple query objects to generate results. Query objects run only once, and you don't reuse them by changing the query string. When the person types more text into your search control, cancel the previous query and create a new one for the new string.

For more information about how to configure query parameters, see `CSUserQueryContext`.

### Display completions for typed text

Suggestions make it easier for someone to discover relevant search terms from your search interface. The `CSUserQuery` object you use to fetch results also generates suggestions that you can use to populate your search interface. You can display these suggestions any time someone interacts with your search control. When you execute a query, Spotlight offers a set of ranked suggestions based on the query text and your app's content.

To display suggested text completions from a SwiftUI, add a `searchSuggestions(_:)` modifier to your view. The modifier takes a closure, which you use to build views for the suggestions. When collecting responses using the `responses` asynchronous sequence, save the `CSUserQuery.Suggestion` structures you receive and use them to create your views. Each structure contains a `CSSuggestion` object with the details of the suggestion. The following example iterates over the list of structures and builds a set of text views from the provided suggestions.

```swift
List {
    // Your view's content.
}
.searchable(text: $searchText)
.searchSuggestions({
    ForEach($suggestions, id: \.self) { item in
        let title = String(item.suggestion.localizedAttributedSuggestion.characters)
        Text(title)
            .searchCompletion(title)
    }
})
```

To display suggestions from a `UISearchController` in your UIKit app, create `UISearchSuggestionItem` objects for each suggestion you receive from your query. When you add those suggestion items to the `searchSuggestions` property of the search controller, it automatically displays them from its interface. Each time you execute a new query, clear the old search suggestions from this property and add the new ones.

For more information on adding search suggestions to your SwiftUI views, see Suggesting search terms.

---

## Regenerating Indexes on Demand

**Create an app extension to maintain your app's indexes and regenerate them as needed.**

### Overview

Keeping your app's indexes up to date requires periodic maintenance. An app that crashes while updating its index might leave that index in an incorrect state. The system can also ask your app to regenerate the index if it's missing or needs updated data. If your app isn't running when the system needs these updates, it uses your reindexing app extension to generate them instead.

A reindexing app extension is an important tool for keeping your indexes up to date at all times. Include this app extension in your app bundle, and make sure it has access to all of your app's indexable data.

### Add a reindexing app extension to your app

Xcode provides a template to make it easy to add a reindexing app extension to your app. Add this template to your project using the following steps:

1. Open the Xcode project with your app.
2. Select File > New > Target.
3. Select the platform for your app.
4. In the Application Extension section, select the CoreSpotlight Delegate template.
5. Click Next.
6. Give your app extension a name and configure the other options.
7. Click Finish.

The CoreSpotlight Delegate template contains empty implementations for the key functions of the `CSSearchableIndexDelegate` protocol, including the methods you use to update the index. Add your custom code to these methods, and make sure to call the acknowledgement handlers for your main indexing functions, as shown:

```swift
import CoreSpotlight

class MyIndexingExtension: CSIndexExtensionRequestHandler {

    override func searchableIndex(_ searchableIndex: CSSearchableIndex,
                  reindexAllSearchableItemsWithAcknowledgementHandler acknowledgementHandler: @escaping () -> Void) {
        // Index everything.
        acknowledgementHandler()
    }

    override func searchableIndex(_ searchableIndex: CSSearchableIndex,
                  reindexSearchableItemsWithIdentifiers identifiers: [String],
                  acknowledgementHandler: @escaping () -> Void) {
        // Index the specified items.
        acknowledgementHandler()
    }

    // Other methods.
}
```

For information about how to add content to your app's indexes, see Adding your app's content to Spotlight indexes.

### Debug your app extension code

Verify your app extension behaves as expected using the Xcode debugger. Start by building your app extension and attaching the debugger to it.

1. Select your app target
2. Build and run your app.
3. Back in Xcode, select your app extension target.
4. Select Debug > Attach to Process by PID or Name.
5. Set the name of the process to the bundle ID of your app extension.
6. Click the Attach button.

Because you can't predict when the system will run your app extension, you need to force the system to run it immediately using the `mdutil` command-line tool. Open Terminal and run that command with the `-cr` option, followed by the bundle identifier of your app extension. Here's an example of this command:

`mdutil -cr com.example.MyApp.MyIndexingExtension`

The `mdutil` tool starts the reindexing process for the app extension you specify. If you set any breakpoints in your app extension's code, the attached debugger stops at them and gives you a chance to examine the state of your extension.

---

## CSIndexExtensionRequestHandler

**An interface that implements an index-maintenance app extension.**

iOS 9.0+iPadOS 9.0+Mac Catalyst 13.1+macOS 10.11+visionOS 1.0+

```swift
class CSIndexExtensionRequestHandler
```

### Overview

The `CSIndexExtensionRequestHandler` class provides the main entry point for an index-maintenance app extension. If any issues arise with your app's indexes and your app isn't running, the system loads your app extension and looks for an implementation of this class. It instantiates the class it finds and uses it to perform any index-related maintenance.

Define a custom subclass of `CSIndexExtensionRequestHandler` in your app extension and implement methods of the `CSSearchableIndexDelegate` protocol in it. Use those methods to perform any required updates to your app's index files. For example, use the `searchableIndex(_:reindexAllSearchableItemsWithAcknowledgementHandler:)` method to reindex all items in your app.

---

## CSUserQuery

**A type you use to initiate searches from your interface and offer suggested text completions.**

iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+visionOS 1.0+

```swift
class CSUserQuery
```

### Overview

A `CSUserQuery` object provides the back-end support for your app's search features. Combine this object with your app's search interface to perform lexical and semantic searches of human-entered search terms. You can configure a query object to return ranked or unranked results. You can also use it to get a list of suggestions to display from your search interface.

When the text in your search control changes, create a query object to begin searching for results based on the current text. You use a query object only once to perform a search. If the text changes again while you a previous query is in progress, cancel the old query and execute the new one. For this reason, it's a good idea to delay the start of each query until there is a sufficient gap between changes.

Configure the query parameters using a `CSUserQueryContext` object, which you can reuse for multiple queries. The context lets you configure the behavior for ranking results, specify the maximum number of results and suggestions, and filter the results using a predicate string. When you're ready to start the query, choose one of the following options:

- Get the value of the `responses` property and iterate over the results.
- Configure the `foundItemsHandler` property and call `start()` to execute the query manually.

Each query runs until Spotlight returns the requested maximum number of results. If you don't specify the maximum number of results, Spotlight runs until it returns all results. To end a search before you receive all the results, call the `cancel()` method. Cancelling a query is especially important if you're about to start a new query with an updated search string.

For more information about configuring a `CSUserQuery` object, see Building a search interface for your app.

### Topics

#### Creating a user query

- `init(userQueryString: String?, userQueryContext: CSUserQueryContext?)` - Creates a new user query that searches for the specified term.

#### Preparing to search

- `class func prepare()` - Performs one-time tasks that prepare Spotlight to search for content in all search indexes.
- `class func prepareProtectionClasses([FileProtectionType])` - Performs one-time tasks that prepare Spotlight to search for content in one or more protected search indexes.

#### Executing the query automatically

- `var responses: CSUserQuery.Responses` - The matching results and suggestions for the current query string.
- `var suggestions: CSUserQuery.Suggestions` - An asynchronous sequence of suggested completions for the current query text.
- `struct Responses` - An asynchronous sequence that contains the results and suggestions for a query string.
- `struct Suggestions` - An asynchronous sequence that contains the suggested completions for a search string.
- `struct Item` - A search result that the query returns in a response.
- `struct Suggestion` - A suggested text completion for a query's search term.

#### Executing the query with handler blocks

- `func start()` - Starts searching the index for items that match the current query string and parameters.
- `func cancel()` - Cancels the current query operation.
- `var foundSuggestionsHandler: (([CSSuggestion]) -> Void)?` - The block to execute when the query delivers a new batch of suggested items.
- `var foundSuggestionCount: Int` - The number of suggested items the query found so far.

#### Improving the quality of ranked results

- `func userEngaged(CSUserQuery.Item, visibleItems: [CSUserQuery.Item], interaction: CSUserQuery.UserInteractionKind)` - Notifies the system that someone engaged with a specific search result in your app's interface.
- `func userEngaged(CSUserQuery.Suggestion, visibleSuggestions: [CSUserQuery.Suggestion], interaction: CSUserQuery.UserInteractionKind)` - Notifies the system that someone engaged with a specific text completion in your app's interface.
- `enum UserInteractionKind` - Constants that indicate how someone engaged with search-related content.

---

## Apple Intelligence Summarization and Prioritization

**Summarize and prioritize app content using Spotlight extensions.**

### Overview

In iOS 18.4 and macOS 15.4 and later, Apple Intelligence can optionally summarize mail, messages, and audio transcripts, and prioritize mail and messages content when you provide the content to Core Spotlight.

Enable this functionality by providing a Spotlight delegate app extension for your app.

The following example demonstrates adding summarization and prioritization to a messaging app. The process you use to add a Spotlight app extension is the same for other kinds of apps; the difference is the content type of the items that the system indexes to Spotlight.

### Create a Spotlight delegate app extension

To create a Spotlight delegate app extension, add a new target to your app's Xcode project and select "CoreSpotlight Delegate".

In the app extension, override the `searchableItemsDidUpdate(_:)` method to write to the app's shared group information store, such as a database:

```swift
override func searchableItemsDidUpdate(_ items: [CSSearchableItem]) {
    for item in items {
        if let isPriority = item.attributeSet.isPriority {
            // Item has a priority classification.
        }
        if let summary = item.attributeSet.textContentSummary {
           // Item has a summary.
        }
    }
}
```

Spotlight calls this method whenever a mail, message, or audio transcript you provide finishes processing and Apple Intelligence updates it with a summary or priority.

### Create a searchable item in your app

In your messaging app, you create a `CSSearchableItem` that contains the content Spotlight indexes:

```swift
let attributeSet = CSSearchableItemAttributeSet()
attributeSet.contentType = UTType.message.identifier
attributeSet.textContent = "You should replace this attribute with the text content for this particular message item. The length of this content must be at least 200 characters for it to be eligible for single-message summarization."
attributeSet.domainIdentifier = "conversationId"
attributeSet.contentCreationDate = Date.now
attributeSet.authors = [CSPerson(displayName: "Test Person", handles: ["1234567890"], handleIdentifier: "phoneNumbers")]

let csItem = CSSearchableItem(uniqueIdentifier: "uniqueId", domainIdentifier: "uniqueId", attributeSet: attributeSet)
```

The app then sets the listener flag to include summarization or prioritization (or both):

```swift
csItem.updateListenerOptions.insert(.summarization)
csItem.updateListenerOptions.insert(.priority)
```

And, lastly, the app adds the `CSSearchableItem` to Spotlight:

```swift
try await CSSearchableIndex.default().indexSearchableItems([csItem])
```

### Select the correct attributes for your default app

In order for Apple Intelligence to summarize or prioritize a `CSSearchableItem`, set the following attributes, based on the type of default app:

| Mail apps | Messaging apps | Audio Transcripts |
| --- | --- | --- |
| `authors` | `authors` |  |
| `contentCreationDate` | `contentCreationDate` | `contentCreationDate` |
| `domainIdentifier` | `domainIdentifier` | `domainIdentifier` |
| `htmlContentData` or `textContent` | `textContent` | `transcribedTextContent` |
| `uniqueIdentifier` | `uniqueIdentifier` | `uniqueIdentifier` |

### Enable summarization for email and message threads

In iOS 18.4 and later and macOS 15.4 and later, Apple Intelligence supports optional summarization of email and message threads; these are separate capabilities that your app can adopt as needed.

To summarize multiple _messages_ in a conversation, adopt `INSearchForMessagesIntent` in your app. This class enables Apple Intelligence to fetch previously unread messages from a conversation. Provide a `domainIdentifier` when indexing these messages into Spotlight; Apple Intelligence uses the `domainIdentifier` to group messages into conversations.

To summarize multiple _emails_ in a conversation, provide implementations of `AssistantEntity(schema:)` in your app for the `account`, `mailbox`, and `message` entities; these entities are part of the App Intents API, and enable Apple Intelligence to fetch previously unread emails from the conversation. As with message summarization, provide `domainIdentifier` when indexing emails into Spotlight. Apple Intelligences uses the `domainIdentifier` to group emails into conversations. The `domainIdentifier` needs to be globally unique across accounts and mailboxes.

With this information, the email thread summarization process proceeds as follows:

1. Your app provides email for Spotlight to index. Populate the `domainIdentifier` property with the identifier for the conversation to which the email belongs.
2. The system asks Spotlight for the email identifiers for all emails sharing the same `domainIdentifier`.
3. The system issues a query to your app with the email identifiers from the previous step. Respond with the emails matching the identifiers the system provides in the App Entity query.
4. Apple Intelligence combines the email from the initial indexing request and any additional email messages the system receives from your app as part of the follow-up request, and summarizes their content.
5. Your app receives a callback from Core Spotlight that contains the summarization result.

### Ensure your searchable item is eligible

Apple Intelligence only considers an item for summarization or prioritization when it meets the following criteria:

- The `contentType` contains one of the following UTI types: `message` or `emailMessage`, or `public.voice-audio`.
- The item has either the `CSSearchableItemFlagNeedsSummary` or `CSSearchableItemFlagNeedsPriority` options set.
- The `contentCreationDate` is no more than 24 hours old.
- The content isn't empty; this criteria applies specifically to `textContent` for messages, `textContent` or `htmlContentData` for mail, and `transcribedTextContent` for voice audio transcripts.
- For summarization, the `CSSearchableItemFlagNeedsSummary` option is set to `true` and the content is at least `200` characters in length.
- If you adopt `INSearchForMessagesIntent` to support multiple message summarization, Apple Intelligence uses the combined content length of the unread message history, which must be at least 200 characters to be eligible for summarization.
- For prioritization, the `CSSearchableItemFlagNeedsPriority` option is set.
- Mail or messages need `authors`, and the system doesn't summarize the same `CSSearchableItem` twice, even if you present the item to Core Spotlight again.