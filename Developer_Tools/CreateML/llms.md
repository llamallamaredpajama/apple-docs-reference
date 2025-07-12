# https://developer.apple.com/documentation/createml llms.txt

## Framework Overview
- [Create ML Framework](https://developer.apple.com/documentation/createml): Create machine learning models for use in your app on iOS, macOS, tvOS, and visionOS.
- [Creating a Model from Tabular Data](https://developer.apple.com/documentation/createml/creating_a_model_from_tabular_data): Train a machine learning model by using Core ML to import and manage tabular data.
- [Improving Your Model's Accuracy](https://developer.apple.com/documentation/createml/improving-your-model-s-accuracy): Use metrics to tune the performance of your machine learning model.

## Core Data Structures
- [MLDataTable](https://developer.apple.com/documentation/createml/mldatatable): A table of data for training or evaluating a machine learning model.
- [MLDataColumn](https://developer.apple.com/documentation/createml/mldatacolumn): A column of data in an MLDataTable.
- [MLDataValue](https://developer.apple.com/documentation/createml/mldatavalue): The value of a cell in a data table.
- [MLDataValue.DictionaryType](https://developer.apple.com/documentation/createml/mldatavalue/dictionarytype): Dictionary type for MLDataValue.
- [MLDataTable.JoinType](https://developer.apple.com/documentation/createml/mldatatable/jointype): Types of joins for data tables.
- [MLDataTable.ColumnTypes](https://developer.apple.com/documentation/createml/mldatatable/columntypes): Column types information for data tables.

## Image Classification
- [Creating an Image Classifier Model](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model): Train a machine learning model to classify images, and add it to your Core ML app.
- [MLImageClassifier](https://developer.apple.com/documentation/createml/mlimageclassifier): A model you train to classify images.
- [MLImageClassifier.ImageAugmentationOptions](https://developer.apple.com/documentation/createml/mlimageclassifier/imageaugmentationoptions): Options for image augmentation during training.
- [MLImageClassifier.ModelParameters.FeatureExtractor](https://developer.apple.com/documentation/createml/mlimageclassifier/modelparameters-swift.struct/featureextractor): Feature extraction options for image classification.

## Text Classification
- [Creating a Text Classifier Model](https://developer.apple.com/documentation/createml/creating-a-text-classifier-model): Train a machine learning model to classify natural language text.
- [MLTextClassifier](https://developer.apple.com/documentation/createml/mltextclassifier): A model you train to classify natural language text.
- [MLTextClassifier.ModelAlgorithmType](https://developer.apple.com/documentation/createml/mltextclassifier/modelalgorithmtype): Algorithm types for text classification.
- [MLTextClassifier.TrainingMetrics](https://developer.apple.com/documentation/createml/mltextclassifier/trainingmetrics): Training metrics for text classifiers.
- [MLWordTagger](https://developer.apple.com/documentation/createml/mlwordtagger): A word-tagging model you train to classify natural language text at the word level.
- [MLGazetteer](https://developer.apple.com/documentation/createml/mlgazetteer): A collection of terms and their labels, which augments a tagger that analyzes natural language text.
- [MLWordEmbedding](https://developer.apple.com/documentation/createml/mlwordembedding): A map of strings in a vector space that enable your app to find similar strings.

## Sound Classification
- [MLSoundClassifier](https://developer.apple.com/documentation/createml/mlsoundclassifier): A machine learning model you train with audio files to recognize and identify sounds on a device.
- [MLSoundClassifier.Model](https://developer.apple.com/documentation/createml/mlsoundclassifier/model): The model representation for sound classifiers.
- [MLSoundClassifier.FeatureExtractionParameters](https://developer.apple.com/documentation/createml/mlsoundclassifier/featureextractionparameters): Parameters for sound feature extraction.

## Tabular Classification & Regression
- [MLClassifier](https://developer.apple.com/documentation/createml/mlclassifier): A model you train to classify data into discrete categories.
- [MLRegressor](https://developer.apple.com/documentation/createml/mlregressor): A model you train to estimate continuous values.
- [MLLogisticRegressionClassifier](https://developer.apple.com/documentation/createml/mllogisticregressionclassifier): Logistic regression classifier for tabular data.
- [MLLinearRegressor](https://developer.apple.com/documentation/createml/mllinearregressor): Linear regression model for continuous value prediction.
- [MLRandomForestClassifier](https://developer.apple.com/documentation/createml/mlrandomforestclassifier): Random forest classifier for tabular data.
- [MLRandomForestRegressor](https://developer.apple.com/documentation/createml/mlrandomforestregressor): Random forest regressor for continuous values.
- [MLBoostedTreeClassifier](https://developer.apple.com/documentation/createml/mlboostedtreeclassifier): Boosted tree classifier for tabular data.
- [MLBoostedTreeRegressor](https://developer.apple.com/documentation/createml/mlboostedtreeregressor): Boosted tree regressor for continuous values.
- [MLDecisionTreeClassifier](https://developer.apple.com/documentation/createml/mldecisiontreeclassifier): Decision tree classifier for tabular data.
- [MLDecisionTreeRegressor](https://developer.apple.com/documentation/createml/mldecisiontreeregressor): Decision tree regressor for continuous values.
- [MLSupportVectorClassifier](https://developer.apple.com/documentation/createml/mlsupportvectorclassifier): Support vector machine classifier.

## Object Detection
- [MLObjectDetector](https://developer.apple.com/documentation/createml/mlobjectdetector): A model you train to classify one or more objects within an image.
- [MLObjectDetector.DataSource](https://developer.apple.com/documentation/createml/mlobjectdetector/datasource): Data source for object detection training.
- [MLObjectDetector.AnnotationType](https://developer.apple.com/documentation/createml/mlobjectdetector/annotationtype): Annotation types for object detection.
- [MLObjectDetector.ObjectAnnotation](https://developer.apple.com/documentation/createml/mlobjectdetector/objectannotation): Object annotation structure.
- [Building an Object Detector Data Source](https://developer.apple.com/documentation/createml/building-an-object-detector-data-source): Prepare data for training object detection models.

## Action Classification
- [Creating an Action Classifier Model](https://developer.apple.com/documentation/createml/creating-an-action-classifier-model): Train a machine learning model to recognize a person's body movements.
- [MLActionClassifier](https://developer.apple.com/documentation/createml/mlactionclassifier): A model you train with videos to classify a person's body movements.
- [MLActionClassifier.Model](https://developer.apple.com/documentation/createml/mlactionclassifier/model): Model representation for action classifiers.
- [MLHandActionClassifier](https://developer.apple.com/documentation/createml/mlhandactionclassifier): A task that creates a hand action classification model.
- [MLHandPoseClassifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier): A task that creates a hand pose classification model.
- [Building an Action Classifier Data Source](https://developer.apple.com/documentation/createml/building-an-action-classifier-data-source): Prepare video data for action classification.
- [Detecting Human Actions in a Live Video Feed](https://developer.apple.com/documentation/createml/detecting_human_actions_in_a_live_video_feed): Identify body movements by sending pose data to an action-classification model.

## Recommendation Systems
- [MLRecommender](https://developer.apple.com/documentation/createml/mlrecommender): A model you train to make recommendations based on item similarity, grouping, and ratings.
- [MLRecommenderMetrics](https://developer.apple.com/documentation/createml/mlrecommendermetrics): Metrics you use to evaluate a recommender's performance.

## Model Training & Sessions
- [MLJob](https://developer.apple.com/documentation/createml/mljob): The representation of a model's asynchronous training session.
- [MLTrainingSession](https://developer.apple.com/documentation/createml/mltrainingsession): The current state of a model's asynchronous training session.
- [MLTrainingSessionParameters](https://developer.apple.com/documentation/createml/mltrainingsessionparameters): The configuration settings for a training session.
- [MLCheckpoint](https://developer.apple.com/documentation/createml/mlcheckpoint): The state of a model's training session at a specific point in time.
- [MLProgress](https://developer.apple.com/documentation/createml/mlprogress): Progress tracking for model training.
- [MLPhase.Evaluating](https://developer.apple.com/documentation/createml/mlphase/evaluating): Evaluation phase of model training.
- [MLPhase.ExtractingFeatures](https://developer.apple.com/documentation/createml/mlphase/extractingfeatures): Feature extraction phase of model training.

## Model Evaluation & Metrics
- [MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlclassifiermetrics): Metrics you use to evaluate a classifier's performance.
- [MLClassifierMetrics.PrecisionRecall](https://developer.apple.com/documentation/createml/mlclassifiermetrics/precisionrecall): Precision and recall metrics for classifiers.
- [MLClassifierMetrics.Confusion](https://developer.apple.com/documentation/createml/mlclassifiermetrics/confusion): Confusion matrix for classifier evaluation.
- [MLRegressorMetrics](https://developer.apple.com/documentation/createml/mlregressormetrics): Metrics you use to evaluate a regressor's performance.
- [MLWordTaggerMetrics](https://developer.apple.com/documentation/createml/mlwordtaggermetrics): Metrics you use to evaluate a word tagger's performance.
- [MLObjectDetectorMetrics](https://developer.apple.com/documentation/createml/mlobjectdetectormetrics): Metrics you use to evaluate an object detector's performance.
- [MLObjectDetectorMetrics.AveragePrecision](https://developer.apple.com/documentation/createml/mlobjectdetectormetrics/averageprecision): Average precision metrics for object detection.

## Data Splitting & Validation
- [MLSplitStrategy](https://developer.apple.com/documentation/createml/mlsplitstrategy): Data partitioning approaches for creating validation datasets.

## Style Transfer
- [MLStyleTransfer](https://developer.apple.com/documentation/createml/mlstyletransfer): A model you train to apply an image's style to other images or videos.

## Model Metadata & Export
- [MLModelMetadata](https://developer.apple.com/documentation/createml/mlmodelmetadata): Information about a model that's stored in a Core ML model file.
- [MLModelMetadata.Additional](https://developer.apple.com/documentation/createml/mlmodelmetadata/additional): Additional metadata for Core ML models.

## Activity Classification
- [MLActivityClassifier](https://developer.apple.com/documentation/createml/mlactivityclassifier): A model you train to classify motion sensor data.
- [MLActivityClassifier.LabelColumn](https://developer.apple.com/documentation/createml/mlactivityclassifier/labelcolumn): Label column specification for activity classification.
- [MLActivityClassifier.ValidationMetrics](https://developer.apple.com/documentation/createml/mlactivityclassifier/validationmetrics): Validation metrics for activity classifiers.

## Error Handling
- [MLCreateError](https://developer.apple.com/documentation/createml/mlcreateerror): The errors Create ML throws while performing various operations.
- [MLCreateError.FailureReason](https://developer.apple.com/documentation/createml/mlcreateerror/failurereason): Failure reasons for Create ML errors.
- [MLCreateError.Cancelled](https://developer.apple.com/documentation/createml/mlcreateerror/cancelled): Cancellation errors in Create ML.

## Utilities & Visualization
- [Data Visualizations](https://developer.apple.com/documentation/createml/data-visualizations): Render images of data tables and columns in a playground.
- [MLIdentifier](https://developer.apple.com/documentation/createml/mlidentifier): Identifier types used in Create ML.
- [MLVisualizable](https://developer.apple.com/documentation/createml/mlvisualizable): Protocol for visualizable ML components.
- [MLStreamingVisualizable](https://developer.apple.com/documentation/createml/mlstreamingvisualizable): Protocol for streaming visualizable components.

## Bounding Box Utilities
- [MLBoundingBoxAnchor](https://developer.apple.com/documentation/createml/mlboundingboxanchor): A location within a bounding box that annotation coordinates use as reference.
- [MLBoundingBoxCoordinatesOrigin](https://developer.apple.com/documentation/createml/mlboundingboxcoordinatesorigin): The location within an image that annotation coordinates use as origin.
- [MLBoundingBoxUnits](https://developer.apple.com/documentation/createml/mlboundingboxunits): The units a bounding box annotation uses to define position and size.