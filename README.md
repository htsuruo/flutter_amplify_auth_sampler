# flutter_amplify_auth_sampler

- [Set up Amplify Auth - Flutter - AWS Amplify Documentation](https://docs.amplify.aws/flutter/build-a-backend/auth/set-up-auth/)
- [Set up Amplify CLI - JavaScript - AWS Amplify Documentation](https://docs.amplify.aws/javascript/tools/cli/start/set-up-cli/#configure-the-amplify-cli)
- [Platform setup - Flutter - AWS Amplify Documentation](https://docs.amplify.aws/flutter/start/project-setup/platform-setup/)

## Platform setup

For more details, see [documentation](https://docs.amplify.aws/flutter/start/project-setup/platform-setup/).

1. Support macOS minimum deployment target for 10.15 or higher because `amplify_auth_cognito` plugin occurs error if lower target as follows.

> Specs satisfying the `(amplify_auth_cognito`)` dependency were found, but they required a higher minimum deployment target.

2. Add "Keychain Sharing" Capability to use the Data Protection Keychain.

> flutter: An error occurred configuring Amplify: WorkerBeeExceptionImpl {
  error=SecureStorageException(message: Could not access the items in the keychain due to a missing entitlement., recoverySuggestion: Ensure that you have followed the step to enable Keychain Sharing in the platform setup steps for macOS, See: https://docs.amplify.aws/lib/project-setup/platform-setup/q/platform/flutter/#macos for details., underlyingException: SecurityFrameworkError: {code: -34018, message: A required entitlement isn't present.}),
