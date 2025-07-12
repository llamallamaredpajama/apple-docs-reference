# CoreSpotlight Framework

## Overview
CoreSpotlight is Apple's framework for adding search capabilities to your app and indexing content so users can find it from Spotlight and Safari. The framework provides APIs to add content to on-device indexes and search for items in those indexes.

### Key Features
- Add app content to Spotlight search
- Create searchable item indexes
- Support for custom attributes and metadata
- Integration with NSUserActivity for public indexing
- Private on-device indexes (not shared with Apple)
- Support for batch operations and data protection

## Core Components

### CSSearchableItem
The fundamental unit representing searchable content in your app.

#### Key Properties
- `uniqueIdentifier`: String that uniquely identifies the item within your app
- `domainIdentifier`: Optional identifier for grouping related items
- `attributeSet`: CSSearchableItemAttributeSet containing metadata
- `expirationDate`: Date after which the item should be removed
- `isUpdate`: Boolean indicating if this is an update vs new item

#### Usage Example
```swift
let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
attributeSet.title = "My Document"
attributeSet.contentDescription = "This is a searchable document"
attributeSet.keywords = ["document", "example", "searchable"]

let item = CSSearchableItem(
    uniqueIdentifier: "doc-123",
    domainIdentifier: "documents",
    attributeSet: attributeSet
)
```

### CSSearchableItemAttributeSet
Detailed metadata for searchable items, organized into categories.

#### General Attributes
- `title`: The title of the item
- `displayName`: Localized display name for UI
- `contentDescription`: Description of the content
- `keywords`: Array of keywords for searching
- `contentType`: UTI of the item
- `contentURL`: File URL if applicable
- `thumbnailURL`/`thumbnailData`: Thumbnail image
- `alternateNames`: Alternative display names
- `path`: Complete path to the item
- `rankingHint`: Relative importance (0.0-1.0)

#### Document Attributes
- `subject`: Document subject
- `creator`: App that created content
- `pageCount`: Number of pages
- `pageHeight`/`pageWidth`: Page dimensions in points
- `fontNames`: Fonts used in document
- `fileSize`: Size of document file
- `encodingApplications`: Apps that converted to PDF

#### Media Attributes
- `duration`: Content duration in seconds
- `codecs`: Codecs used for encoding
- `streamable`: If content is prepared for streaming
- `audioBitRate`/`videoBitRate`: Bit rates
- `contentSources`: Sources of media
- `copyright`: Copyright information
- `lastUsedDate`: When file was last used
- `playCount`: User-supplied play count
- `rating`: User rating

