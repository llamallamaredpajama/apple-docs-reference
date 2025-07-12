# Quick API Reference 🚀

Ultra-condensed reference for the most commonly used Apple framework APIs. Each entry shows the essential pattern for quick lookup.

## Core Frameworks

### PencilKit
```swift
// Canvas Setup
let canvas = PKCanvasView()
canvas.delegate = self
canvas.drawingPolicy = .anyInput  // or .pencilOnly

// Save/Load
let data = canvas.drawing.dataRepresentation()
canvas.drawing = try PKDrawing(data: data)

// Tool Picker
PKToolPicker.shared().setVisible(true, forFirstResponder: canvas)
PKToolPicker.shared().addObserver(canvas)

// Export Image
let image = canvas.drawing.image(from: rect, scale: UIScreen.main.scale)
```

### AVFoundation
```swift
// Audio Session
try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
try AVAudioSession.sharedInstance().setActive(true)

// Recording
let recorder = try AVAudioRecorder(url: fileURL, settings: [
    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
    AVSampleRateKey: 44100,
    AVNumberOfChannelsKey: 2
])
recorder.prepareToRecord()
recorder.record()

// Audio Engine
let engine = AVAudioEngine()
let input = engine.inputNode
engine.connect(input, to: mixer, format: input.outputFormat(forBus: 0))
try engine.start()
```

### Vision
```swift
// Text Recognition
let request = VNRecognizeTextRequest { request, error in
    guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
    let text = observations.compactMap { $0.topCandidates(1).first?.string }
}
request.recognitionLevel = .accurate
request.recognitionLanguages = ["en-US"]

// Face Detection
let faceRequest = VNDetectFaceRectanglesRequest { request, error in
    guard let faces = request.results as? [VNFaceObservation] else { return }
    // Process faces
}

// Process Image
let handler = VNImageRequestHandler(cgImage: image, options: [:])
try handler.perform([request])
```

### CoreML
```swift
// Load Model
let model = try YourModel(configuration: MLModelConfiguration())

// Prediction
let input = YourModelInput(image: pixelBuffer)
let output = try model.prediction(input: input)

// Batch Prediction
let inputs = [YourModelInput]()
let outputs = try model.predictions(inputs: inputs)
```

### Speech
```swift
// Recognition
let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
let request = SFSpeechURLRecognitionRequest(url: audioURL)

recognizer?.recognitionTask(with: request) { result, error in
    if let result = result {
        let text = result.bestTranscription.formattedString
    }
}

// Live Recognition
let request = SFSpeechAudioBufferRecognitionRequest()
let task = recognizer?.recognitionTask(with: request) { result, error in
    // Handle live results
}
```

## Platform Essentials

### SwiftUI
```swift
// State Management
@State private var isActive = false
@StateObject private var viewModel = ViewModel()
@EnvironmentObject var settings: Settings
@AppStorage("key") var stored = "default"

// Navigation (iOS 16+)
NavigationStack(path: $path) {
    List(items) { item in
        NavigationLink(value: item) {
            Text(item.name)
        }
    }
    .navigationDestination(for: Item.self) { item in
        DetailView(item: item)
    }
}

// Async
.task {
    await loadData()
}
.refreshable {
    await refresh()
}
```

### UIKit
```swift
// View Controller Lifecycle
override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
}

// Table View
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = items[indexPath.row]
    return cell
}

// Constraints
view.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
])
```

### Foundation
```swift
// UserDefaults
UserDefaults.standard.set("value", forKey: "key")
let value = UserDefaults.standard.string(forKey: "key")

// NotificationCenter
NotificationCenter.default.post(name: .myNotification, object: nil, userInfo: ["key": "value"])
NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .myNotification, object: nil)

// FileManager
let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let fileURL = documentsPath.appendingPathComponent("file.txt")
try data.write(to: fileURL)

// DateFormatter
let formatter = DateFormatter()
formatter.dateStyle = .medium
formatter.timeStyle = .short
let string = formatter.string(from: Date())
```

## Data & Storage

### SwiftData (iOS 17+)
```swift
// Model
@Model
final class Item {
    var name: String
    var timestamp: Date
    
    init(name: String, timestamp: Date = Date()) {
        self.name = name
        self.timestamp = timestamp
    }
}

// Container
let container = try ModelContainer(for: Item.self)
let context = container.mainContext

// CRUD
let item = Item(name: "New Item")
context.insert(item)
try context.save()

// Query
let descriptor = FetchDescriptor<Item>(sortBy: [SortDescriptor(\.timestamp)])
let items = try context.fetch(descriptor)
```

