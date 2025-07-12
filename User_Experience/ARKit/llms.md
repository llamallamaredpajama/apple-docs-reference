# https://developer.apple.com/documentation/arkit llms.txt

## Core Framework
- [ARKit Framework](https://developer.apple.com/documentation/arkit): Integrate hardware sensing features to produce augmented reality apps and games.
- [ARKit in iOS](https://developer.apple.com/documentation/arkit/arkit-in-ios): Integrate iOS device camera and motion features to produce augmented reality experiences in your app or game.
- [ARKit in visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos): Create immersive augmented reality experiences.

## Setup and Session Management
- [ARSession](https://developer.apple.com/documentation/arkit/arsession): The object that manages the major tasks associated with every AR experience, such as motion tracking, camera passthrough, and image analysis.
- [Verifying Device Support and User Permission](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission): Check whether your app can use ARKit and respect user privacy at runtime.
- [Managing Session Life Cycle and Tracking Quality](https://developer.apple.com/documentation/arkit/managing-session-life-cycle-and-tracking-quality): Keep the user informed on the current session state and recover from interruptions.
- [Choosing Which Camera Feed to Augment](https://developer.apple.com/documentation/arkit/choosing-which-camera-feed-to-augment): Add visual effects to the user's environment in an AR experience through the front or rear camera.

## Configuration Objects
- [Configuration Objects](https://developer.apple.com/documentation/arkit/configuration-objects): Configure your augmented reality session to detect and track specific types of content.
- [ARConfiguration](https://developer.apple.com/documentation/arkit/arconfiguration): The base object that contains information about how to configure an augmented reality session.

## World Tracking
- [Understanding World Tracking](https://developer.apple.com/documentation/arkit/understanding-world-tracking): Discover features and best practices for building rear-camera AR experiences.
- [ARWorldTrackingConfiguration](https://developer.apple.com/documentation/arkit/arworldtrackingconfiguration): A configuration that tracks the position of a device in relation to objects in the environment.
- [ARGeoTrackingConfiguration](https://developer.apple.com/documentation/arkit/argeotrackingconfiguration): A configuration that tracks locations with GPS, map data, and a device's compass.
- [AROrientationTrackingConfiguration](https://developer.apple.com/documentation/arkit/arorientationtrackingconfiguration): A configuration that tracks only the device's orientation using the rear-facing camera.
- [ARPositionalTrackingConfiguration](https://developer.apple.com/documentation/arkit/arpositionaltrackingconfiguration): A configuration that tracks only the device's position in 3D space.
- [Tracking Geographic Locations in AR](https://developer.apple.com/documentation/arkit/tracking-geographic-locations-in-ar): Track specific geographic areas of interest and render them in an AR experience.

## Face Tracking
- [ARFaceTrackingConfiguration](https://developer.apple.com/documentation/arkit/arfacetrackingconfiguration): A configuration that tracks facial movement and expressions using the front camera.
- [Creating Face-Based AR Experiences](https://developer.apple.com/documentation/arkit/creating-face-based-ar-experiences): Use the TrueDepth camera to track a face in 3D and apply visual effects.
- [ARFaceAnchor](https://developer.apple.com/documentation/arkit/arfaceanchor): Information about the pose, topology, and expression of a face that ARKit detects.

## Body and Motion Tracking
- [ARBodyTrackingConfiguration](https://developer.apple.com/documentation/arkit/arbodytrackingconfiguration): A configuration that tracks human body poses, planar surfaces, and images using the rear-facing camera.
- [Capturing Body Motion in 3D](https://developer.apple.com/documentation/arkit/capturing-body-motion-in-3d): Track a person in the physical environment and visualize their motion by applying the motion to a virtual skeleton.
- [ARBodyAnchor](https://developer.apple.com/documentation/arkit/arbodyanchor): An object that tracks a body in 3D space using a skeleton model.
- [ARSkeleton](https://developer.apple.com/documentation/arkit/arskeleton): The interface for the skeleton of a tracked body.

## Image Detection and Tracking
- [ARImageTrackingConfiguration](https://developer.apple.com/documentation/arkit/arimagetrackingconfiguration): A configuration that tracks known images using the rear-facing camera.
- [Detecting Images in an AR Experience](https://developer.apple.com/documentation/arkit/detecting-images-in-an-ar-experience): Recognize known 2D images in the user's environment, and use their positions to place AR content.
- [ARReferenceImage](https://developer.apple.com/documentation/arkit/arreferenceimage): A reference image to track in the physical environment.
- [ARImageAnchor](https://developer.apple.com/documentation/arkit/arimageanchor): An object that tracks the position and orientation of an image detected in a world-tracking AR session.
- [Tracking and Altering Images](https://developer.apple.com/documentation/arkit/tracking-and-altering-images): Track rectangular images in a user's environment and augment them with virtual content.

## Object Detection and Scanning
- [ARObjectScanningConfiguration](https://developer.apple.com/documentation/arkit/arobjectscanningconfiguration): A configuration that recognizes objects and collects high-fidelity data about specific objects using the rear-facing camera.
- [Scanning and Detecting 3D Objects](https://developer.apple.com/documentation/arkit/scanning-and-detecting-3d-objects): Record spatial features of real-world objects, then use the results to find those objects in the user's environment and trigger virtual content.
- [ARReferenceObject](https://developer.apple.com/documentation/arkit/arreferenceobject): A 3D object to track in the physical environment.
- [ARObjectAnchor](https://developer.apple.com/documentation/arkit/arobjectanchor): An anchor representing a real-world 3D object detected in a world-tracking AR session.

## Plane Detection
- [Tracking and Visualizing Planes](https://developer.apple.com/documentation/arkit/tracking-and-visualizing-planes): Detect surfaces in the physical environment and visualize their shape and location in 3D space.
- [ARPlaneAnchor](https://developer.apple.com/documentation/arkit/arplaneanchor): An anchor for a 2D planar surface that ARKit detects in the physical environment.
- [ARPlaneGeometry](https://developer.apple.com/documentation/arkit/arplanegeometry): A description of the estimated shape of a detected plane.
- [ARMeshAnchor](https://developer.apple.com/documentation/arkit/armeshanchor): An anchor for a physical object that ARKit detects and recreates virtually using a polygonal mesh.

## Scene Understanding and Environmental Analysis
- [Environmental Analysis](https://developer.apple.com/documentation/arkit/environmental-analysis): Analyze the video from the cameras and the accompanying data, and use ray-casting and depth-map information to determine the location of items.
- [Visualizing and Interacting with a Reconstructed Scene](https://developer.apple.com/documentation/arkit/visualizing-and-interacting-with-a-reconstructed-scene): Estimate the shape of the physical environment using a polygonal mesh.
- [ARMeshGeometry](https://developer.apple.com/documentation/arkit/armeshgeometry): A 3D mesh with vertices and faces that define the estimated shape of a physical environment.
- [Placing Objects and Handling 3D Interaction](https://developer.apple.com/documentation/arkit/placing-objects-and-handling-3d-interaction): Place virtual objects on detected surfaces and enable the user to interact with them.

## Anchors and Content Placement
- [Content Anchors](https://developer.apple.com/documentation/arkit/content-anchors): Identify items in the physical environment, including planar surfaces, images, physical objects, body positions, and faces.
- [ARAnchor](https://developer.apple.com/documentation/arkit/aranchor): An object that specifies the position and orientation of an item in the physical environment.
- [ARGeoAnchor](https://developer.apple.com/documentation/arkit/argeoanchor): An anchor you use to place virtual content at a specific geographic location.
- [ARAppClipCodeAnchor](https://developer.apple.com/documentation/arkit/arappclipcodeancho): An anchor that tracks the position and orientation of an App Clip Code in the physical environment.

## Views and Rendering
- [ARSCNView](https://developer.apple.com/documentation/arkit/arscnview): A view that blends virtual 3D content from SceneKit into your augmented reality experience.
- [ARSKView](https://developer.apple.com/documentation/arkit/arskview): A view that blends virtual 2D content from SpriteKit into the 3D space of an augmented reality experience.
- [ARCoachingOverlayView](https://developer.apple.com/documentation/arkit/arcoachingoverlayview): A view that displays standardized onboarding instructions to direct users toward a specific goal.
- [Displaying an AR Experience with Metal](https://developer.apple.com/documentation/arkit/displaying-an-ar-experience-with-metal): Control rendering of your app's virtual content on top of a camera feed.

## Camera, Lighting, and Effects
- [Camera, Lighting, and Effects](https://developer.apple.com/documentation/arkit/camera-lighting-and-effects): Determine the camera position and lighting for the current session, and apply effects, such as occlusion, to elements of the environment.
- [Adding Realistic Reflections to an AR Experience](https://developer.apple.com/documentation/arkit/adding-realistic-reflections-to-an-ar-experience): Use ARKit to generate environment probe textures from camera imagery and render reflective virtual objects.
- [ARLightEstimate](https://developer.apple.com/documentation/arkit/arlightestimate): Estimated scene lighting information associated with a captured video frame in an AR session.
- [ARDirectionalLightEstimate](https://developer.apple.com/documentation/arkit/ardirectionallightestimate): Estimated scene lighting information associated with a captured video frame in a face-tracking AR session.

## AR Quick Look
- [Previewing a Model with AR Quick Look](https://developer.apple.com/documentation/arkit/previewing-a-model-with-ar-quick-look): Display a model or scene that the user can move, scale, and share with others.
- [Adding Visual Effects in AR Quick Look and RealityKit](https://developer.apple.com/documentation/arkit/adding-visual-effects-in-ar-quick-look-and-realitykit): Balance the appearance and performance of your AR experiences with modeling strategies.
- [Adding an Apple Pay Button or a Custom Action in AR Quick Look](https://developer.apple.com/documentation/arkit/adding-an-apple-pay-button-or-a-custom-action-in-ar-quick-look): Provide a banner that users can tap to make a purchase or perform a custom action in an AR experience.

## Shared and Multiuser Experiences
- [Creating a Collaborative Session](https://developer.apple.com/documentation/arkit/creating-a-collaborative-session): Enable nearby devices to share an AR experience by using a peer-to-peer multiuser strategy.
- [Creating a Multiuser AR Experience](https://developer.apple.com/documentation/arkit/creating-a-multiuser-ar-experience): Enable nearby devices to share an AR experience by using a host-guest multiuser strategy.
- [Streaming an AR Experience](https://developer.apple.com/documentation/arkit/streaming-an-ar-experience): Control an AR experience remotely by transferring sensor and user input over the network.
- [ARParticipantAnchor](https://developer.apple.com/documentation/arkit/arparticipantanchor): An anchor for another user in multiuser augmented reality experiences.
- [CollaborationData](https://developer.apple.com/documentation/arkit/arsession/collaborationdata): An object that holds information that a user has collected about the physical environment.

## Data Management
- [Data Management](https://developer.apple.com/documentation/arkit/data-management): Obtain detailed information about skeletal and face geometry, and saved world data.
- [ARWorldMap](https://developer.apple.com/documentation/arkit/arworldmap): The space-mapping state and set of anchors from a world-tracking AR session.
- [Saving and Loading World Data](https://developer.apple.com/documentation/arkit/saving-and-loading-world-data): Serialize a world-tracking session to resume it later or share it with another user.

## Advanced Features
- [ARRaycastQuery](https://developer.apple.com/documentation/arkit/arraycastquery): A mathematical ray you cast from a point in the device screen space into the physical environment.
- [ARRaycastResult](https://developer.apple.com/documentation/arkit/arraycastresult): A result of a raycast describing the point of intersection with a virtual content or a real-world surface.
- [ARFrame](https://developer.apple.com/documentation/arkit/arframe): A video image captured by the device camera with position tracking information and analysis results.
- [ARCamera](https://developer.apple.com/documentation/arkit/arcamera): Information about the camera position and imaging characteristics for a captured video frame in an AR session.

## Audio
- [Creating an Immersive AR Experience with Audio](https://developer.apple.com/documentation/arkit/creating-an-immersive-ar-experience-with-audio): Use sound effects and environmental sound layers to create an engaging AR experience.

## Error Handling
- [ARError](https://developer.apple.com/documentation/arkit/arerror): An error reported by ARKit.
- [ARError.Code](https://developer.apple.com/documentation/arkit/arerror/code): Codes that identify errors in ARKit.

## Sample Code and Tutorials
- [SwiftStrike: Creating a Game with RealityKit](https://developer.apple.com/documentation/realitykit/swiftstrike-creating-a-game-with-realitykit): Build a multiplayer game with ARKit, RealityKit, and Swift using the SwiftStrike sample project.
- [Building an Object Capture App](https://developer.apple.com/documentation/realitykit/building-an-object-capture-app): Create 3D models from photographs taken on Apple devices using Object Capture API.