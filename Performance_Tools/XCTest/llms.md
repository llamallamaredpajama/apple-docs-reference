# https://developer.apple.com/documentation/xctest llms.txt

## XCTest Framework Overview
- [XCTest Framework](https://developer.apple.com/documentation/xctest): Create and run unit tests, performance tests, and UI tests for your Xcode project.
- [XCTest Base Class](https://developer.apple.com/documentation/xctest/xctest): An abstract base class for creating, managing, and executing tests.
- [XCTestCase](https://developer.apple.com/documentation/xctest/xctestcase): The primary class for defining test cases, test methods, and performance tests.
- [XCTestSuite](https://developer.apple.com/documentation/xctest/xctestsuite): A collection of test cases organized hierarchically.

## Test Setup and Organization
- [Defining Test Cases and Test Methods](https://developer.apple.com/documentation/xctest/defining-test-cases-and-test-methods): Add test cases and test methods to a test target to confirm that your code performs as expected.
- [Set Up and Tear Down State in Your Tests](https://developer.apple.com/documentation/xctest/set-up-and-tear-down-state-in-your-tests): Configure initial state before tests run and clean up after tests complete.
- [Setup Method](https://developer.apple.com/documentation/xctest/xctest/setup()): Provides an opportunity to reset the state before each test method is called.
- [Setup With Error](https://developer.apple.com/documentation/xctest/xctest/setupwitherror()): Provides an opportunity to reset the state before each test method is called and handle errors.
- [Tear Down](https://developer.apple.com/documentation/xctest/xctest/teardown(completion:)): Provides an opportunity to perform cleanup after each test method completes.
- [Add Teardown Block](https://developer.apple.com/documentation/xctest/xctestcase/2887226-addteardownblock): Registers a block of teardown code to run after the current test method ends.

## Unit Testing - Assertions
- [Boolean Assertions](https://developer.apple.com/documentation/xctest/boolean-assertions): Test a condition that generates a true or false result.
- [XCTAssert](https://developer.apple.com/documentation/xctest/xctassert): Asserts that an expression is true.
- [XCTAssert (Detailed)](https://developer.apple.com/documentation/xctest/xctassert(_:_:file:line:)): Asserts that an expression is true with custom failure message.
- [Nil and Non-Nil Assertions](https://developer.apple.com/documentation/xctest/nil-and-non-nil-assertions): Check whether a test condition has, or doesn't have, a value.
- [XCTUnwrap](https://developer.apple.com/documentation/xctest/xctunwrap(_:_:file:line:)): Asserts that an optional variable's value is non-nil and returns its value.
- [Equality and Inequality Assertions](https://developer.apple.com/documentation/xctest/equality-and-inequality-assertions): Check whether two values are equal or unequal.
- [XCTAssertEqual](https://developer.apple.com/documentation/xctest/xctassertequal): Asserts that two values are equal.
- [XCTAssertEqual (Floating Point)](https://developer.apple.com/documentation/xctest/xctassertequal(_:_:accuracy:_:file:line:)-6frfw): Asserts that two floating point values are equal within a specified accuracy.
- [Comparable Value Assertions](https://developer.apple.com/documentation/xctest/comparable-value-assertions): Compare two values to determine whether one is larger or smaller than the other.
- [XCTAssertGreaterThanOrEqual](https://developer.apple.com/documentation/xctest/xctassertgreaterthanorequal): Asserts that one value is greater than or equal to another.
- [Error Assertions](https://developer.apple.com/documentation/xctest/error-assertions): Check whether a function call throws, or doesn't throw, an error.
- [XCTAssertThrows](https://developer.apple.com/documentation/xctest/xctassertthrows): Asserts that an expression throws an error.
- [NSException Assertions](https://developer.apple.com/documentation/xctest/nsexception-assertions): Check whether a function call throws, or doesn't throw, an exception.
- [Unconditional Test Failures](https://developer.apple.com/documentation/xctest/unconditional-test-failures): Generate a failure immediately and unconditionally.

## Test Expectations and Asynchronous Testing
- [Asynchronous Tests and Expectations](https://developer.apple.com/documentation/xctest/asynchronous-tests-and-expectations): Verify that asynchronous code behaves as expected.
- [Create Expectation](https://developer.apple.com/documentation/xctest/xctestcase/expectation(description:)): Creates an expectation for asynchronous testing.
- [Wait for Expectations](https://developer.apple.com/documentation/xctest/xctestcase/waitforexpectations(timeout:handler:)): Waits until all expectations are fulfilled or a timeout is reached.
- [Wait for Expectations Array](https://developer.apple.com/documentation/xctest/xctestcase/wait(for:timeout:)): Waits on an array of expectations for up to the specified timeout.
- [Fulfillment of Expectations](https://developer.apple.com/documentation/xctest/xctestcase/fulfillment(of:timeout:enforceorder:)): Tests whether a set of expectations are fulfilled in a given order within a specified amount of time.
- [XCTWaiter](https://developer.apple.com/documentation/xctest/xctwaiter): Waits for a group of expectations to be fulfilled.
- [Expected Fulfillment Count](https://developer.apple.com/documentation/xctest/xctestexpectation/2806572-expectedfulfillmentcount): The number of times fulfill() must be called before the expectation is completely fulfilled.
- [Inverted Expectations](https://developer.apple.com/documentation/xctest/xctestexpectation/isinverted): Indicates that the expectation is not intended to be called.
- [Notification Expectation](https://developer.apple.com/documentation/xctest/xctestcase/expectation(fornotification:object:handler:)): Creates an expectation that is fulfilled when a notification is posted.

## UI Testing
- [XCUIApplication](https://developer.apple.com/documentation/xctest/xcuiapplication): A proxy for an application for use in UI testing.
- [Launch Application](https://developer.apple.com/documentation/xctest/xcuiapplication/launch()): Launches the application.
- [Activate Application](https://developer.apple.com/documentation/xctest/xcuiapplication/activate()): Activates the application.
- [XCUIElement](https://developer.apple.com/documentation/xctest/xcuielement): A UI element in an application.
- [Tap Element](https://developer.apple.com/documentation/xctest/xcuielement/tap()): Sends a tap event to the element.
- [Type Text](https://developer.apple.com/documentation/xctest/xcuielement/typetext(_:)): Types text into the element.
- [Swipe Up](https://developer.apple.com/documentation/xctest/xcuielement/swipeup()): Swipes up on the element.
- [Press for Duration](https://developer.apple.com/documentation/xctest/xcuielement/press(forduration:)): Presses and holds on the element for a specified duration.
- [Click and Drag](https://developer.apple.com/documentation/xctest/xcuielement/click(forduration:thendragto:)): Clicks and holds for a duration, then drags to another element.
- [Element Exists](https://developer.apple.com/documentation/xctest/xcuielement/exists): Whether the element exists in the current UI hierarchy.
- [Element Hittable](https://developer.apple.com/documentation/xctest/xcuielement/ishittable): Whether the element can be hit at its current location.
- [Element Type](https://developer.apple.com/documentation/xctest/xcuielement/elementtype): The type of the element.
- [Debug Description](https://developer.apple.com/documentation/xctest/xcuielement/debugdescription): A textual representation of the element for debugging.
- [XCUIElementQuery](https://developer.apple.com/documentation/xctest/xcuielementquery): A query for locating UI elements.
- [Element Bound By Index](https://developer.apple.com/documentation/xctest/xcuielementquery/element(boundby:)?changes=_3): Returns the element at the specified index.
- [First Match](https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/firstmatch): Returns the first element matching the query.
- [Static Texts](https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/statictexts): Returns a query for all static text elements.
- [Containing Query](https://developer.apple.com/documentation/xctest/xcuielementquery/containing(_:identifier:)): Returns a new query that matches elements containing a descendant.
- [Descendants Matching](https://developer.apple.com/documentation/xctest/xcuielement/descendants(matching:)): Returns a query for all descendants matching the specified type.
- [XCUIElementAttributes](https://developer.apple.com/documentation/xctest/xcuielementattributes): Attributes exposed by UI elements.
- [Is Selected](https://developer.apple.com/documentation/xctest/xcuielementattributes/isselected): Whether the element is selected.
- [XCUIElementTypeQueryProvider](https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider): Provides queries for elements by their type.
- [XCUICoordinate](https://developer.apple.com/documentation/xctest/xcuicoordinate): A coordinate within the UI element hierarchy.
- [XCUIDevice](https://developer.apple.com/documentation/xctest/xcuidevice): The device on which tests are running.
- [XCUIKeyboardKey](https://developer.apple.com/documentation/xctest/xcuikeyboardkey): Keys available on an iOS keyboard.
- [Handling UI Interruptions](https://developer.apple.com/documentation/xctest/handling-ui-interruptions): Handle system-generated UI interruptions like alerts.

## Performance Testing
- [Performance Tests](https://developer.apple.com/documentation/xctest/performance-tests): Gather metrics while running your code, and report a failure if the metrics become significantly worse than a baseline value.
- [Measure Performance](https://developer.apple.com/documentation/xctest/xctestcase/measure(_:)): Measures the performance of a block of code.
- [Measure with Metrics](https://developer.apple.com/documentation/xctest/xctestcase/measure(metrics:options:block:)): Measures performance using specific metrics and options.
- [XCTMetric](https://developer.apple.com/documentation/xctest/xctmetric): A metric used to measure performance.
- [XCTCPUMetric](https://developer.apple.com/documentation/xctest/xctcpumetric): A metric that measures CPU usage.
- [XCTMemoryMetric](https://developer.apple.com/documentation/xctest/xctmemorymetric): A metric that measures memory usage.
- [XCTClockMetric](https://developer.apple.com/documentation/xctest/xctclockmetric): A metric that measures elapsed time.
- [XCTOSSignpostMetric](https://developer.apple.com/documentation/xctest/xctossignpostmetric): A metric that uses signposts to measure performance.
- [XCTMeasureOptions](https://developer.apple.com/documentation/xctest/xctmeasureoptions/iterationcount): Options for configuring performance measurements.

## Test Execution and Observation
- [Test Execution and Observation](https://developer.apple.com/documentation/xctest/test-execution-and-observation): Observe, introspect, and customize the test execution flow.
- [XCTestObservation](https://developer.apple.com/documentation/xctest/xctestobservation): A protocol for observing test execution.
- [XCTestObservationCenter](https://developer.apple.com/documentation/xctest/xctestobservationcenter): Manages test observers during test execution.
- [Test Case Will Start](https://developer.apple.com/documentation/xctest/xctestobservation/testcasewillstart(_:)): Called when a test case is about to start.
- [Test Case Did Finish](https://developer.apple.com/documentation/xctest/xctestobservation/testcasedidfinish(_:)): Called when a test case has finished.
- [Test Bundle Did Finish](https://developer.apple.com/documentation/xctest/xctestobservation/testbundledidfinish(_:)): Called when all tests in a bundle have finished.
- [Continue After Failure](https://developer.apple.com/documentation/xctest/xctestcase/continueafterfailure): Whether a test should continue after a failure occurs.
- [Execution Time Allowance](https://developer.apple.com/documentation/xctest/xctestcase/executiontimeallowance): The maximum amount of time a test is allowed to run.
- [Test Case Count](https://developer.apple.com/documentation/xctest/xctest/testcasecount): The number of test cases in a test or test suite.
- [Default Test Suite](https://developer.apple.com/documentation/xctest/xctestcase/defaulttestsuite): Returns the default test suite for the test case class.
- [Test Invocations](https://developer.apple.com/documentation/xctest/xctestcase/testinvocations): Returns the test methods to be invoked for the test case.
- [Invoke Test](https://developer.apple.com/documentation/xctest/xctestcase/invoketest()): Invokes the test method.
- [Test Name](https://developer.apple.com/documentation/xctest/xctest/name): The name of the test.

## Activities and Attachments
- [Activities and Attachments](https://developer.apple.com/documentation/xctest/activities-and-attachments): Split long tests into substeps with activities, and attach output data like files and screenshots.
- [Grouping Tests into Substeps with Activities](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities): Organize complex tests into logical substeps.
- [Adding Attachments to Tests Activities and Issues](https://developer.apple.com/documentation/xctest/adding-attachments-to-tests-activities-and-issues): Attach files, images, and other data to test results.
- [XCTContext](https://developer.apple.com/documentation/xctest/xctcontext): Provides access to the current test context.
- [XCTAttachment](https://developer.apple.com/documentation/xctest/xctattachment): An attachment to include in test results.
- [XCUIScreenshot](https://developer.apple.com/documentation/xctest/xcuiscreenshot): A screenshot taken during UI testing.

## Test Configuration
- [Expected Failures](https://developer.apple.com/documentation/xctest/expected-failures): Anticipate known test failures to prevent failing tests from affecting your workflows.
- [XCTExpectFailure](https://developer.apple.com/documentation/xctest/xctexpectfailure(_:options:failingblock:)): Marks test code where a failure is expected.
- [Methods for Skipping Tests](https://developer.apple.com/documentation/xctest/methods-for-skipping-tests): Skip tests when meeting specified conditions.
- [XCTestRun Test](https://developer.apple.com/documentation/xctest/xctestrun/test): Represents a test run configuration.
- [Record Test](https://developer.apple.com/documentation/xctest/xctestcase/record(_:)): Records test artifacts.

## Test Logging
- [XCTestLog](https://developer.apple.com/documentation/xctest/xctestlog): Provides logging functionality for tests.

## Integration and Continuous Integration
- [XCTest UI Testing Available](https://developer.apple.com/documentation/xctest/xct_ui_testing_available): Indicates whether UI testing is available.