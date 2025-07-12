# https://developer.apple.com/documentation/foundation/filemanager llms.txt

## FileManager Core Documentation

- [FileManager](https://developer.apple.com/documentation/foundation/filemanager): A convenient interface to the contents of the file system, and the primary means of interacting with it.

## File Operations

- [File Existence Check](https://developer.apple.com/documentation/foundation/filemanager/fileexists(atpath:)): Checks whether a file or directory exists at a specified path.
- [Create File](https://developer.apple.com/documentation/foundation/filemanager/contents(atpath:)): Returns the contents of the file at the specified path.
- [Remove Item](https://developer.apple.com/documentation/foundation/filemanager/removeitem(at:)): Removes the file or directory at the specified URL.
- [Remove Item at Path](https://developer.apple.com/documentation/foundation/filemanager/removeitem(atpath:)): Removes the file or directory at the specified path.
- [Copy Item](https://developer.apple.com/documentation/foundation/filemanager/copyitem(at:to:)): Copies the item at the specified URL to a new location synchronously.
- [Move Item](https://developer.apple.com/documentation/foundation/filemanager/moveitem(at:to:)): Moves the file or directory at the specified URL to a new location synchronously.
- [Replace Item](https://developer.apple.com/documentation/foundation/filemanager/replaceitem(at:withitemfrom:backupitemname:options:resultingitemurl:)): Replaces the item at the URL with the item at the given URL.
- [Item Replacement Options](https://developer.apple.com/documentation/foundation/filemanager/itemreplacementoptions): Options for specifying the behavior of file replacement operations.

## Directory Management

- [Contents of Directory](https://developer.apple.com/documentation/foundation/filemanager/contentsofdirectory(atpath:)): Performs a shallow search of the specified directory and returns the paths of any contained items.
- [Create Directory](https://developer.apple.com/documentation/foundation/filemanager/createdirectory(at:withintermediatedirectories:attributes:)): Creates a directory with given attributes at the specified URL.
- [Directory Enumerator](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerator): An object that enumerates the contents of a directory.
- [Enumerator at Path](https://developer.apple.com/documentation/foundation/filemanager/enumerator(atpath:)): Returns a directory enumerator object that can be used to perform a deep enumeration of the directory at the specified path.
- [Directory Enumeration Options](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerationoptions): Options for enumerating the contents of directories.
- [Skip Hidden Files](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerationoptions/skipshiddenfiles): An option to skip hidden files during enumeration.
- [Skip Package Descendants](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerationoptions/skipspackagedescendants): An option to skip descendants of packages during enumeration.
- [Skip Subdirectory Descendants](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerationoptions/skipssubdirectorydescendants): An option to not descend into subdirectories.
- [Current Directory Path](https://developer.apple.com/documentation/foundation/filemanager/currentdirectorypath): The path to the program's current directory.
- [Change Current Directory](https://developer.apple.com/documentation/foundation/filemanager/changecurrentdirectorypath(_:)): Changes the path of the current working directory to the specified path.
- [Home Directory for Current User](https://developer.apple.com/documentation/foundation/filemanager/homedirectoryforcurrentuser): The home directory for the current user.
- [Home Directory for User](https://developer.apple.com/documentation/foundation/filemanager/homedirectory(foruser:)): Returns the home directory for the specified user.
- [Temporary Directory](https://developer.apple.com/documentation/foundation/filemanager/temporarydirectory): The temporary directory for the current user.

## File Attributes

- [Attributes of Item](https://developer.apple.com/documentation/foundation/filemanager/attributesofitem(atpath:)): Returns the attributes of the item at a given path.
- [File Attributes](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerator/fileattributes): The attributes of the file at the enumerator's current position.
- [Directory Attributes](https://developer.apple.com/documentation/foundation/filemanager/directoryenumerator/directoryattributes): The attributes of the directory at the enumerator's current position.
- [Attributes of File System](https://developer.apple.com/documentation/foundation/filemanager/attributesoffilesystem(forpath:)): Returns a dictionary that describes the attributes of the mounted file system on which a given path resides.
- [File System Attributes](https://developer.apple.com/documentation/foundation/filemanager/filesystemattributes(atpath:)): Returns a dictionary that describes the attributes of the file system containing the provided path.
- [Set Attributes](https://developer.apple.com/documentation/foundation/filemanager/setattributes(_:ofitem:)): Sets the attributes of the specified file or directory.
- [Display Name](https://developer.apple.com/documentation/foundation/filemanager/displayname(atpath:)): Returns the display name of the file or directory at a specified path.
- [Components to Display](https://developer.apple.com/documentation/foundation/filemanager/componentstodisplay(forpath:)): Returns an array of strings representing the user-visible components of a given path.

## File Permissions and Security

- [Is Readable File](https://developer.apple.com/documentation/foundation/filemanager/isreadablefile(atpath:)): Returns a Boolean value that indicates whether the invoking object appears able to read a specified file.
- [Is Writable File](https://developer.apple.com/documentation/foundation/filemanager/iswritablefile(atpath:)): Returns a Boolean value that indicates whether the invoking object appears able to write to a specified file.
- [Is Executable File](https://developer.apple.com/documentation/foundation/filemanager/isexecutablefile(atpath:)): Returns a Boolean value that indicates whether the operating system appears able to execute a specified file.
- [Is Deletable File](https://developer.apple.com/documentation/foundation/filemanager/isdeletablefile(atpath:)): Returns a Boolean value that indicates whether the invoking object appears able to delete a specified file.
- [URL File Protection](https://developer.apple.com/documentation/foundation/urlfileprotection): File protection options that can be associated with a URL.
- [File Protection Type](https://developer.apple.com/documentation/foundation/fileprotectiontype): Protection level options for files.

## iCloud Documents

- [Ubiquity Identity Token](https://developer.apple.com/documentation/foundation/filemanager/ubiquityidentitytoken): An opaque token that represents the current user's iCloud Drive Documents identity.
- [URL for Ubiquity Container](https://developer.apple.com/documentation/foundation/filemanager/url(forubiquitycontaineridentifier:)): Returns the URL for the iCloud container associated with the specified identifier.
- [Is Ubiquitous Item](https://developer.apple.com/documentation/foundation/filemanager/isubiquitousitem(at:)): Returns a Boolean indicating whether the item is targeted for storage in iCloud.
- [Start Downloading Ubiquitous Item](https://developer.apple.com/documentation/foundation/filemanager/startdownloadingubiquitousitem(at:)): Starts downloading (if necessary) the specified item to the local system.
- [Evict Ubiquitous Item](https://developer.apple.com/documentation/foundation/filemanager/evictubiquitousitem(at:)): Removes the local copy of the specified item that's stored in iCloud.
- [Set Ubiquitous Item](https://developer.apple.com/documentation/foundation/filemanager/setubiquitous(_:itemat:destinationurl:)): Indicates whether the item at the specified URL should be stored in iCloud.
- [iCloud File Download Status](https://developer.apple.com/documentation/foundation/urlubiquitousitemdownloadingstatus): Constants indicating the download status of a file in iCloud storage.

## URL Relationships

- [URL Relationship](https://developer.apple.com/documentation/foundation/filemanager/urlrelationship): Constants indicating the relationship between two URLs.
- [Get Relationship](https://developer.apple.com/documentation/foundation/filemanager/getrelationship(_:of:in:relativeto:)): Determines the relationship between two URLs.
- [URL Relationship Contains](https://developer.apple.com/documentation/foundation/filemanager/urlrelationship/contains): A relationship where the directory contains the specified item.
- [URL Relationship Same](https://developer.apple.com/documentation/foundation/filemanager/urlrelationship/same): A relationship where the two URLs are the same.
- [URL Relationship Other](https://developer.apple.com/documentation/foundation/filemanager/urlrelationship/other): A relationship where the two URLs are not related.

## File System Paths

- [File System Representation](https://developer.apple.com/documentation/foundation/filemanager/filesystemrepresentation(withpath:)): Returns a C-string representation of a given path that properly encodes Unicode strings for use by the file system.
- [String from File System Representation](https://developer.apple.com/documentation/foundation/filemanager/string(fromfilesystemrepresentation:length:)): Returns an NSString object whose contents are derived from the specified C-string path.
- [Destination of Symbolic Link](https://developer.apple.com/documentation/foundation/filemanager/destinationofsymboliclink(atpath:)): Returns the path of the item pointed to by a symbolic link.
- [Path Content of Symbolic Link](https://developer.apple.com/documentation/foundation/filemanager/pathcontentofsymboliclink(atpath:)): Returns the path of the item pointed to by a symbolic link.
- [Create Symbolic Link](https://developer.apple.com/documentation/foundation/filemanager/createsymboliclink(at:pointing:)): Creates a symbolic link at the specified URL that points to an item at the given URL.

## Search Paths

- [Search Path Directory](https://developer.apple.com/documentation/foundation/filemanager/searchpathdirectory): The location of significant directories.
- [Search Path Domain Mask](https://developer.apple.com/documentation/foundation/filemanager/searchpathdomainmask): Domain constants specifying base locations to use when you search for significant directories.
- [URLs for Directory](https://developer.apple.com/documentation/foundation/filemanager/urls(for:in:)): Returns an array of URLs for the specified common directory in the requested domains.
- [URL for Directory](https://developer.apple.com/documentation/foundation/filemanager/url(for:in:appropriatefor:create:)): Locates and optionally creates the specified common directory in a domain.
- [Application Support Directory](https://developer.apple.com/documentation/foundation/filemanager/searchpathdirectory/applicationsupportdirectory): The location of application support files.
- [Caches Directory](https://developer.apple.com/documentation/foundation/filemanager/searchpathdirectory/cachesdirectory): The location of discardable cache files.
- [Library Directory](https://developer.apple.com/documentation/foundation/filemanager/searchpathdirectory/librarydirectory): The location of various user-visible documentation, support, and configuration files.

## Volume Operations

- [Mounted Volume URLs](https://developer.apple.com/documentation/foundation/filemanager/mountedvolumeurls(includingresourcesvaluesforkeys:options:)): Returns an array of URLs that identify the mounted volumes available on the device.
- [Volume Enumeration Options](https://developer.apple.com/documentation/foundation/filemanager/volumeenumerationoptions): Options for enumerating mounted volumes.
- [Skip Hidden Volumes](https://developer.apple.com/documentation/foundation/filemanager/volumeenumerationoptions/skiphiddenvolumes): An option to skip hidden volumes.
- [Unmount Volume](https://developer.apple.com/documentation/foundation/filemanager/unmountvolume(at:options:)): Starts the process of unmounting the specified volume.
- [Unmount Options](https://developer.apple.com/documentation/foundation/filemanager/unmountoptions): Options to use when unmounting a volume.

## File Coordination and Presenters

- [NSFileCoordinator](https://developer.apple.com/documentation/foundation/nsfilecoordinator): An object that coordinates the reading and writing of files and directories among file presenters.
- [NSFilePresenter](https://developer.apple.com/documentation/foundation/nsfilepresenter): A protocol that objects adopt to be notified of changes to files and directories.
- [File Version](https://developer.apple.com/documentation/foundation/nsfileversion): A snapshot of a file at a specific point in time.
- [Document Interaction](https://developer.apple.com/documentation/uikit/uidocumentinteractioncontroller): A controller to preview, open, or print files with unknown file formats.

## Delegate

- [FileManagerDelegate](https://developer.apple.com/documentation/foundation/filemanagerdelegate): The interface a file manager's delegate uses to intervene during operations or if an error occurs.
- [Should Copy Item](https://developer.apple.com/documentation/foundation/filemanagerdelegate/shouldcopyitem(at:to:)): Asks the delegate whether the specified item should be copied.
- [Should Move Item](https://developer.apple.com/documentation/foundation/filemanagerdelegate/shouldmoveitem(at:to:)): Asks the delegate whether the specified item should be moved.
- [Should Remove Item](https://developer.apple.com/documentation/foundation/filemanagerdelegate/shouldremoveitem(at:)): Asks the delegate whether the specified item should be removed.

## URL Bookmarks and Security Scoped Resources

- [URL Resource Keys](https://developer.apple.com/documentation/foundation/urlresourcekey): Keys that specify file and directory attributes.
- [Bookmarked URL](https://developer.apple.com/documentation/foundation/url/bookmarkdata): Creates bookmark data for a URL.
- [Security Scoped URL](https://developer.apple.com/documentation/foundation/url/startaccessingsecurityscopedresource()): Makes the resource pointed to by a security-scoped URL available to your app.
- [Stop Accessing Security Scoped Resource](https://developer.apple.com/documentation/foundation/url/stopaccessingsecurityscopedresource()): Revokes access to the resource pointed to by a security-scoped URL.

## Container URLs

- [Container URL for Security Application Group](https://developer.apple.com/documentation/foundation/filemanager/containerurl(forsecurityapplicationgroupidentifier:)): Returns the container directory associated with the specified security application group identifier.