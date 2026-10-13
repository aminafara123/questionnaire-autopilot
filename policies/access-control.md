# Access Control Policy

## Purpose and Scope
This policy defines how Acme Cloud Inc. controls access to production systems,
corporate applications, and customer data. It applies to all employees,
contractors, and automated service accounts.

## Authentication and Multi-Factor Authentication
All access to production systems, cloud consoles, and the corporate identity
provider requires multi-factor authentication (MFA). MFA uses time-based
one-time passwords (TOTP) or FIDO2 security keys. Passwords must be at least
14 characters, are stored only as salted hashes, and SSO is enforced through
the central identity provider.

## Role-Based Access and Least Privilege
Access is granted on a role-based (RBAC) and least-privilege basis. Engineers
receive only the permissions required for their role, and standing access to
production is minimized in favour of just-in-time, time-bound elevation that is
logged and approved by a manager.

## Access Reviews and Deprovisioning
User access is reviewed quarterly by system owners, and privileged access is
reviewed monthly. When an employee or contractor leaves or changes role, all
associated accounts and credentials are revoked within 24 hours through the
automated joiner-mover-leaver workflow.
