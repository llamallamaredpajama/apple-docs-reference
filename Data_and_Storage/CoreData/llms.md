# Core Data Framework - llms.txt

## Overview
- [Core Data](https://developer.apple.com/documentation/coredata): Persist or cache data on a single device, or sync data to multiple devices with CloudKit.

## Core Concepts and Getting Started
- [Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model): Define your app's object structure with a data model file.
- [Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack): Set up the classes that manage and persist your app's objects.
- [Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack): Manage and persist your app's model layer.
- [Modeling data](https://developer.apple.com/documentation/coredata/modeling-data): Configure the data model file to contain your app's object graph.
- [Core Data model](https://developer.apple.com/documentation/coredata/core-data-model): Describe your app's object structure.

## NSManagedObject and Entities
- [NSManagedObject](https://developer.apple.com/documentation/coredata/nsmanagedobject): The base class that all Core Data model objects inherit from.
- [NSEntityDescription](https://developer.apple.com/documentation/coredata/nsentitydescription): A description of a Core Data entity.
- [NSAttributeDescription](https://developer.apple.com/documentation/coredata/nsattributedescription): A description of a Core Data attribute.
- [NSRelationshipDescription](https://developer.apple.com/documentation/coredata/nsrelationshipdescription): A description of a Core Data relationship.
- [NSPropertyDescription](https://developer.apple.com/documentation/coredata/nspropertydescription): A description of a Core Data property.
- [Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data): Create, store, and present records for a variety of data types.

## Core Data Stack Components
- [NSPersistentContainer](https://developer.apple.com/documentation/coredata/nspersistentcontainer): A container that encapsulates the Core Data stack in your app.
- [NSPersistentStoreCoordinator](https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator): A coordinator that associates persistent stores with a managed object model.
- [NSPersistentStore](https://developer.apple.com/documentation/coredata/nspersistentstore): The abstract base class for all Core Data persistent stores.
- [NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext): An object space to manipulate and track changes to managed objects.
- [NSManagedObjectModel](https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel): A programmatic representation of the .xcdatamodeld file.

## Persistent Store Types
- [NSSQLiteStoreType](https://developer.apple.com/documentation/coredata/nssqlitestoretype): The SQLite persistent store type.
- [NSInMemoryStoreType](https://developer.apple.com/documentation/coredata/nsinmemorystoretype): The in-memory persistent store type.
- [NSBinaryStoreType](https://developer.apple.com/documentation/coredata/nsbinarystoretype): The binary persistent store type.
- [NSXMLStoreType](https://developer.apple.com/documentation/coredata/nsxmlstoretype): The XML persistent store type (macOS only).

## Fetch Requests and Predicates
- [NSFetchRequest](https://developer.apple.com/documentation/coredata/nsfetchrequest): A description of search criteria used to retrieve data from a persistent store.
- [NSPredicate Overview](https://developer.apple.com/documentation/foundation/nspredicate): Learn how to use NSPredicate for filtering data effectively.
- [NSSortDescriptor Guide](https://developer.apple.com/documentation/foundation/nssortdescriptor): Learn how to use NSSortDescriptor for sorting data.
- [NSAsynchronousFetchRequest](https://developer.apple.com/documentation/coredata/nsasynchronousfetchrequest): A fetch request that retrieves results asynchronously and supports progress notification.
- [NSAsynchronousFetchResult](https://developer.apple.com/documentation/coredata/nsasynchronousfetchresult): A fetch result object that encompasses the response from an executed asynchronous fetch request.
- [NSFetchedResultsController](https://developer.apple.com/documentation/coredata/nsfetchedresultscontroller): A controller that you use to manage the results of a Core Data fetch request and to display data to the user.
- [NSFetchedResultsSectionInfo](https://developer.apple.com/documentation/coredata/nsfetchedresultssectioninfo): Protocol for section information in fetched results.
- [NSFetchRequestResult](https://developer.apple.com/documentation/coredata/nsfetchrequestresult): Protocol for fetch request results.

## CloudKit Integration
- [Mirroring a Core Data store with CloudKit](https://developer.apple.com/documentation/coredata/mirroring-a-core-data-store-with-cloudkit): Back user interfaces with a local replica of a CloudKit private database.
- [Synchronizing a local store to the cloud](https://developer.apple.com/documentation/coredata/synchronizing-a-local-store-to-the-cloud): Share data between a user's devices and other iCloud users.
- [NSPersistentCloudKitContainer](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainer): A container that encapsulates the Core Data stack in your app, and mirrors select persistent stores to a CloudKit private database.
- [NSPersistentCloudKitContainerOptions](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontaineroptions): An object that customizes how a store description aligns with a CloudKit database.
- [Sharing Core Data objects between iCloud users](https://developer.apple.com/documentation/coredata/sharing-core-data-objects-between-icloud-users): Use Core Data and CloudKit to synchronize data between devices of an iCloud user and share data between different iCloud users.
- [NSPersistentCloudKitContainerEventRequest](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainereventrequest): A request to fetch persistent CloudKit container events.

## Data Migration
- [Migrating your data model automatically](https://developer.apple.com/documentation/coredata/migrating-your-data-model-automatically): Enable lightweight migrations to keep your data model and the underlying data in a consistent state.
- [Staged migrations](https://developer.apple.com/documentation/coredata/staged-migrations): Migrate complex data models containing changes that are incompatible with lightweight migrations.
- [Manual migrations](https://developer.apple.com/documentation/coredata/manual-migrations): Migrate elaborate data models with changes that go beyond the capabilities of both lightweight and staged migrations.
- [NSMappingModel](https://developer.apple.com/documentation/coredata/nsmappingmodel): A model that specifies how to map a model from a source version to a destination version.
- [NSEntityMapping](https://developer.apple.com/documentation/coredata/nsentitymapping): A mapping between an entity in a source managed object model and an entity in a destination managed object model.
- [NSPropertyMapping](https://developer.apple.com/documentation/coredata/nspropertymapping): A mapping between a property in a source entity and a property in a destination entity.
- [NSMigrationManager](https://developer.apple.com/documentation/coredata/nsmigrationmanager): A migration manager instance that performs a migration.
- [NSStagedMigrationManager](https://developer.apple.com/documentation/coredata/nsstagedmigrationmanager): A migration manager for performing staged migrations.
- [NSMigrationStage](https://developer.apple.com/documentation/coredata/nsmigrationstage): A stage in a staged migration.

## Concurrency and Background Tasks
- [Using Core Data in the background](https://developer.apple.com/documentation/coredata/using-core-data-in-the-background): Use Core Data in both a single-threaded and multithreaded app.
- [Loading and Displaying a Large Data Feed](https://developer.apple.com/documentation/swiftui/loading_and_displaying_a_large_data_feed): Consume data in the background, and lower memory use by batching imports and preventing duplicate records.
- [NSManagedObjectContextConcurrencyType](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontextconcurrencytype): The concurrency types for managed object contexts.
- [Conflict resolution](https://developer.apple.com/documentation/coredata/conflict-resolution): Detect and resolve conflicts that occur when data is changed on multiple threads.
- [Batch processing](https://developer.apple.com/documentation/coredata/batch-processing): Use batch processes to manage large data changes.
- [NSBatchUpdateRequest](https://developer.apple.com/documentation/coredata/nsbatchupdaterequest): A request to update data in the persistent store without loading it into memory.
- [NSBatchDeleteRequest](https://developer.apple.com/documentation/coredata/nsbatchdeleterequest): A request to delete data from the persistent store without loading it into memory.
- [NSBatchInsertRequest](https://developer.apple.com/documentation/coredata/nsbatchinsertrequest): A request to insert data in the persistent store without loading it into memory.

## Change Tracking and History
- [Accessing data when the store changes](https://developer.apple.com/documentation/coredata/accessing-data-when-the-store-changes): Guarantee that a context won't see store changes until you tell it to look.
- [Consuming relevant store changes](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes): Filter store transactions for changes relevant to the current view.
- [Persistent history](https://developer.apple.com/documentation/coredata/persistent-history): Use persistent history tracking to determine what changes have occurred in the store since the enabling of persistent history tracking.
- [NSPersistentHistoryTransaction](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction): A transaction that encapsulates changes made to a persistent store.
- [NSPersistentHistoryChange](https://developer.apple.com/documentation/coredata/nspersistenthistorychange): A change record for a managed object.
- [NSPersistentHistoryChangeType](https://developer.apple.com/documentation/coredata/nspersistenthistorychangetype): The types of changes to managed objects reflected in persistent history.
- [NSPersistentHistoryToken](https://developer.apple.com/documentation/coredata/nspersistenthistorytoken): A token that represents a location in the persistent history.

## Performance and Optimization
- [NSQueryGenerationToken](https://developer.apple.com/documentation/coredata/nsquerygenerationtoken): A token that indicates which generation of the persistent store is being accessed.
- [NSFetchIndexDescription](https://developer.apple.com/documentation/coredata/nsfetchindexdescription): A description of an index for a fetch request.
- [NSFetchIndexElementDescription](https://developer.apple.com/documentation/coredata/nsfetchindexelementdescription): A description of an element in a fetch index.
- [Faulting and Uniquing](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/FaultingandUniquing.html): Learn about Core Data's faulting mechanism for memory efficiency.

## Notifications and Change Management
- [NSManagedObjectContextDidSaveNotification](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontextdidsavenotification): A notification posted after a context is saved.
- [NSManagedObjectContextObjectsDidChangeNotification](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontextobjectsdidchangenotification): A notification posted when objects in a context change.
- [NSManagedObjectContextWillSaveNotification](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontextwillsavenotification): A notification posted before a context is saved.
- [NSInsertedObjectsKey](https://developer.apple.com/documentation/coredata/nsinsertedobjectskey): The key for inserted objects in notifications.
- [NSUpdatedObjectsKey](https://developer.apple.com/documentation/coredata/nsupdatedobjectskey): The key for updated objects in notifications.
- [NSDeletedObjectsKey](https://developer.apple.com/documentation/coredata/nsdeletedobjectskey): The key for deleted objects in notifications.
- [NSRefreshedObjectsKey](https://developer.apple.com/documentation/coredata/nsrefreshedobjectskey): The key for refreshed objects in notifications.
- [NSInvalidatedObjectsKey](https://developer.apple.com/documentation/coredata/nsinvalidatedobjectskey): The key for invalidated objects in notifications.

## Validation
- [Validation error codes](https://developer.apple.com/documentation/coredata/1535452-validation-error-codes): Error codes relating to the validation of managed objects.
- [NSValidationKeyErrorKey](https://developer.apple.com/documentation/coredata/nsvalidationkeyerrorkey): The error key for the attribute that failed to validate.
- [NSValidationObjectErrorKey](https://developer.apple.com/documentation/coredata/nsvalidationobjecterrorkey): The error key for the object that failed to validate.
- [NSValidationPredicateErrorKey](https://developer.apple.com/documentation/coredata/nsvalidationpredicateerrorkey): The error key for the predicate that failed to validate.
- [NSValidationValueErrorKey](https://developer.apple.com/documentation/coredata/nsvalidationvalueerrorkey): The error key for the value that failed to validate.

## Merge Policies
- [NSMergePolicy](https://developer.apple.com/documentation/coredata/nsmergepolicy): A policy object that describes how conflicts should be handled.
- [NSMergePolicyType](https://developer.apple.com/documentation/coredata/nsmergepolicytype): Constants that define merge policy types.
- [NSErrorMergePolicy](https://developer.apple.com/documentation/coredata/nserrormergepolicy): Default policy that causes a save to fail if there are any merge conflicts.
- [NSMergeByPropertyStoreTrumpMergePolicy](https://developer.apple.com/documentation/coredata/nsmergebypropertystoretrumpmergepolicy): A policy that merges conflicts between the persistent store and in-memory versions.
- [NSMergeByPropertyObjectTrumpMergePolicy](https://developer.apple.com/documentation/coredata/nsmergebypropertyobjecttrumpmergepolicy): A policy that merges conflicts between objects in memory.

## Core Data and SwiftData
- [Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/coredata/adopting-swiftdata-for-a-core-data-app): Persist data in your app intuitively with the Swift native persistence framework.

## Additional Resources
- [Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores): Organize data in two different stores and implement a link between them.
- [Core Data Constants](https://developer.apple.com/documentation/coredata/core-data-constants): Keys to use with persistent stores and notifications from Core Data.
- [NSManagedObjectID](https://developer.apple.com/documentation/coredata/nsmanagedobjectid): A unique identifier for a managed object.
- [NSDeleteRule](https://developer.apple.com/documentation/coredata/nsdeleterule): Constants that define the rule to apply to a relationship when an object is deleted.