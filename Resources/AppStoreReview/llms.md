# Apple App Store Review Guidelines - LLM Documentation

## Overview

This document provides comprehensive guidance for Apple App Store app review, including guidelines, common rejection reasons, policies, and best practices for successful app submission.

Last Updated: June 9, 2025

## Table of Contents

1. [Core Principles](#core-principles)
2. [Before You Submit Checklist](#before-you-submit-checklist)
3. [Safety Guidelines](#1-safety)
4. [Performance Requirements](#2-performance)
5. [Business & Monetization](#3-business)
6. [Design Standards](#4-design)
7. [Legal Requirements](#5-legal)
8. [Common Rejection Reasons](#common-rejection-reasons)
9. [Privacy Requirements](#privacy-requirements)
10. [In-App Purchase Rules](#in-app-purchase-rules)
11. [Submission Best Practices](#submission-best-practices)
12. [Review Process](#review-process)

## Core Principles

The App Store is guided by these fundamental principles:
- Provide a safe experience for users to get apps
- Create opportunities for all developers to be successful
- Offer a highly curated App Store with expert review
- Scan apps for malware and security issues
- Maintain the safest platforms for consumers worldwide

### Alternative Distribution (EU)
In the European Union, developers can also:
- Distribute notarized iOS/iPadOS apps from alternative app marketplaces
- Distribute directly from their website
- Must still comply with Notarization Review Guidelines

## Before You Submit Checklist

Essential preparation steps to avoid delays or rejections:

### Technical Requirements
- [ ] Test your app thoroughly for crashes and bugs
- [ ] Test on actual devices, not just simulators
- [ ] Ensure all features function as intended
- [ ] Enable backend services for review
- [ ] Provide demo account credentials or demo mode
- [ ] Include detailed App Review notes explaining non-obvious features

### Metadata Requirements
- [ ] Complete and accurate app information
- [ ] Up-to-date contact information
- [ ] Accurate app description
- [ ] Representative screenshots and previews
- [ ] Proper age rating
- [ ] Clear privacy policy link

### Documentation Review
- [ ] SwiftUI/UIKit/AppKit guidelines
- [ ] Human Interface Guidelines
- [ ] Marketing Resources and Identity Guidelines
- [ ] Apple Trademark Guidelines

## 1. Safety

### 1.1 Objectionable Content
Apps must not include:
- Defamatory, discriminatory, or mean-spirited content
- Realistic portrayals of violence or torture
- Content encouraging illegal weapon use
- Sexual or pornographic material
- Inflammatory religious commentary
- False information or joke functionality
- Content capitalizing on tragic events

### 1.2 User-Generated Content
Apps with user content must include:
- Content filtering mechanisms
- Reporting functionality
- User blocking capabilities
- Published contact information
- Timely response to concerns

### 1.3 Kids Category
Requirements for apps targeting children:
- No external links without parental gate
- No purchasing opportunities outside parental gate
- Comply with children's privacy laws
- No third-party analytics or advertising
- Age-appropriate content throughout

### 1.4 Physical Harm
- Medical apps must provide accurate data with clear methodology
- Drug dosage calculators require official approval
- No promotion of tobacco, illegal drugs, or excessive alcohol
- DUI checkpoints only from law enforcement
- No activities risking physical harm

### 1.5 Developer Information
- Provide accurate, up-to-date contact information
- Include easy support access
- Classroom apps need clear contact methods
- Wallet passes need valid issuer information

### 1.6 Data Security
- Implement appropriate security measures
- Prevent unauthorized data access
- Follow Apple Developer Program License Agreement
- Protect user information properly

## 2. Performance

### 2.1 App Completeness
- Submit final versions only
- No placeholder content
- Fully functional URLs
- Test on-device before submission
- Include demo accounts
- Complete in-app purchases

### 2.2 Beta Testing
- Use TestFlight for beta versions
- No compensation for beta testing
- Comply with App Review Guidelines
- Submit significant updates for review

### 2.3 Accurate Metadata
- Clear, honest app descriptions
- Accurate screenshots showing actual app
- Appropriate category selection
- Honest age ratings
- Limited app names (30 characters)
- No keyword stuffing
- 4+ appropriate metadata

### 2.4 Hardware Compatibility
- iPhone apps should run on iPad
- Efficient power usage
- No cryptocurrency mining
- Apple TV apps work with Siri remote
- No unnecessary device restarts

### 2.5 Software Requirements
- Use only public APIs
- Self-contained apps
- No code downloading
- Proper multitasking usage
- IPv6 compatibility
- WebKit for web browsing
- Proper UI element behavior

## 3. Business

### 3.1 Payments

#### 3.1.1 In-App Purchase Required For:
- Unlocking features or functionality
- Subscriptions
- In-game currencies
- Premium content access
- Digital tips to developers
- Loot boxes (must disclose odds)
- Digital gift cards/vouchers
- NFT-related services

#### 3.1.2 Subscriptions
- Minimum 7-day periods
- Cross-device availability
- Ongoing value required
- Clear upgrade/downgrade paths
- Transparent pricing information

#### 3.1.3 Alternative Payment Methods Allowed:
- Reader apps (magazines, books, music, video)
- Multiplatform services
- Enterprise services
- Person-to-person services
- Physical goods/services
- Free companion apps

#### 3.1.4 Cryptocurrencies
- Wallet apps by organizations only
- No on-device mining
- Licensed exchanges only
- No rewards for app downloads

### 3.2 Other Business Rules

#### Acceptable:
- Promoting your own apps
- Curated third-party app collections
- Rental content expiration
- Wallet passes for payments/ID
- Free insurance apps
- Approved nonprofit fundraising
- Individual monetary gifts

#### Unacceptable:
- App Store-like interfaces
- Artificial ad impressions
- Unauthorized fundraising
- Location/carrier restrictions
- Binary options trading
- Predatory loans (>36% APR)

## 4. Design

### 4.1 Copycats
- Create original content
- Don't copy popular apps
- No impersonation
- Risk of program expulsion

### 4.2 Minimum Functionality
- More than a repackaged website
- Lasting entertainment/utility value
- Rich AR experiences
- Not just marketing material
- Self-contained functionality

### 4.3 Spam
- Single app per concept
- Avoid oversaturated categories
- No duplicate Bundle IDs
- Quality over quantity

### 4.4 Extensions
- Follow Extension Programming Guide
- Include functionality
- Clear disclosure
- No marketing in extensions

### 4.5 Apple Sites and Services
- Use approved RSS feeds only
- Follow Apple Music guidelines
- Respect Game Center terms
- Appropriate Push Notification use
- Don't spam Apple services

### 4.7 Third-Party Software
- HTML5 mini apps allowed
- Must follow privacy guidelines
- Content filtering required
- No native API exposure without permission

### 4.8 Login Services
If using third-party login, must also offer alternative that:
- Limits data to name/email
- Allows private email
- No advertising tracking

### 4.9 Apple Pay
- Provide purchase information
- Use correct branding
- Disclose recurring payment terms
- Include cancellation info

## 5. Legal

### 5.1 Privacy

#### 5.1.1 Data Collection and Storage
- **Privacy Policy Required**: Link in metadata and app
- **Must Include**:
  - What data is collected
  - How it's collected
  - All uses of data
  - Third-party protection
  - Retention/deletion policies
  - Consent withdrawal process

#### 5.1.2 Data Use and Sharing
- Obtain user permission first
- App Tracking Transparency required
- No repurposing without consent
- No user profiling from "anonymous" data
- No selling contact databases
- Apple Pay data restrictions

#### 5.1.3 Health Data
- No advertising use
- No false HealthKit data
- Research requires ethics approval
- Participant consent mandatory

#### 5.1.4 Kids' Privacy
- Follow COPPA/GDPR
- No third-party analytics/ads
- Parental consent requirements
- Limited data collection

#### 5.1.5 Location Services
- Directly relevant use only
- Explain purpose clearly
- User consent required
- No emergency services

### 5.2 Intellectual Property
- Original content only
- Proper licensing required
- No trademark infringement
- No illegal file sharing
- No media downloading without permission

### 5.3 Gaming, Gambling, and Lotteries
- Developer sponsorship required
- Official rules with Apple disclaimer
- Proper licensing for real money gaming
- Geo-restriction requirements
- No in-app purchase for gambling

### 5.4 VPN Apps
- Use NEVPNManager API
- Organization enrollment required
- Clear data use declaration
- No data selling to third parties
- Local law compliance

### 5.6 Developer Code of Conduct
- Treat everyone with respect
- No harassment or discrimination
- No fraudulent practices
- Maintain app quality
- Honest representation

## Common Rejection Reasons

### Top Causes for Rejection:

1. **Crashes and Bugs**
   - Incomplete testing
   - Device-specific issues
   - Memory management problems

2. **Broken Links and Placeholder Content**
   - Non-functional URLs
   - Lorem ipsum text
   - Coming soon features

3. **Inadequate Information**
   - Missing demo accounts
   - Unclear feature descriptions
   - Incomplete metadata

4. **Privacy Issues**
   - Missing privacy policy
   - Excessive data collection
   - No consent mechanisms

5. **Guideline 2.3 - Accurate Metadata**
   - Misleading descriptions
   - Inappropriate screenshots
   - Wrong age ratings

6. **Guideline 4.2 - Minimum Functionality**
   - Wrapper apps
   - Limited utility
   - Web views only

7. **In-App Purchase Violations**
   - External payment links
   - Missing restore functionality
   - Incorrect implementation

8. **Design Issues**
   - Poor user interface
   - Inconsistent navigation
   - Non-standard UI elements

## Privacy Requirements

### Data Collection Principles:
- **Minimization**: Only collect necessary data
- **Transparency**: Clear disclosure
- **User Control**: Easy opt-out
- **Purpose Limitation**: Use only as described
- **Security**: Protect stored data

### Required Disclosures:
- Data types collected
- Collection methods
- Usage purposes
- Third-party sharing
- Retention periods
- User rights

### Special Categories:
- Health data: Extra restrictions
- Children's data: Parental consent
- Financial data: Enhanced security
- Location data: Clear justification

## In-App Purchase Rules

### Must Use IAP For:
- Digital content/services
- Subscription features
- Virtual currencies
- Premium functionality
- One-time purchases
- Consumables

### IAP Not Required For:
- Physical goods
- Services outside app
- Person-to-person services
- Reader app content
- Business services

### Technical Requirements:
- Restore functionality
- Receipt validation
- Clear pricing display
- Subscription management
- Proper UI integration

### Subscription Rules:
- Auto-renewable options
- Free trial capabilities
- Family sharing support
- Cross-platform access
- Transparent terms

## Submission Best Practices

### Pre-Submission:
1. **Complete Development**
   - Feature complete
   - Thoroughly tested
   - Performance optimized

2. **Prepare Materials**
   - Screenshots for all devices
   - App preview videos
   - Compelling description
   - Keywords research

3. **Legal Compliance**
   - Privacy policy
   - Terms of service
   - License agreements
   - Age ratings

### During Submission:
1. **App Store Connect Setup**
   - Complete all fields
   - Upload builds
   - Configure pricing
   - Set availability

2. **Review Information**
   - Demo account details
   - Feature explanations
   - Special instructions
   - Contact information

3. **Testing Preparation**
   - Enable services
   - Activate servers
   - Provide test data
   - Document workflows

### Common Mistakes to Avoid:
- Incomplete features
- Placeholder content
- Missing privacy policy
- Incorrect pricing
- Poor screenshots
- Vague descriptions
- Technical issues

## Review Process

### Timeline:
- Most apps: 24-48 hours
- Complex apps: Longer
- Expedited review: Available for critical issues

### Status Tracking:
- Monitor in App Store Connect
- Email notifications
- Resolution center messages

### If Rejected:
1. **Understand the Issue**
   - Read feedback carefully
   - Check cited guidelines
   - Identify specific problems

2. **Resolution Options**
   - Fix and resubmit
   - Provide clarification
   - Request phone call
   - File appeal

3. **Communication**
   - Use Resolution Center
   - Be professional
   - Provide evidence
   - Explain thoroughly

### Appeals Process:
- Disagree with decision
- Believe misunderstanding
- Policy clarification needed
- Guideline interpretation

### Best Practices:
- Respond promptly
- Be specific
- Include examples
- Reference guidelines
- Stay professional

## Additional Resources

### Official Documentation:
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [App Store Connect Help](https://developer.apple.com/help/app-store-connect/)
- [Developer Program License Agreement](https://developer.apple.com/support/terms/)

### Support Channels:
- App Store Connect Resolution Center
- Developer Support
- Appeals Process
- Developer Forums

### Stay Updated:
- Review guideline updates
- Policy changes
- New requirements
- Platform updates

## Summary

Success in App Store review requires:
- Understanding and following all guidelines
- Thorough testing and quality assurance
- Complete and accurate information
- Respect for user privacy
- Original, valuable content
- Professional communication
- Continuous improvement

Remember: The goal is to create great apps that provide value to users while maintaining the high standards of the App Store ecosystem.