### CloudKit
```swift
// Save Record
let record = CKRecord(recordType: "Item")
record["name"] = "Example"
CKContainer.default().publicCloudDatabase.save(record) { record, error in
    // Handle result
}

// Query
let predicate = NSPredicate(format: "name = %@", "Example")
let query = CKQuery(recordType: "Item", predicate: predicate)
CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
    // Process records
}

// Subscribe
let subscription = CKQuerySubscription(recordType: "Item", predicate: NSPredicate(value: true), options: .firesOnRecordCreation)
let info = CKSubscription.NotificationInfo()
info.alertBody = "New item added"
subscription.notificationInfo = info
```

### Core Data
```swift
// Core Data Stack
lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores { _, error in
        if let error = error {
            fatalError("Failed to load store: \(error)")
        }
    }
    return container
}()

// Save
let context = persistentContainer.viewContext
let entity = Entity(context: context)
entity.name = "Example"
try context.save()

// Fetch
let request: NSFetchRequest<Entity> = Entity.fetchRequest()
request.predicate = NSPredicate(format: "name == %@", "Example")
let results = try context.fetch(request)
```

## User Experience

### StoreKit 2
```swift
// Products
let products = try await Product.products(for: ["com.example.product"])

// Purchase
let result = try await product.purchase()
switch result {
case .success(let verification):
    switch verification {
    case .verified(let transaction):
        await transaction.finish()
    case .unverified:
        // Handle
    }
case .userCancelled, .pending:
    // Handle
}

// Transaction Updates
for await update in Transaction.updates {
    // Handle transaction updates
}
```

### WidgetKit
```swift
// Timeline Provider
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        completion(SimpleEntry(date: Date()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// Widget Configuration
@main
struct MyWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("Widget description")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
```

### UserNotifications
```swift
// Request Authorization
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
    // Handle result
}

// Schedule Notification
let content = UNMutableNotificationContent()
content.title = "Title"
content.body = "Body"
content.sound = .default

let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
UNUserNotificationCenter.current().add(request)
```

## Performance Tools

### MetricKit
```swift
// Subscribe to Metrics
class MetricsSubscriber: NSObject, MXMetricManagerSubscriber {
    func didReceive(_ payloads: [MXMetricPayload]) {
        // Process metrics
    }
    
    func didReceive(_ payloads: [MXDiagnosticPayload]) {
        // Process diagnostics
    }
}

let subscriber = MetricsSubscriber()
MXMetricManager.shared.add(subscriber)
```

### os_log
```swift
// Logging
import os

let logger = Logger(subsystem: "com.example.app", category: "networking")
logger.log("Starting request")
logger.debug("Debug info: \(details)")
logger.error("Error occurred: \(error.localizedDescription)")

// Signposts
let signpostID = OSSignpostID(log: logger)
os_signpost(.begin, log: logger, name: "Network Request", signpostID: signpostID)
// ... perform work ...
os_signpost(.end, log: logger, name: "Network Request", signpostID: signpostID)
```

## Common Patterns

### Delegate Pattern
```swift
protocol CustomDelegate: AnyObject {
    func didUpdateValue(_ value: String)
}

class CustomClass {
    weak var delegate: CustomDelegate?
    
    func updateValue() {
        delegate?.didUpdateValue("New Value")
    }
}
```

### Completion Handlers
```swift
func loadData(completion: @escaping (Result<Data, Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            completion(.success(data))
        }
    }.resume()
}
```

### Async/Await
```swift
func loadData() async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// Usage
Task {
    do {
        let data = try await loadData()
        // Use data
    } catch {
        // Handle error
    }
}
```

### Combine
```swift
// Publisher
let publisher = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .decode(type: Model.self, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: { completion in
        // Handle completion
    }, receiveValue: { model in
        // Use model
    })
```

## Error Handling

### Do-Try-Catch
```swift
do {
    let result = try someThrowingFunction()
    // Use result
} catch SpecificError.case1 {
    // Handle specific error
} catch {
    // Handle general error
    print("Error: \(error.localizedDescription)")
}
```

### Guard Statements
```swift
guard let value = optionalValue else {
    print("Value is nil")
    return
}
// Use value safely
```

### Result Type
```swift
func performTask() -> Result<String, Error> {
    if success {
        return .success("Done")
    } else {
        return .failure(CustomError.failed)
    }
}

// Usage
switch performTask() {
case .success(let value):
    print(value)
case .failure(let error):
    print(error)
}
```

---

💡 **Pro Tip**: This reference shows the most common patterns. Always check the full documentation in the framework-specific files for complete details, edge cases, and platform-specific considerations.