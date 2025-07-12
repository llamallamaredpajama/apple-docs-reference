# RealityKit Framework - llms.txt

> Simulate and render 3D content for use in your augmented reality apps.

## Overview

RealityKit provides high-performance 3D simulation and rendering capabilities for creating 3D and augmented reality (AR) experiences on iOS, iPadOS, macOS, tvOS, and visionOS. It's an AR-first 3D framework that leverages ARKit to seamlessly integrate virtual objects into the real world.

## Key Features

- Entity Component System (ECS) architecture
- High-performance 3D rendering and physics simulation
- Material and texture management with PBR support
- Animation systems including skeletal and blend shape animations
- Spatial audio integration
- ARKit integration for AR experiences
- SwiftUI integration for visionOS apps
- Reality Composer Pro integration for content creation

## Documentation Structure

### Core Architecture

- **Entity Component System**
  - [Entity](https://developer.apple.com/documentation/realitykit/entity) - Base element with attached components
  - [Component](https://developer.apple.com/documentation/realitykit/component) - Behavior and appearance characteristics
  - [System](https://developer.apple.com/documentation/realitykit/system) - Apply behaviors to entities
  - [Scene](https://developer.apple.com/documentation/realitykit/scene) - Context holding all entities

### 3D Rendering

- **Models and Meshes**
  - [ModelEntity](https://developer.apple.com/documentation/realitykit/modelentity) - Entity with mesh and materials
  - [MeshResource](https://developer.apple.com/documentation/realitykit/meshresource) - 3D geometry data
  - [MeshDescriptor](https://developer.apple.com/documentation/realitykit/meshdescriptor) - Define custom meshes
  - [MeshInstancesComponent](https://developer.apple.com/documentation/realitykit/meshinstancescomponent) - Instance rendering

### Materials and Textures

- **Material Types**
  - [PhysicallyBasedMaterial](https://developer.apple.com/documentation/realitykit/physicallybasedmaterial) - PBR materials
  - [UnlitMaterial](https://developer.apple.com/documentation/realitykit/unlitmaterial) - Self-illuminated materials
  - [OcclusionMaterial](https://developer.apple.com/documentation/realitykit/occlusionmaterial) - AR occlusion
  - [PortalMaterial](https://developer.apple.com/documentation/realitykit/portalmaterial) - Portal effects
  - [CustomMaterial](https://developer.apple.com/documentation/realitykit/custommaterial) - Shader-based materials

- **Textures**
  - [TextureResource](https://developer.apple.com/documentation/realitykit/textureresource) - Image textures
  - [MaterialParameters](https://developer.apple.com/documentation/realitykit/materialparametertypes) - Material properties

### Animation System

- **Animation Types**
  - [AnimationResource](https://developer.apple.com/documentation/realitykit/animationresource) - Animation data
  - [AnimationPlaybackController](https://developer.apple.com/documentation/realitykit/animationplaybackcontroller) - Control playback
  - [FromToByAnimation](https://developer.apple.com/documentation/realitykit/fromtobyanimation) - Property animations
  - [SampledAnimation](https://developer.apple.com/documentation/realitykit/sampledanimation) - Keyframe animations

- **Skeletal Animation**
  - [SkeletalPosesComponent](https://developer.apple.com/documentation/realitykit/skeletalposescomponent) - Joint poses
  - [BlendShapeWeightsComponent](https://developer.apple.com/documentation/realitykit/blendshapeweightscomponent) - Morph targets
  - [AnimationView](https://developer.apple.com/documentation/realitykit/animationview) - Animation timeline

### Physics Simulation

- **Physics Bodies**
  - [PhysicsBodyComponent](https://developer.apple.com/documentation/realitykit/physicsbodycomponent) - Physics properties
  - [PhysicsMotionComponent](https://developer.apple.com/documentation/realitykit/physicsmotioncomponent) - Dynamic motion
  - [CollisionComponent](https://developer.apple.com/documentation/realitykit/collisioncomponent) - Collision shapes

- **Physics Joints**
  - [PhysicsFixedJoint](https://developer.apple.com/documentation/realitykit/physicsfixedjoint) - Fixed connections
  - [PhysicsRevoluteJoint](https://developer.apple.com/documentation/realitykit/physicsrevolutejoint) - Hinges
  - [PhysicsSphericalJoint](https://developer.apple.com/documentation/realitykit/physicssphericaljoint) - Ball joints
  - [PhysicsDistanceJoint](https://developer.apple.com/documentation/realitykit/physicsdistancejoint) - Spring connections

- **Collision Detection**
  - [CollisionFilter](https://developer.apple.com/documentation/realitykit/collisionfilter) - Collision groups
  - [CollisionEvents](https://developer.apple.com/documentation/realitykit/collisionevents) - Collision callbacks

### Audio Spatial

- **Audio Components**
  - [AudioLibraryComponent](https://developer.apple.com/documentation/realitykit/audiolibrarycomponent) - Audio resources
  - [SpatialAudioComponent](https://developer.apple.com/documentation/realitykit/spatialaudiocomponent) - 3D audio
  - [AudioFileResource](https://developer.apple.com/documentation/realitykit/audiofileresource) - Audio files
  - [AudioPlaybackController](https://developer.apple.com/documentation/realitykit/audioplaybackcontroller) - Audio control

### ARKit Integration

- **AR Views**
  - [ARView](https://developer.apple.com/documentation/realitykit/arview) - AR rendering view
  - [AnchorEntity](https://developer.apple.com/documentation/realitykit/anchorentity) - AR anchoring
  - [HasAnchoring](https://developer.apple.com/documentation/realitykit/hasanchoring) - Anchoring protocol

- **AR Tracking**
  - World tracking
  - Image tracking
  - Object tracking
  - Face tracking
  - Body tracking

### SwiftUI Integration

- **visionOS Views**
  - [RealityView](https://developer.apple.com/documentation/realitykit/realityview) - SwiftUI 3D view
  - [ViewAttachmentEntity](https://developer.apple.com/documentation/realitykit/viewattachmententity) - 2D attachments
  - [AttachmentContent](https://developer.apple.com/documentation/realitykit/attachmentcontent) - SwiftUI in 3D

- **Presentation Components**
  - [PresentationComponent](https://developer.apple.com/documentation/realitykit/presentationcomponent) - Content presentation
  - [ImagePresentationComponent](https://developer.apple.com/documentation/realitykit/imagepresentationcomponent) - Image display
  - [VideoPlaybackController](https://developer.apple.com/documentation/realitykit/videoplaybackcontroller) - Video playback

### Lighting and Cameras

- **Lights**
  - [DirectionalLight](https://developer.apple.com/documentation/realitykit/directionallight) - Sun-like lighting
  - [PointLightComponent](https://developer.apple.com/documentation/realitykit/pointlightcomponent) - Omnidirectional
  - [SpotLight](https://developer.apple.com/documentation/realitykit/spotlight) - Focused lighting

- **Cameras**
  - [PerspectiveCamera](https://developer.apple.com/documentation/realitykit/perspectivecamera) - Standard projection
  - [OrthographicCamera](https://developer.apple.com/documentation/realitykit/orthographiccamera) - Parallel projection

### Performance

- **Optimization**
  - [ModelSortGroup](https://developer.apple.com/documentation/realitykit/modelsortgroup) - Render ordering
  - Level of detail (LOD)
  - Instanced rendering
  - Occlusion culling

### Events and Interactions

- **Event System**
  - [Event](https://developer.apple.com/documentation/realitykit/event) - Base event type
  - [EventSource](https://developer.apple.com/documentation/realitykit/eventsource) - Event publishing
  - [EventSubscription](https://developer.apple.com/documentation/realitykit/eventsubscription) - Event handling

- **Gestures**
  - [EntityGestureRecognizer](https://developer.apple.com/documentation/realitykit/entitygesturerecognizer) - Entity gestures
  - Tap, drag, rotation, and scale gestures

### Object Capture

- **Photogrammetry**
  - [ObjectCaptureView](https://developer.apple.com/documentation/realitykit/objectcaptureview) - Capture UI
  - [Scanning objects](https://developer.apple.com/documentation/realitykit/scanning-objects-using-object-capture)
  - [Capturing photographs](https://developer.apple.com/documentation/realitykit/capturing-photographs-for-realitykit-object-capture)

## Common Use Cases

1. **AR Applications** - Place virtual objects in real environments
2. **3D Visualization** - Interactive 3D model viewers
3. **Games** - 3D games with physics and animations
4. **Education** - Interactive learning experiences
5. **Architecture** - Visualize buildings and spaces
6. **Retail** - Product visualization and AR try-on
7. **Medical** - 3D anatomical models
8. **Industrial** - Equipment visualization and training

## Platform Requirements

- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+
- tvOS 26.0+ (Beta)
- visionOS 1.0+
- Mac Catalyst 13.1+

## Related Frameworks

- **ARKit** - Augmented reality tracking and scene understanding
- **SceneKit** - 3D graphics rendering (legacy)
- **Metal** - Low-level graphics API
- **Reality Composer Pro** - Visual content creation tool
- **USD** - Universal Scene Description format

## Best Practices

1. Use the Entity Component System architecture effectively
2. Optimize mesh and texture resources for performance
3. Implement proper collision filtering for physics
4. Use spatial audio for immersive experiences
5. Handle AR session interruptions gracefully
6. Test on actual devices for AR features
7. Profile performance using RealityKit tools

## Additional Resources

- [RealityKit Documentation](https://developer.apple.com/documentation/realitykit)
- [Building an immersive experience](https://developer.apple.com/documentation/realitykit/building-an-immersive-experience-with-realitykit)
- [Creating spatial drawing apps](https://developer.apple.com/documentation/realitykit/creating-a-spatial-drawing-app-with-realitykit)
- [WWDC Sessions on RealityKit](https://developer.apple.com/videos/frameworks/realitykit)
- [Reality Composer Pro Guide](https://developer.apple.com/documentation/visionOS/designing-realitykit-content-with-reality-composer-pro)