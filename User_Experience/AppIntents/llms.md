# https://developer.apple.com/documentation/appintents llms.txt

- [App Intents](https://developer.apple.com/documentation/appintents): Make your app's content and actions discoverable with system experiences like Spotlight, widgets, and the Shortcuts app.

## Core Concepts

- [AppIntent Protocol](https://developer.apple.com/documentation/appintents/appintent): Define the custom actions your app exposes to the system.
- [Creating Your First App Intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent): Create your first app intent that makes your app available in system experiences.
- [App Intents Reference](https://developer.apple.com/documentation/appintents/app-intents): Define the custom actions your app exposes to the system, and incorporate support for existing SiriKit intents.
- [Accelerating App Interactions](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents): Enable people to use your app's features quickly through Siri, Spotlight, and Shortcuts.

## App Entities and Data Types

- [AppEntity Protocol](https://developer.apple.com/documentation/appintents/appentity): Make core types or concepts discoverable to the system by declaring them as app entities.
- [App Entities Reference](https://developer.apple.com/documentation/appintents/app-entities): Make core types or concepts discoverable to the system by declaring them as app entities.
- [Entity Queries](https://developer.apple.com/documentation/appintents/entity-queries): Help the system find the entities your app defines and use them to resolve parameters.
- [EntityStringQuery](https://developer.apple.com/documentation/appintents/entitystringquery): Query entities based on string search criteria.
- [EntityProperty](https://developer.apple.com/documentation/appintents/entityproperty): Define properties on your app entities.
- [AppEntity Property](https://developer.apple.com/documentation/appintents/appentity/property): Access properties of app entities.
- [UniqueAppEntityQuery](https://developer.apple.com/documentation/appintents/uniqueappentityquery/uniqueentity()): Query for unique entities.
- [EntityIdentifier](https://developer.apple.com/documentation/appintents/entityidentifier): Identify entities uniquely within your app.

## Parameters and Validation

- [IntentParameter](https://developer.apple.com/documentation/appintents/intentparameter): Define parameters for your app intents.
- [Adding Parameters to an App Intent](https://developer.apple.com/documentation/appintents/adding-parameters-to-an-app-intent): Enable people to configure app intents with their custom input values.
- [Parameter Resolution](https://developer.apple.com/documentation/appintents/parameter-resolution): Define the required parameters for your app intents and specify how to resolve those parameters at runtime.
- [IntentParameter - App Entity](https://developer.apple.com/documentation/appintents/intentparameter-app-entity): Use app entities as intent parameters.
- [IntentParameter - Person](https://developer.apple.com/documentation/appintents/intentparameter-person): Handle person-type parameters.
- [IntentParameter - Date](https://developer.apple.com/documentation/appintents/intentparameter-date): Handle date parameters.
- [IntentParameter - Boolean](https://developer.apple.com/documentation/appintents/intentparameter-boolean): Handle boolean parameters.
- [IntentParameterContext](https://developer.apple.com/documentation/appintents/intentparametercontext/inclusiverange-7i6st): Provide context for parameter values.
- [IntentParameterDependency](https://developer.apple.com/documentation/appintents/intentparameterdependency): Define dependencies between parameters.
- [DynamicOptionsProvider](https://developer.apple.com/documentation/appintents/dynamicoptionsprovider): Provide dynamic options for parameters.
- [Resolvers](https://developer.apple.com/documentation/appintents/resolvers): Resolve the parameters of your app intents.
- [Request Value](https://developer.apple.com/documentation/appintents/intentparameter/requestvalue(_:)-592nd): Request parameter values from the user.
- [Request Disambiguation](https://developer.apple.com/documentation/appintents/intentparameter/requestdisambiguation(among:dialog:)): Request user selection among ambiguous options.
- [Request Confirmation](https://developer.apple.com/documentation/appintents/intentparameter/requestconfirmation(for:dialog:)): Request confirmation for parameter values.

## Siri and Apple Intelligence Integration

- [Integrating Actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence): Create app intents that tap into enhanced capabilities.
- [Making Your App's Functionality Available to Siri](https://developer.apple.com/documentation/appintents/making-your-app-s-functionality-available-to-siri): Add assistant schemas to your app.
- [App Intent Domains](https://developer.apple.com/documentation/appintents/app-intent-domains): Make your app's actions and content available to Siri and Apple Intelligence.
- [AssistantIntent Protocol](https://developer.apple.com/documentation/appintents/assistantintent): Conform to assistant schemas.
- [AssistantIntent Schema](https://developer.apple.com/documentation/appintents/assistantintent(schema:)): Apply specific assistant schemas.
- [AppIntent Schema](https://developer.apple.com/documentation/appintents/appintent(schema:)): Apply schemas to app intents.
- [Assistant Schemas - Intent](https://developer.apple.com/documentation/appintents/assistantschemas/intent): Available intent schemas.
- [Photos Intent](https://developer.apple.com/documentation/appintents/assistantschemas/intent/photos): Photos-specific intent schemas.
- [Mail Intent](https://developer.apple.com/documentation/appintents/assistantschemas/mailintent): Mail-specific intent schemas.
- [Photos Create Assets](https://developer.apple.com/documentation/appintents/assistantschemas/photosintent/createassets): Create photo assets intent.
- [Photos Search](https://developer.apple.com/documentation/appintents/assistantschemas/photosintent/search): Search photos intent.
- [Making In-App Search Available](https://developer.apple.com/documentation/appintents/making-in-app-search-actions-available-to-siri-and-apple-intelligence): Enable search actions in your app.
- [Making Whiteboard Actions Available](https://developer.apple.com/documentation/appintents/making-whiteboard-actions-available-to-siri-and-apple-intelligence): Enable whiteboard actions.

## App Shortcuts

- [App Shortcuts](https://developer.apple.com/documentation/appintents/app-shortcuts): Integrate your app's intents with the Shortcuts app, Siri, Spotlight, and the Action button.
- [AppShortcutsProvider](https://developer.apple.com/documentation/appintents/appshortcutsprovider): Provide app shortcuts to the system.

## Intent Discovery and Donation

- [Intent Discovery](https://developer.apple.com/documentation/appintents/intent-discovery): Donate your app's intents to the system to help it identify trends.
- [Donate Intent](https://developer.apple.com/documentation/appintents/appintent/donate()-jp6k): Donate intent usage to the system.
- [Is Discoverable](https://developer.apple.com/documentation/appintents/appintent/isdiscoverable-95nxm): Mark intents as discoverable.
- [Intent Prediction Configuration](https://developer.apple.com/documentation/appintents/intentpredictionconfiguration/intent): Configure intent predictions.

## UI and Interaction

- [IntentDialog](https://developer.apple.com/documentation/appintents/intentdialog): Present dialogs to users during intent execution.
- [ProvidesDialog](https://developer.apple.com/documentation/appintents/providesdialog): Protocol for providing dialogs.
- [DisplayRepresentation](https://developer.apple.com/documentation/appintents/displayrepresentation): Control how your types are displayed in the UI.
- [Request Confirmation](https://developer.apple.com/documentation/appintents/appintent/requestconfirmation()): Request user confirmation.
- [ShowsSnippetView](https://developer.apple.com/documentation/appintents/showssnippetview): Show snippet views.
- [Displaying Static and Interactive Snippets](https://developer.apple.com/documentation/appintents/displaying-static-and-interactive-snippets): Enable people to view outcomes and perform follow-up actions.

## Intent Results and Execution

- [IntentResult](https://developer.apple.com/documentation/appintents/intentresult): Define the result of intent execution.
- [ResultsCollection](https://developer.apple.com/documentation/appintents/resultscollection): Return collections of results.
- [ProgressReportingIntent](https://developer.apple.com/documentation/appintents/progressreportingintent): Report progress during execution.
- [Progress Property](https://developer.apple.com/documentation/appintents/progressreportingintent/progress): Access progress information.

## System Integration

- [SystemIntent](https://developer.apple.com/documentation/appintents/systemintent): Built-in system intents.
- [OpenIntent](https://developer.apple.com/documentation/appintents/openintent): Open apps or content.
- [OpenURLIntent](https://developer.apple.com/documentation/appintents/openurlintent/openappwhenrun): Open URLs.
- [DeleteIntent](https://developer.apple.com/documentation/appintents/deleteintent): Delete content.
- [AudioPlaybackIntent](https://developer.apple.com/documentation/appintents/audioplaybackintent): Control audio playback.
- [CameraCaptureIntent](https://developer.apple.com/documentation/appintents/cameracaptureintent): Capture photos or videos.
- [StartWorkoutIntent](https://developer.apple.com/documentation/appintents/startworkoutintent): Start workout sessions.
- [LiveActivityStartingIntent](https://developer.apple.com/documentation/appintents/liveactivitystartingintent): Start Live Activities.
- [ForegroundContinuableIntent](https://developer.apple.com/documentation/appintents/foregroundcontinuableintent): Continue intents in foreground.

## Focus Filters

- [SetFocusFilterIntent](https://developer.apple.com/documentation/appintents/setfocusfilterintent): Set Focus filters.

## App Extensions

- [AppIntentsExtension](https://developer.apple.com/documentation/appintents/appintentsextension): Create app intents extensions.
- [AppIntentsPackage](https://developer.apple.com/documentation/appintents/appintentspackage): Package app intents.

## Error Handling

- [AppIntentError](https://developer.apple.com/documentation/appintents/appintenterror): Errors that your intent-handling code can return.
- [AppDependencyManager Error](https://developer.apple.com/documentation/appintents/appdependencymanager/error): Dependency manager errors.

## Authentication

- [IntentAuthenticationPolicy](https://developer.apple.com/documentation/appintents/intentauthenticationpolicy): Define authentication requirements.

## Context and State

- [System Context](https://developer.apple.com/documentation/appintents/appintent/systemcontext): Access system context during execution.
- [Title Property](https://developer.apple.com/documentation/appintents/appintent/title): Define intent titles.
- [Description Property](https://developer.apple.com/documentation/appintents/appintent/description): Define intent descriptions.
- [Switch Statement](https://developer.apple.com/documentation/appintents/appintent/switch): Switch between intent states.
- [When Clause](https://developer.apple.com/documentation/appintents/appintent/when): Conditional logic for intents.

## Integration with Other Frameworks

- [AppEnum Protocol](https://developer.apple.com/documentation/appintents/appenum): Define enumerations for use in intents.
- [IntentPerson](https://developer.apple.com/documentation/appintents/intentperson): Represent people in intents.
- [IntentFile](https://developer.apple.com/documentation/appintents/intentfile): Handle files in intents.
- [IntentDescription](https://developer.apple.com/documentation/appintents/intentdescription): Provide intent descriptions.
- [CategoryName](https://developer.apple.com/documentation/appintents/intentdescription/categoryname): Categorize intents.

## Utilities

- [StringSearchCriteria](https://developer.apple.com/documentation/appintents/stringsearchcriteria): Define search criteria for strings.
- [UnionValue Macro](https://developer.apple.com/documentation/appintents/unionvalue()): Create union values.
- [DeprecatedAppIntent](https://developer.apple.com/documentation/appintents/deprecatedappintent): Mark intents as deprecated.
- [AppDependency](https://developer.apple.com/documentation/appintents/appdependency): Manage app dependencies.
- [AppDependencyManager](https://developer.apple.com/documentation/appintents/appdependencymanager): Manage dependencies across intents.
- [Open App When Run](https://developer.apple.com/documentation/appintents/appintent/openappwhenrun): Control app launching behavior.
- [Custom Types Integration](https://developer.apple.com/documentation/appintents/integrating-custom-types-into-your-intents): Integrate custom data types.
- [Making Actions Discoverable](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available): Adopt App Intents for discoverability.
- [Adopting App Intents](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences): Create intents and entities for system experiences.
- [Parameter Summary](https://developer.apple.com/documentation/appintents/parametersummary/intent): Summarize intent parameters.