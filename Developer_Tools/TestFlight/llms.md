# TestFlight Documentation

## Overview

TestFlight makes it easy for testers to give feedback on your apps, games, and App Clips across Apple platforms before you publish. TestFlight lets you distribute beta builds of your app, manage beta testers, and collect feedback through App Store Connect.

**Key Benefits:**
- Beta testing made simple across all Apple platforms
- Share your beta with just your team, or the public
- Distribute up to 100 builds and test multiple builds at once
- No need to track UDIDs or provision tester profiles
- Integrated feedback collection with screenshots and crash reports

## Getting Started with TestFlight

### Prerequisites
- Join the Apple Developer Program
- Have an app in App Store Connect
- Create an archive of your app in Xcode

### Initial Setup Steps

1. **Access TestFlight in App Store Connect**
   - Go to the Apps section of App Store Connect
   - Select the app, game, or App Clip you want to test
   - Select the TestFlight tab

2. **Provide Test Information**
   - Add test information that lets people know what to test
   - Provide an email address for monitoring tester feedback
   - Enter beta app description (required for external testers)
   - Provide beta app review information (required for external testers)

3. **Upload Your Build**
   - Upload a beta build from Xcode to App Store Connect
   - You can share up to 100 builds
   - Test multiple builds at once
   - Builds are available for testing for up to 90 days

## Build Distribution Methods

### Creating Archives in Xcode

1. **Standard Archive Creation**
   - Choose a scheme and run destination in Xcode
   - Choose Product > Archive
   - Archive appears in the Archives organizer

2. **Distribution Options from Xcode**
   - **TestFlight & App Store**: Default settings for TestFlight and App Store submission
   - **TestFlight Internal Only**: Restricts access to your team only
   - **Release Testing**: For testing before release on registered devices
   - **Direct Distribution**: For macOS apps distributed outside App Store

### Build Management
- Builds include application identifiers within provisioning profiles
- Each build can be tested for up to 90 days
- Builds automatically expire after 90 days unless submitted to App Store
- You can manually expire builds to stop testing

## Internal vs External Testing

### Internal Testing

**Overview:**
- For App Store Connect users with access to your content
- Up to 100 internal testers per app
- Includes Account Holder, Admin, App Manager, Developer, or Marketing roles

**Features:**
- No App Review required
- Automatic distribution option available
- Immediate access to builds
- Access to all builds for 90 days

**Setting Up Internal Testing:**
1. Create an internal group
2. Enable/disable automatic distribution
3. Add App Store Connect users as testers
4. Add builds to the group
5. Testers receive email invitations

**Note:** Builds created by Xcode Cloud must be manually added to groups. Builds marked as "TestFlight Internal Only" can only be added to internal groups.

### External Testing

**Overview:**
- For testers outside your organization
- Up to 10,000 external testers per app
- Requires initial App Review approval

**Features:**
- First build requires full App Review
- Subsequent builds may not require full review
- Public link invitations available
- Email invitations supported
- Tester criteria filtering available

**Setting Up External Testing:**
1. Create an external group (requires existing internal group)
2. Add builds to the group
3. Submit first build for TestFlight App Review
4. Choose invitation method (email or public link)
5. Configure tester criteria if using public link

**App Review for External Testing:**
- Submit up to 6 builds within 24 hours
- First build requires full review
- Apple reviews build and metadata
- Admin users receive approval notification
- Rejected builds show status in App Review section

## Test Groups

### Creating and Managing Groups

**Group Types:**
- **Internal Groups**: For team members with App Store Connect access
- **External Groups**: For beta testers outside your organization

**Group Features:**
- Organize testers by testing focus
- Distribute different builds to different groups
- View tester metrics and engagement
- Manage participation and access

### Group Configuration

1. **Automatic Distribution** (Internal Only)
   - Enable for automatic build delivery
   - New builds automatically sent to group members
   - Manual addition still required for Xcode Cloud builds

2. **Build Assignment**
   - Add one build at a time
   - Multiple builds can be added to a group
   - Different groups can test different builds
   - Remove builds from groups as needed

3. **Tester Management**
   - Add/remove testers at any time
   - View installation status
   - Track sessions and crashes
   - Resend invitations

## Build Distribution

### Distribution Methods

1. **Email Invitations**
   - Direct invitations to specific email addresses
   - Tester information visible in App Store Connect
   - Import testers from CSV files
   - Add existing testers from other groups

2. **Public Links**
   - Share via social media, messages, email
   - No email addresses required
   - Testers appear as anonymous unless they provide email
   - Can set tester limits (1-10,000)
   - Disable link when testing complete

### Public Link Features

**Tester Criteria Options:**
- **Open to Anyone**: No restrictions
- **Filter by Criteria**: 
  - Device type requirements
  - OS version requirements
  - Platform specifications

**Criteria Configuration:**
- Minimum OS version
- Maximum OS version
- Specific OS version range
- Platform-specific requirements

**Public Link Management:**
- View metrics (views, installations)
- Monitor criteria match rates
- Edit criteria after creation
- Set/change tester limits
- Disable/enable links

### Build Status and Notifications

**Automatic Notifications:**
- Enable "Automatically notify testers" when adding builds
- Testers notified when build approved
- No manual intervention required

**Manual Notifications:**
- Required if automatic notification not selected
- Navigate to Builds section
- Click "Notify Testers" for approved builds
- Status changes to "Testing"

## Feedback Collection

### Feedback Types

1. **Screenshot Feedback**
   - Testers take screenshots within app
   - Mark up images with annotations
   - Add written comments
   - Submit through TestFlight app

