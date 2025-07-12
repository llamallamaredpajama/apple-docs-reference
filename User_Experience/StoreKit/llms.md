# https://developer.apple.com/documentation/storekit llms.txt

## Core StoreKit Framework
- [StoreKit Framework](https://developer.apple.com/documentation/storekit): Support in-app purchases and subscription management in your apps.
- [Choosing a StoreKit API](https://developer.apple.com/documentation/storekit/choosing-a-storekit-api-for-in-app-purchases): Guide to selecting between StoreKit 2 and Original API.
- [StoreKit Views](https://developer.apple.com/documentation/storekit/storekit-views): Pre-built UI components for in-app purchase experiences.

## In-App Purchases
- [In-App Purchase Overview](https://developer.apple.com/documentation/storekit/in-app-purchase): Comprehensive guide to implementing in-app purchases.
- [Getting Started with In-App Purchase](https://developer.apple.com/documentation/storekit/getting-started-with-in-app-purchases-using-storekit-views): Quick start guide using StoreKit views.
- [Implementing a Store in Your App](https://developer.apple.com/documentation/storekit/implementing-a-store-in-your-app-using-the-storekit-api): Build a complete in-app store experience.
- [Unlocking Purchased Content](https://developer.apple.com/documentation/storekit/unlocking-purchased-content): Enable app functionality after purchase completion.

## StoreKit 2 APIs
- [Product Class](https://developer.apple.com/documentation/storekit/product): StoreKit 2 class representing purchasable products.
- [Product.purchase(options:)](https://developer.apple.com/documentation/storekit/product/purchase(options:)): Initiate a purchase with StoreKit 2.
- [Product.products(for:)](https://developer.apple.com/documentation/storekit/product/products(for:)): Fetch product information using StoreKit 2.
- [Fetching Product Information](https://developer.apple.com/documentation/storekit/fetching-product-information-from-the-app-store): Load product details from App Store.

## Transaction Management
- [Transaction Class](https://developer.apple.com/documentation/storekit/transaction): StoreKit 2 transaction handling and verification.
- [Transaction.all](https://developer.apple.com/documentation/storekit/transaction/all): Access all transactions for your app.
- [Transaction.currentEntitlements](https://developer.apple.com/documentation/storekit/transaction/currententitlements): Get current active entitlements.
- [Finishing a Transaction](https://developer.apple.com/documentation/storekit/finishing-a-transaction): Complete transaction processing.
- [Testing Transaction Observer Code](https://developer.apple.com/documentation/storekit/testing-transaction-observer-code): Verify transaction handling implementation.

## Subscriptions
- [Subscriptions and Offers](https://developer.apple.com/documentation/storekit/subscriptions-and-offers): Manage subscription products and promotional offers.
- [Handling Subscriptions Billing](https://developer.apple.com/documentation/storekit/handling-subscriptions-billing): Process subscription lifecycle events.
- [Offering a Subscription Across Multiple Apps](https://developer.apple.com/documentation/storekit/offering-a-subscription-across-multiple-apps): Share subscriptions between your apps.
- [Testing Subscription Renewals](https://developer.apple.com/documentation/storekit/testing-failing-subscription-renewals-and-in-app-purchases): Verify renewal and failure scenarios.
- [Testing Disabling Auto-Renew](https://developer.apple.com/documentation/storekit/testing-disabling-auto-renew): Handle subscription cancellations.

## Receipt Validation
- [Validating Receipts with App Store](https://developer.apple.com/documentation/storekit/validating-receipts-with-the-app-store): Server-side receipt validation guide.
- [SKReceiptRefreshRequest](https://developer.apple.com/documentation/storekit/skreceiptrefreshrequest): Request updated receipt from App Store.
- [Receipt Properties](https://developer.apple.com/documentation/storekit/skreceiptrefreshrequest/receiptproperties): Configure receipt refresh requests.
- [Testing App Store Server Notifications](https://developer.apple.com/documentation/storekit/testing-app-store-server-notifications): Verify server notification handling.
- [Enabling App Store Server Notifications](https://developer.apple.com/documentation/storekit/enabling-app-store-server-notifications): Set up real-time transaction updates.

## Offer Codes and Promotions
- [Implementing Offer Codes](https://developer.apple.com/documentation/storekit/implementing-offer-codes-in-your-app): Support subscription offer codes.
- [SKPaymentDiscount](https://developer.apple.com/documentation/storekit/skpaymentdiscount): Apply promotional offers to payments.
- [Payment Discount Timestamp](https://developer.apple.com/documentation/storekit/skpaymentdiscount/timestamp): Validate offer code timing.
- [Testing Offer Codes](https://developer.apple.com/documentation/storekit/testing-purchases-made-outside-your-app): Verify offer code redemption.

## Family Sharing
- [Supporting Family Sharing](https://developer.apple.com/documentation/storekit/supporting-family-sharing-in-your-app): Enable purchase sharing for families.
- [Testing Family Sharing](https://developer.apple.com/documentation/storekit/testing-in-app-purchases-with-sandbox): Verify family sharing functionality.
- [Revoked Entitlements](https://developer.apple.com/documentation/storekit/skpaymenttransactionobserver/paymentqueue(_:didrevokeentitlementsforproductidentifiers:)): Handle revoked family shared purchases.

## Product Configuration
- [Payment Queue](https://developer.apple.com/documentation/storekit/skpaymentqueue): Manage payment processing queue.
- [Payment Transaction Observer](https://developer.apple.com/documentation/storekit/skpaymenttransactionobserver): Monitor transaction state changes.
- [Mutable Payment](https://developer.apple.com/documentation/storekit/skmutablepayment): Configure payment requests.
- [Payment Transaction States](https://developer.apple.com/documentation/storekit/skpaymenttransactionstate): Track purchase progress states.
- [Purchased State](https://developer.apple.com/documentation/storekit/skpaymenttransactionstate/purchased): Handle successful purchases.
- [Deferred State](https://developer.apple.com/documentation/storekit/skpaymenttransactionstate/deferred): Manage pending family approvals.

## Testing and Sandbox
- [Testing In-App Purchases with Sandbox](https://developer.apple.com/documentation/storekit/testing-in-app-purchases-with-sandbox): Complete sandbox testing guide.
- [Testing Interrupted Purchases](https://developer.apple.com/documentation/storekit/testing-an-interrupted-purchase): Handle incomplete transactions.
- [Testing Purchases Outside App](https://developer.apple.com/documentation/storekit/testing-purchases-made-outside-your-app): Verify App Store-initiated purchases.

## Original StoreKit API
- [Original API for In-App Purchase](https://developer.apple.com/documentation/storekit/original-api-for-in-app-purchase): Legacy StoreKit implementation guide.

## External Purchases
- [External Purchase](https://developer.apple.com/documentation/storekit/external-purchase): Support purchases from outside the app.

## SKAdNetwork
- [SKAdNetwork](https://developer.apple.com/documentation/storekit/skadnetwork): Ad attribution framework for iOS apps.

## Additional Resources
For comprehensive API reference and implementation details, visit:
- StoreKit Documentation: https://developer.apple.com/documentation/storekit
- App Store Connect Help: https://help.apple.com/app-store-connect/
- WWDC Sessions: https://developer.apple.com/wwdc/