#### Music Attributes
- `album`: Album title
- `artist`: Artist name
- `composer`: Composer name
- `lyricist`: Lyricist/text writer
- `audioChannelCount`: Number of audio channels
- `audioSampleRate`: Sample rate in Hz
- `musicalGenre`: Genre (jazz, pop, rock, etc.)
- `tempo`: Beats per minute
- `keySignature`: Musical key (C, Dm, F#m)

#### Image Attributes
- `pixelHeight`/`pixelWidth`: Dimensions in pixels
- `colorSpace`: Color model (RGB, CMYK, etc.)
- `bitsPerSample`: Bits per sample
- `flashOn`: If flash was used
- `focalLength`: Actual focal length in mm
- `cameraOwner`: Owner of camera
- `lensModel`: Lens model used
- `isoSpeed`: ISO speed setting
- `aperture`: Aperture as APEX value
- `orientation`: Data orientation

#### Location Attributes
- `latitude`/`longitude`: Coordinates using WGS84
- `altitude`: Meters above sea level
- `namedLocation`: Location/POI name
- `city`: City name
- `country`: Country/region name
- `stateOrProvince`: State or province
- `postalCode`: Postal code
- `thoroughfare`: Street name
- `subThoroughfare`: Street number
- `fullyFormattedAddress`: Complete address from MapKit

#### Event Attributes
- `startDate`/`endDate`: Event dates
- `allDay`: If event is all day
- `dueDate`: Due date
- `completionDate`: Completion date
- `importantDates`: Array of important dates

#### Message Attributes
- `textContent`: Textual content of message
- `htmlContentData`: HTML content as UTF-8 data
- `authors`: CSPerson array for From field
- `primaryRecipients`: CSPerson array for To field
- `additionalRecipients`: CSPerson array for Cc field
- `hiddenAdditionalRecipients`: CSPerson array for Bcc field
- `emailAddresses`: Associated email addresses
- `phoneNumbers`: Associated phone numbers
- `accountIdentifier`: Unique account ID
- `likelyJunk`: If message is likely junk

#### Apple Intelligence Attributes (iOS 18+)
- `isPriority`: Indicates prioritized mail/messages
- `textContentSummary`: AI-generated summary
- `transcribedTextContent`: Transcribed text content

### CSSearchableIndex
Manages on-device indexes for searchable content.

#### Creating Indexes
```swift
// Default index
let defaultIndex = CSSearchableIndex.default()

// Custom index with name
let customIndex = CSSearchableIndex(name: "MyAppIndex")

// Protected index with encryption
let protectedIndex = CSSearchableIndex(
    name: "SecureIndex",
    protectionClass: .completeUntilFirstUserAuthentication
)
```

#### Index Operations
```swift
// Add/update items
index.indexSearchableItems([item1, item2]) { error in
    if let error = error {
        print("Indexing failed: \(error)")
    }
}

// Delete specific items
index.deleteSearchableItems(withIdentifiers: ["id1", "id2"]) { error in
    // Handle completion
}

// Delete items by domain
index.deleteSearchableItems(withDomainIdentifiers: ["documents"]) { error in
    // Handle completion
}

// Delete all items
index.deleteAllSearchableItems { error in
    // Handle completion
}
```

#### Batch Operations
For large datasets, use batch operations to minimize risk:

```swift
// Start batch
index.beginBatch()

// Add items in batch
index.indexSearchableItems(batchItems) { error in
    // Handle batch indexing
}

// End batch with client state
let clientState = "batch-1".data(using: .utf8)!
index.endBatch(withClientState: clientState) { error in
    // Batch complete
}

// Fetch last client state to resume after crash
index.fetchLastClientState { data, error in
    if let data = data {
        // Resume from this state
    }
}
```

### CSSearchQuery
Execute searches on indexed content programmatically.

#### Query Syntax
Query strings use attribute-based predicates:

##### Basic Operators
- `==`: Equal
- `!=`: Not equal  
- `<`, `>`, `<=`, `>=`: Comparison (numeric/date only)
- `InRange(attribute, min, max)`: Range check

##### Text Modifiers
- `c`: Case-insensitive
- `d`: Ignore diacritical marks
- `w`: Word boundaries
- `t`: Tokenized search
- `*`: Wildcard (beginning/middle/end)

##### Logical Operators
- `&&`: AND
- `||`: OR
- `()`: Grouping

##### Examples
```swift
// Case-insensitive title search
"title == 'Paris'c"

// Word boundary search
"title == 'Window'w"  // Matches "MyWindowClass", "Broken Window"

// Wildcard search
"title == 'paris*'"   // Starts with
"title == '*paris'"   // Ends with
"title == '*paris*'"  // Contains

// Combined predicates
"authorNames == 'Steve'wc && contentType == 'audio'"

// Complex query
"(authorNames == 'Tim'wc || authorNames == 'Steve'wc) && duration > 300"
```

#### Date Queries
Use the `$time` variable for date comparisons:

```swift
// Items modified today
"contentModificationDate >= $time.today"

// Items from last week
"startDate >= $time.last_week && startDate < $time.this_week"

// Items from past 10 days
"InRange(completionDate, $time.today(-10), $time.today)"

// Using ISO-8601 date
"dueDate <= $time.iso('2024-01-01T00:00:00Z')"
```

#### Executing Queries
```swift
// Create query context
let context = CSSearchQueryContext()
context.fetchAttributes = ["title", "displayName", "contentDescription"]

// Create and execute query
let query = CSSearchQuery(queryString: "title == 'Document*'c", 
                         queryContext: context)

// Process results with async/await
Task {
    do {
        for try await result in query.results {
            let item = result.item
            let title = item.attributeSet.title
            // Process result
        }
    } catch {
        // Handle error
    }
}
```

### CSUserQuery
Provides search interface with text completions for user-driven searches.

```swift
let userQuery = CSUserQuery(userQueryString: userInput, 
                           userQueryContext: nil)

// Get suggestions for autocomplete
userQuery.foundSuggestionsHandler = { suggestions in
    // Update UI with suggestions
}

// Handle search results
userQuery.foundItemsHandler = { items in
    // Display search results
}

userQuery.start()
```

## Custom Attributes

Define custom attributes for specialized content:

```swift
// Create custom attribute key
let customKey = CSCustomAttributeKey(
    keyName: "movieRating",
    searchable: true,
    searchableByDefault: true,
    unique: false,
    multiValued: false
)

// Set custom attribute
attributeSet.setValue("PG-13", forCustomKey: customKey)

// Define content type hierarchy
attributeSet.contentTypeTree = ["public.content", "com.myapp.movie"]
```

## Spotlight App Extensions

Create extensions to maintain indexes when your app isn't running:

### CSIndexExtensionRequestHandler
```swift
class IndexExtension: CSIndexExtensionRequestHandler {
    override func searchableIndex(_ searchableIndex: CSSearchableIndex, 
                                 reindexAllSearchableItemsWithAcknowledgementHandler acknowledgementHandler: @escaping () -> Void) {
        // Reindex all items
        acknowledgementHandler()
    }
    
    override func searchableIndex(_ searchableIndex: CSSearchableIndex,
                                 reindexSearchableItemsWithIdentifiers identifiers: [String],
                                 acknowledgementHandler: @escaping () -> Void) {
        // Reindex specific items
        acknowledgementHandler()
    }
}
```

## Best Practices

### 1. Provide Rich Metadata
- Always set title, displayName, and contentDescription
- Include relevant keywords without keyword stuffing
- Use appropriate content types (UTIs)
- Add thumbnails for visual content

### 2. Unique Identifiers
- Use stable, unique identifiers that won't change
- Consider using reverse domain notation: "com.myapp.document.123"
- Group related items with domainIdentifier

### 3. Batch Operations
- Index large datasets in batches of 100-1000 items
- Use client state to track progress
- Handle errors gracefully and retry failed batches

### 4. Data Protection
- Use protected indexes for sensitive content
- Choose appropriate FileProtectionType
- Consider .completeUntilFirstUserAuthentication for balance

### 5. Query Performance
- Specify only needed attributes in fetchAttributes
- Use efficient query predicates
- Consider pagination for large result sets

### 6. Maintenance
- Set expiration dates for time-sensitive content
- Update items when content changes
- Delete items when content is removed
- Implement reindexing in app extensions

### 7. User Experience
- Index content that users would search for
- Keep metadata current and accurate
- Test search queries from user perspective
- Provide good thumbnails and descriptions

## Integration with NSUserActivity

Combine with NSUserActivity for broader reach:

```swift
let activity = NSUserActivity(activityType: "com.myapp.viewDocument")
activity.title = "My Document"
activity.userInfo = ["documentID": "123"]
activity.isEligibleForSearch = true
activity.isEligibleForPublicIndexing = true // For server-side indexing
activity.contentAttributeSet = attributeSet // Same attributeSet
activity.becomeCurrent()
```

## Platform Availability
- iOS 9.0+
- iPadOS 9.0+
- Mac Catalyst 13.0+
- macOS 10.13+
- visionOS 1.0+

## Key Limitations
- Indexes are private to device (not synced)
- No cloud backup of indexes
- Limited to on-device search
- Results depend on available storage
- Indexing happens asynchronously