2. **Crash Reports**
   - Automatic crash report generation
   - Optional tester context/comments
   - Crash logs with symbolication
   - Device and OS information included

3. **General Comments**
   - Written feedback without screenshots
   - Submitted through TestFlight interface
   - Linked to specific builds and versions

### Viewing and Managing Feedback

**Access Feedback:**
1. Navigate to TestFlight tab in App Store Connect
2. Access Feedback section in sidebar
3. View Screenshots or Crashes

**Feedback Features:**
- Filter by platform, version, build, OS, device
- View detailed feedback information
- Download feedback as .zip files
- Open in Xcode for debugging
- Delete individual feedback items

**Feedback Details Include:**
- Tester information (if not anonymous)
- App version and build number
- Device model and OS version
- Timestamp and session data
- Screenshot or crash report

### Feedback Settings

**Disable/Enable Feedback:**
- Control per tester group
- Disable screenshot and crash feedback
- Email feedback always available
- Settings apply to all group members

**Note:** If tester belongs to multiple groups with different settings, most restrictive setting applies.

## App Store Connect Integration

### TestFlight Section Structure

**Main Components:**
1. **Test Information**
   - Beta app description
   - What to test notes
   - Feedback email
   - Marketing information

2. **Builds**
   - Platform-specific build lists
   - Version and build numbers
   - Upload status
   - Expiration dates

3. **Testers & Groups**
   - Internal testing groups
   - External testing groups
   - Group settings
   - Tester management

4. **Feedback**
   - Screenshots
   - Crashes
   - Filtering options
   - Export capabilities

### Build Management

**Build Properties:**
- Version string
- Build number
- Upload date
- Expiration date (90 days)
- Processing status
- Review status (external builds)

**Build Actions:**
- Add to groups
- Remove from groups
- Expire build
- Submit for review
- Notify testers

### Metrics and Analytics

**Available Metrics:**
- Number of testers
- Installation count
- Active sessions
- Crash frequency
- Feedback submissions
- Public link performance

**Tester Engagement Tracking:**
- Installation status
- Last activity
- Number of sessions
- Crashes per tester
- Feedback submitted

## Beta App Review

### Review Requirements

**When Review is Required:**
- First build for external testing
- Significant changes to app functionality
- Changes requiring new entitlements
- At Apple's discretion

**Review Process:**
1. Automatic submission when adding to external group
2. Review of build and metadata
3. Approval/rejection notification
4. Feedback provided if rejected

### Review Guidelines

**Required Information:**
- Beta app description
- What to test information
- Feedback email
- Contact information
- Beta app review notes (if needed)

**Common Rejection Reasons:**
- Incomplete metadata
- Guideline violations
- Technical issues
- Missing required information

### Appeals Process

If beta build is rejected:
1. Review rejection feedback in App Store Connect
2. Address identified issues
3. Submit updated build
4. Contact TestFlight App Review for appeals

## Advanced Features

### Testing In-App Purchases and Subscriptions

**Sandbox Testing:**
- Sign out of production Apple Account
- Use Sandbox Apple Account
- Access Developer settings
- Test purchase flows
- Verify subscription behaviors

### App Clip Testing

**App Clip Beta Testing:**
- Invite testers to test App Clip experience
- Test both app and App Clip
- Switch between app and clip
- Only one can be installed at a time
- Requires iOS 14/iPadOS 14 or later

### Platform-Specific Features

**TestFlight for Mac:**
- Requires Xcode 13 or later
- Available on Mac App Store
- Similar workflow to iOS
- Direct distribution option available

**visionOS Support:**
- Full TestFlight support
- Screenshot feedback available
- Standard testing workflow
- Platform-specific criteria

### Xcode Cloud Integration

**Build Distribution:**
- Automatic TestFlight distribution
- Configure in Xcode Cloud workflows
- Include tester notes
- Manage version numbers
- Post-build notifications

## Best Practices

### Planning Your Beta Test

1. **Define Testing Goals**
   - Identify features to test
   - Set testing timeline
   - Determine success criteria
   - Plan feedback collection

2. **Organize Tester Groups**
   - Create focused groups
   - Assign specific features
   - Consider platform requirements
   - Plan rollout strategy

3. **Prepare Test Information**
   - Clear testing instructions
   - Known issues list
   - Feature highlights
   - Feedback priorities

### Managing Your Beta Program

1. **Communication**
   - Regular updates to testers
   - Respond to feedback
   - Share progress updates
   - Thank active testers

2. **Build Strategy**
   - Regular build updates
   - Clear version numbering
   - Descriptive release notes
   - Timely bug fixes

3. **Feedback Management**
   - Review feedback regularly
   - Prioritize issues
   - Track resolution
   - Close feedback loop

### Transitioning to Release

1. **Final Testing Phase**
   - Feature freeze
   - Focus on stability
   - Address critical issues
   - Prepare for submission

2. **App Store Submission**
   - Use tested build
   - Complete App Store information
   - Submit for App Review
   - Monitor review status

## Troubleshooting

### Common Issues

**Build Not Appearing:**
- Check processing status
- Verify upload completion
- Confirm valid provisioning
- Check for build errors

**Testers Can't Install:**
- Verify device compatibility
- Check OS requirements
- Confirm invitation status
- Review device limits

**Feedback Not Showing:**
- Check feedback settings
- Verify TestFlight version
- Confirm tester permissions
- Review group settings

**Public Link Issues:**
- Check tester limit
- Verify criteria settings
- Monitor link status
- Review compatibility

### Support Resources

- TestFlight App Review: For beta review issues
- App Store Connect Help: For general support
- Developer Forums: For community assistance
- Technical Support: For technical issues