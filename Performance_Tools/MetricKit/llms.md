# MetricKit Framework Documentation

## Overview
MetricKit provides on-device app diagnostics and power/performance metrics that the system captures. The framework delivers metric reports about battery usage, performance, and diagnostic information to help developers optimize their apps.

## Main Documentation
- [MetricKit Framework](https://developer.apple.com/documentation/metrickit): Main framework documentation for receiving on-device app diagnostics and metrics
- [Getting Started with MetricKit](https://developer.apple.com/documentation/metrickit/getting_started_with_metrickit): Introduction to using MetricKit in your apps
- [MetricKit Overview](https://developer.apple.com/documentation/metrickit/improving_your_app_s_performance): Improve app performance using MetricKit

## Performance Metrics
- [MXMetricPayload](https://developer.apple.com/documentation/metrickit/mxmetricpayload): Container for all app metrics
- [MXAppRunTimeMetric](https://developer.apple.com/documentation/metrickit/mxappruntimemetric): App runtime performance metrics
- [MXAppLaunchMetric](https://developer.apple.com/documentation/metrickit/mxapplaunchmetric): App launch performance data
- [MXAppResponsivenessMetric](https://developer.apple.com/documentation/metrickit/mxappresponsivenessmetric): App responsiveness measurements
- [MXAnimationMetric](https://developer.apple.com/documentation/metrickit/mxanimationmetric): Animation performance metrics
- [MXAppExitMetric](https://developer.apple.com/documentation/metrickit/mxappexitmetric): App termination metrics

## Battery and Power Metrics
- [MXCPUMetric](https://developer.apple.com/documentation/metrickit/mxcpumetric): CPU usage metrics
- [MXGPUMetric](https://developer.apple.com/documentation/metrickit/mxgpumetric): GPU usage metrics
- [MXDisplayMetric](https://developer.apple.com/documentation/metrickit/mxdisplaymetric): Display usage metrics
- [MXNetworkTransferMetric](https://developer.apple.com/documentation/metrickit/mxnetworktransfermetric): Network data transfer metrics
- [MXLocationActivityMetric](https://developer.apple.com/documentation/metrickit/mxlocationactivitymetric): Location services usage
- [MXCellularConditionMetric](https://developer.apple.com/documentation/metrickit/mxcellularconditionmetric): Cellular network conditions

## Diagnostic Reports
- [MXDiagnosticPayload](https://developer.apple.com/documentation/metrickit/mxdiagnosticpayload): Container for diagnostic data
- [MXDiagnostic](https://developer.apple.com/documentation/metrickit/mxdiagnostic): Base class for all diagnostic reports
- [MXMetaData](https://developer.apple.com/documentation/metrickit/mxmetadata): Metadata associated with diagnostics
- [MXCallStackTree](https://developer.apple.com/documentation/metrickit/mxcallstacktree): Call stack information for diagnostics

## Crash Reports
- [MXCrashDiagnostic](https://developer.apple.com/documentation/metrickit/mxcrashdiagnostic): Crash diagnostic information
- [MXCrashDiagnosticObjectiveCExceptionReason](https://developer.apple.com/documentation/metrickit/mxcrashdiagnosticobjectivecexceptionreason): Objective-C crash reasons
- [Getting Crash Reports](https://developer.apple.com/documentation/metrickit/getting_crash_reports_about_your_app): Guide to crash report collection

## Hang Reports
- [MXHangDiagnostic](https://developer.apple.com/documentation/metrickit/mxhangdiagnostic): App hang diagnostic information
- [Diagnosing App Hangs](https://developer.apple.com/documentation/metrickit/diagnosing_app_hangs): Understanding hang reports

## Disk Write Exceptions
- [MXDiskWriteExceptionDiagnostic](https://developer.apple.com/documentation/metrickit/mxdiskwriteexceptiondiagnostic): Excessive disk write diagnostics
- [Disk Write Exception Monitoring](https://developer.apple.com/documentation/metrickit/monitoring_disk_writes): Track disk write issues

## CPU Exceptions
- [MXCPUExceptionDiagnostic](https://developer.apple.com/documentation/metrickit/mxcpuexceptiondiagnostic): CPU usage exception diagnostics
- [CPU Exception Analysis](https://developer.apple.com/documentation/metrickit/analyzing_cpu_exceptions): Understanding CPU exceptions

## Custom Metrics and Signposts
- [MXSignpost](https://developer.apple.com/documentation/metrickit/mxsignpost): Custom signpost metrics
- [MXSignpostMetric](https://developer.apple.com/documentation/metrickit/mxsignpostmetric): Signpost performance data
- [mxSignpost](https://developer.apple.com/documentation/metrickit/mxsignpost): Creating custom signposts
- [Custom Metrics Guide](https://developer.apple.com/documentation/metrickit/creating_custom_metrics): Implementing custom metrics

## MetricKit Manager
- [MXMetricManager](https://developer.apple.com/documentation/metrickit/mxmetricmanager): Main interface for MetricKit
- [MXMetricManagerSubscriber](https://developer.apple.com/documentation/metrickit/mxmetricmanagersubscriber): Protocol for receiving metrics

## Data Units and Measurements
- [MXUnitAveragePixelLuminance](https://developer.apple.com/documentation/metrickit/mxunitaveragepixelluminance): Display brightness units
- [MXUnitSignalBars](https://developer.apple.com/documentation/metrickit/mxunitsignalbars): Signal strength units
- [MXHistogram](https://developer.apple.com/documentation/metrickit/mxhistogram): Statistical data representation
- [MXAverage](https://developer.apple.com/documentation/metrickit/mxaverage): Average value calculations

## Memory Metrics
- [MXMemoryMetric](https://developer.apple.com/documentation/metrickit/mxmemorymetric): Memory usage metrics
- [MXAppMemoryUsageMetric](https://developer.apple.com/documentation/metrickit/mxappmemoryusagemetric): Detailed memory usage

## Error Handling
- [MXError](https://developer.apple.com/documentation/metrickit/mxerror): MetricKit error codes
- [MXErrorCode](https://developer.apple.com/documentation/metrickit/mxerror/code): Specific error code enumeration

## Background Tasks and Launch Metrics
- [MXBackgroundExitData](https://developer.apple.com/documentation/metrickit/mxbackgroundexitdata): Background task exit data
- [MXForegroundExitData](https://developer.apple.com/documentation/metrickit/mxforegroundexitdata): Foreground app exit data
- [MXAppLaunchDiagnostic](https://developer.apple.com/documentation/metrickit/mxapplaunchdiagnostic): App launch diagnostics

## Best Practices
- [MetricKit Best Practices](https://developer.apple.com/documentation/metrickit/metrickit_best_practices): Implementation guidelines
- [Privacy and MetricKit](https://developer.apple.com/documentation/metrickit/privacy_considerations): Privacy considerations
- [Testing with MetricKit](https://developer.apple.com/documentation/metrickit/testing_metrickit_integration): Testing metric collection

## Sample Code
- [MetricKit Sample App](https://developer.apple.com/documentation/metrickit/metrickit_sample): Example implementation
- [Implementing MetricKit](https://developer.apple.com/documentation/metrickit/implementing_metrickit_in_your_app): Step-by-step guide

## WWDC Sessions
- [What's New in MetricKit](https://developer.apple.com/videos/play/wwdc2023/10192/): Latest MetricKit features
- [Ultimate App Performance Survival Guide](https://developer.apple.com/videos/play/wwdc2021/10180/): Performance optimization
- [Diagnose Power and Performance Issues](https://developer.apple.com/videos/play/wwdc2021/10087/): Using MetricKit effectively

## Related Technologies
- [os_signpost](https://developer.apple.com/documentation/os/os_signpost): System signpost logging
- [Instruments](https://developer.apple.com/documentation/instruments): Performance analysis tools
- [XCTest Metrics](https://developer.apple.com/documentation/xctest/performance_metrics): Performance testing

## Platform Availability
- iOS 13.0+
- iPadOS 13.0+
- macOS 12.0+
- Mac Catalyst 13.0+
- tvOS 16.0+
- watchOS 9.0+
- visionOS 1.0+