# https://developer.apple.com/documentation/security llms.txt

## Core Security Framework

- [Security Framework](https://developer.apple.com/documentation/security): Secure the data your app manages, and control access to your app.
- [Security Updates](https://developer.apple.com/documentation/Updates/Security): Learn about important changes to Security.
- [Security Framework Result Codes](https://developer.apple.com/documentation/security/security-framework-result-codes): Evaluate result codes common to many Security framework functions.

## Keychain Services

- [Keychain Services](https://developer.apple.com/documentation/security/keychain-services): Securely store small chunks of data on behalf of the user.
- [Storing Keys in the Keychain](https://developer.apple.com/documentation/security/storing-keys-in-the-keychain): Store cryptographic keys in the keychain for enhanced security.
- [kSecClass](https://developer.apple.com/documentation/security/ksecclass): A key for specifying the item class in keychain operations.
- [kSecClassGenericPassword](https://developer.apple.com/documentation/security/ksecclassgenericpassword): A generic password item class for keychain storage.
- [kSecClassInternetPassword](https://developer.apple.com/documentation/security/ksecclassinternetpassword): An internet password item class for keychain storage.
- [kSecClassCertificate](https://developer.apple.com/documentation/security/ksecclasscertificate): A certificate item class for keychain storage.
- [kSecClassKey](https://developer.apple.com/documentation/security/ksecclasskey): A cryptographic key item class for keychain storage.
- [kSecClassIdentity](https://developer.apple.com/documentation/security/ksecclassidentity): An identity item class combining a certificate and private key.
- [kSecAttrAccessible](https://developer.apple.com/documentation/security/ksecattraccessible): Specifies when a keychain item is accessible.
- [kSecAttrAccessibleWhenUnlocked](https://developer.apple.com/documentation/security/ksecattraccessiblewhenunlocked): Item accessible only while device is unlocked.
- [kSecAttrAccessibleWhenUnlockedThisDeviceOnly](https://developer.apple.com/documentation/security/ksecattraccessiblewhenunlockedthisdeviceonly): Item accessible only while device is unlocked and only on this device.
- [kSecAttrAccessibleAfterFirstUnlock](https://developer.apple.com/documentation/security/ksecattraccessibleafterfirstunlock): Item accessible after first unlock until next restart.
- [kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly](https://developer.apple.com/documentation/security/ksecattraccessibleafterfirstunlockthisdeviceonly): Item accessible after first unlock until next restart, only on this device.
- [kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly](https://developer.apple.com/documentation/security/ksecattraccessiblewhenpasscodesetthisdeviceonly): Item accessible when device is unlocked and passcode is set.
- [kSecUseUserIndependentKeychain](https://developer.apple.com/documentation/security/ksecuseuserindependentkeychain): Use keychain items that are user-independent.
- [SecKeychainAddGenericPassword](https://developer.apple.com/documentation/security/seckeychainaddgenericpassword): Add a generic password to the keychain.
- [SecKeychainFindGenericPassword](https://developer.apple.com/documentation/security/seckeychainfindgenericpassword): Find a generic password in the keychain.
- [SecKeychainItemModifyContent](https://developer.apple.com/documentation/security/seckeychainitemmodifycontent): Modify the contents of a keychain item.
- [SecKeychainItemDelete](https://developer.apple.com/documentation/security/seckeychainitemdelete): Delete a keychain item.

## Biometric Authentication & Secure Enclave

- [Protecting Keys with the Secure Enclave](https://developer.apple.com/documentation/security/protecting-keys-with-the-secure-enclave): Create an extra layer of security for your private keys.
- [kSecAttrTokenIDSecureEnclave](https://developer.apple.com/documentation/security/ksecattrtokenidsecureenclave): Token ID for Secure Enclave operations.
- [SecAccessControlCreateWithFlags](https://developer.apple.com/documentation/security/secaccesscontrolcreatewithflags): Create an access control object with protection parameters.
- [kSecAccessControlBiometryAny](https://developer.apple.com/documentation/security/secaccesscontrolcreateflags/biometryany): Constraint to access an item with Touch ID or Face ID.
- [kSecAccessControlBiometryCurrentSet](https://developer.apple.com/documentation/security/secaccesscontrolcreateflags/biometrycurrentset): Constraint to access an item with currently enrolled biometric set.
- [kSecAccessControlUserPresence](https://developer.apple.com/documentation/security/secaccesscontrolcreateflags/userpresence): Constraint requiring user presence via biometrics or passcode.
- [kSecAccessControlDevicePasscode](https://developer.apple.com/documentation/security/secaccesscontrolcreateflags/devicepasscode): Constraint to access an item with device passcode.
- [kSecAccessControlPrivateKeyUsage](https://developer.apple.com/documentation/security/secaccesscontrolcreateflags/privatekeyusage): Enable private key operations inside Secure Enclave.
- [kSecAttrAccessControl](https://developer.apple.com/documentation/security/ksecattraccesscontrol): Access control settings for keychain items.
- [errSecAuthFailed](https://developer.apple.com/documentation/security/errsecauthfailed): Authentication failed error code.
- [errSecUserCanceled](https://developer.apple.com/documentation/security/errsecusercanceled): User canceled authentication.
- [LocalAuthentication Framework](https://developer.apple.com/documentation/localauthentication): Authenticate users with biometrics or device passcode.

## Encryption and Cryptography

- [Certificate, Key, and Trust Services](https://developer.apple.com/documentation/security/certificate-key-and-trust-services): Establish trust using certificates and cryptographic keys.
- [Generating New Cryptographic Keys](https://developer.apple.com/documentation/security/generating-new-cryptographic-keys): Create both asymmetric and symmetric cryptographic keys.
- [SecKeyCreateRandomKey](https://developer.apple.com/documentation/security/seckeycreaterandomkey): Generate a new cryptographic key pair.
- [SecKeyCreateWithData](https://developer.apple.com/documentation/security/seckeycreatewithdata): Create a key from key data.
- [SecKeyCopyPublicKey](https://developer.apple.com/documentation/security/seckeycopypublickey): Get the public key from a private key reference.
- [SecKeyCreateEncryptedData](https://developer.apple.com/documentation/security/seckeycreateencrypteddata): Encrypt data using a public key.
- [SecKeyCreateDecryptedData](https://developer.apple.com/documentation/security/seckeycreatedecrypteddata): Decrypt data using a private key.
- [SecKeyCreateSignature](https://developer.apple.com/documentation/security/seckeycreatesi
- [SecKeyVerifySignature](https://developer.apple.com/documentation/security/seckeyverifysignature): Verify a digital signature.
- [kSecAttrKeyType](https://developer.apple.com/documentation/security/ksecattrkeytype): Specify the type of cryptographic key.
- [kSecAttrKeyTypeRSA](https://developer.apple.com/documentation/security/ksecattrkeytypesa): RSA key type.
- [kSecAttrKeyTypeECSECPrimeRandom](https://developer.apple.com/documentation/security/ksecattrkeytype/ksecattrkeytypeecsecprimerandom): Elliptic curve key type.
- [kSecAttrKeySizeInBits](https://developer.apple.com/documentation/security/ksecattrkeysizeinbits): Specify key size in bits.
- [Complying with Encryption Export Regulations](https://developer.apple.com/documentation/security/complying-with-encryption-export-regulations): Declare the use of encryption in your app.
- [Cryptographic Message Syntax Services](https://developer.apple.com/documentation/security/cryptographic-message-syntax-services): Sign and encrypt S/MIME messages.
- [Randomization Services](https://developer.apple.com/documentation/security/randomization-services): Generate cryptographically secure random numbers.
- [SecRandomCopyBytes](https://developer.apple.com/documentation/security/secrandomcopybytes): Generate cryptographically secure random bytes.
- [Security Transforms](https://developer.apple.com/documentation/security/security-transforms): Perform cryptographic functions like encoding and encryption.

## Certificate Handling

- [SecCertificateCreateWithData](https://developer.apple.com/documentation/security/seccertificatecreatewithdata): Create a certificate from DER data.
- [SecCertificateCopyData](https://developer.apple.com/documentation/security/seccertificatecopydata): Get the DER representation of a certificate.
- [SecCertificateCopyPublicKey](https://developer.apple.com/documentation/security/seccertificatecopypublickey): Extract the public key from a certificate.
- [SecCertificateCopyCommonName](https://developer.apple.com/documentation/security/seccertificatecopycommonname): Get the common name from a certificate.
- [SecCertificateCopyEmailAddresses](https://developer.apple.com/documentation/security/seccertificatecopyemailaddresses): Get email addresses from a certificate.
- [SecCertificateCopySerialNumberData](https://developer.apple.com/documentation/security/seccertificatecopyserialnumberdata): Get the serial number from a certificate.
- [SecTrustCreateWithCertificates](https://developer.apple.com/documentation/security/sectrustcreatewithcertificates): Create a trust object to verify certificates.
- [SecTrustEvaluateAsync](https://developer.apple.com/documentation/security/sectrustevaluateasync): Asynchronously evaluate trust.
- [SecTrustEvaluateWithError](https://developer.apple.com/documentation/security/sectrustevaluatewitherror): Synchronously evaluate trust with error information.
- [SecTrustGetCertificateCount](https://developer.apple.com/documentation/security/sectrustgetcertificatecount): Get the number of certificates in a trust object.
- [SecTrustGetCertificateAtIndex](https://developer.apple.com/documentation/security/sectrustgetcertificateatindex): Get a specific certificate from a trust object.
- [SecTrustSetAnchorCertificates](https://developer.apple.com/documentation/security/sectrustsetanchorcertificates): Set custom anchor certificates for trust evaluation.
- [SecTrustSetPolicies](https://developer.apple.com/documentation/security/sectrustsetpolicies): Set policies for trust evaluation.
- [SecPolicyCreateSSL](https://developer.apple.com/documentation/security/secpolicycreatessl): Create an SSL policy for certificate verification.
- [SecPolicyCreateBasicX509](https://developer.apple.com/documentation/security/secpolicycreatebasicx509): Create a basic X.509 policy.

## Code Signing

- [Code Signing Services](https://developer.apple.com/documentation/security/code-signing-services): Examine and validate signed code running on the system.
- [SecCodeCheckValidity](https://developer.apple.com/documentation/security/seccodecheckvalidity): Verify code signature validity.
- [SecStaticCodeCheckValidity](https://developer.apple.com/documentation/security/secstaticcodecheckvalidity): Verify static code signature.
- [SecCodeCopySelf](https://developer.apple.com/documentation/security/seccodeself): Get a code object for the running process.
- [SecCodeCopySigningInformation](https://developer.apple.com/documentation/security/seccodecopy): Get signing information from code.
- [kSecCodeInfoCertificates](https://developer.apple.com/documentation/security/kseccodeinfocertificates): Get certificates from code signing information.
- [kSecCodeInfoTeamIdentifier](https://developer.apple.com/documentation/security/kseccodeinfoteamidentifier): Get team identifier from code signing.
- [kSecCodeInfoIdentifier](https://developer.apple.com/documentation/security/kseccodeinfoidentifier): Get code signing identifier.
- [kSecCodeInfoRequirementData](https://developer.apple.com/documentation/security/kseccodeinforequirementdata): Get designated requirement data.
- [SecRequirementCreateWithString](https://developer.apple.com/documentation/security/secrequirementcreatewithstring): Create a requirement from a text string.
- [Notarizing macOS Software Before Distribution](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution): Submit software to Apple for notarization.
- [Using the Latest Code Signature Format](https://developer.apple.com/documentation/Xcode/using-the-latest-code-signature-format): Update legacy app code signatures.
- [TN3125: Inside Code Signing: Provisioning Profiles](https://developer.apple.com/documentation/Technotes/tn3125-inside-code-signing-provisioning-profiles): Learn how provisioning profiles enable third-party code.

## App Transport Security

- [Preventing Insecure Network Connections](https://developer.apple.com/documentation/security/preventing-insecure-network-connections): Enforce secure network links with App Transport Security.
- [NSAppTransportSecurity](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity): Configure ATS in your Info.plist.
- [NSAllowsArbitraryLoads](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsallowsarbitraryloads): Disable ATS restrictions (not recommended).
- [NSAllowsArbitraryLoadsForMedia](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsallowsarbitraryloadsformedia): Allow insecure loads for media content.
- [NSAllowsArbitraryLoadsInWebContent](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsallowsarbitraryloadsinwebcontent): Allow insecure loads in web views.
- [NSExceptionDomains](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsexceptiondomains): Configure per-domain ATS exceptions.
- [NSRequiresCertificateTransparency](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsrequirescertificatetransparency): Require Certificate Transparency.
- [NSIncludesSubdomains](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsincludessubdomains): Apply exceptions to subdomains.
- [NSExceptionMinimumTLSVersion](https://developer.apple.com/documentation/bundleresources/information-property-list/nsapptransportsecurity/nsexceptionminimumtlsversion): Set minimum TLS version for exceptions.

## Data Protection

- [Data Protection](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy/encrypting-your-app-s-files): Encrypt your app's files automatically.
- [FileProtectionType](https://developer.apple.com/documentation/foundation/fileprotectiontype): File protection levels for data security.
- [NSFileProtectionComplete](https://developer.apple.com/documentation/foundation/fileprotectiontype/complete): File inaccessible when device is locked.
- [NSFileProtectionCompleteUnlessOpen](https://developer.apple.com/documentation/foundation/fileprotectiontype/completeunlessopen): File accessible if already open when device locks.
- [NSFileProtectionCompleteUntilFirstUserAuthentication](https://developer.apple.com/documentation/foundation/fileprotectiontype/completeuntilfirstuserauthentication): File accessible after first unlock.
- [NSFileProtectionNone](https://developer.apple.com/documentation/foundation/fileprotectiontype/none): No file protection (not recommended).
- [URLFileProtection](https://developer.apple.com/documentation/foundation/urlfileprotection): URL file protection levels.
- [NSDataWritingFileProtectionComplete](https://developer.apple.com/documentation/foundation/nsdata.writingoptions/fileprotectioncomplete): Write data with complete protection.
- [App Sandbox](https://developer.apple.com/documentation/security/app-sandbox): Restrict access to system resources.
- [Hardened Runtime](https://developer.apple.com/documentation/security/hardened-runtime): Manage security protections for macOS apps.

## Authentication and Authorization

- [Password AutoFill](https://developer.apple.com/documentation/security/password-autofill): Streamline login and onboarding procedures.
- [Shared Web Credentials](https://developer.apple.com/documentation/security/shared-web-credentials): Share credentials between iOS apps and websites.
- [Authorization Services](https://developer.apple.com/documentation/security/authorization-services): Access restricted areas of the operating system.
- [AuthorizationCreate](https://developer.apple.com/documentation/security/authorizationcreate): Create an authorization reference.
- [AuthorizationCopyRights](https://developer.apple.com/documentation/security/authorizationcopyrights): Request authorization for specific rights.
- [AuthorizationFree](https://developer.apple.com/documentation/security/authorizationfree): Free an authorization reference.
- [kAuthorizationRightExecute](https://developer.apple.com/documentation/security/kauthorizationrightexecute): Right to execute privileged operations.
- [kAuthorizationFlagInteractionAllowed](https://developer.apple.com/documentation/security/authorizationflags/kauthorizationflaginteractionallowed): Allow user interaction for authorization.
- [kAuthorizationFlagExtendRights](https://developer.apple.com/documentation/security/authorizationflags/kauthorizationflagextendrights): Extend existing authorization rights.
- [kAuthorizationFlagPreAuthorize](https://developer.apple.com/documentation/security/authorizationflags/kauthorizationflagpreauthorize): Pre-authorize without executing.
- [One-time Codes](https://developer.apple.com/documentation/security/one-time-codes): Streamline entry of authentication codes.
- [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession): Web-based authentication session.

## Network Security

- [Secure Transport](https://developer.apple.com/documentation/security/secure-transport): Legacy API for secure network communication.
- [Network Framework](https://developer.apple.com/documentation/network): Modern networking API with built-in security.
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession): High-level networking API with security features.
- [URLProtectionSpace](https://developer.apple.com/documentation/foundation/urlprotectionspace): Authentication requirements for server protection.
- [URLCredential](https://developer.apple.com/documentation/foundation/urlcredential): Authentication credentials for URL requests.
- [ServerTrustChallenge](https://developer.apple.com/documentation/foundation/urlsession/authchallengedisposition/useCredential): Handle server trust authentication challenges.
- [TLS Configuration](https://developer.apple.com/documentation/network/tls-security): Configure TLS settings for network connections.
- [Certificate Pinning](https://developer.apple.com/documentation/security/certificate-key-and-trust-services/trust/evaluating-a-trust-and-parsing-the-result): Implement certificate pinning for enhanced security.

## Additional Security Resources

- [Security Best Practices](https://developer.apple.com/documentation/security): Overview of security best practices for Apple platforms.
- [Common Crypto](https://developer.apple.com/security/cryptography/): Low-level cryptographic operations.
- [CryptoKit](https://developer.apple.com/documentation/cryptokit): Swift framework for cryptographic operations.
- [LocalAuthentication](https://developer.apple.com/documentation/localauthentication): Authenticate users with biometrics.
- [AuthenticationServices](https://developer.apple.com/documentation/authenticationservices): Web authentication and password management.
- [DeviceCheck](https://developer.apple.com/documentation/devicecheck): Reduce fraudulent use of your services.
- [App Attest](https://developer.apple.com/documentation/devicecheck/establishing-your-app-s-integrity): Verify app integrity.
- [Privacy](https://developer.apple.com/documentation/privacy): Protect user privacy in your app.