# Encryption and Key Management Policy

## Encryption in Transit
All data transmitted over public networks is encrypted using TLS 1.2 or higher.
Legacy protocols (SSL, TLS 1.0, TLS 1.1) are disabled. Internal service-to-service
traffic uses mutual TLS.

## Encryption at Rest
All customer data at rest is encrypted using AES-256. This includes primary
databases, object storage, backups, and disk volumes. Encryption at rest is
enabled by default on all managed storage services.

## Key Management and Rotation
Encryption keys are managed in a cloud Key Management Service (KMS) with hardware
security module (HSM) backing. Keys are rotated automatically at least every 12
months, access to keys is restricted by IAM policy and logged, and key material
is never stored in source code or configuration files.
