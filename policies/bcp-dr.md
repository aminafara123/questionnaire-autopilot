# Business Continuity and Disaster Recovery Policy

## Business Continuity Plan
Acme Cloud Inc. maintains a business continuity plan (BCP) that identifies
critical services, dependencies, and recovery priorities. The BCP is reviewed
annually and after any major change to the production environment.

## Recovery Objectives
The recovery time objective (RTO) for critical customer-facing services is 4
hours. The recovery point objective (RPO) is 1 hour, meaning at most one hour of
data may be lost in a disaster scenario. Objectives are validated during recovery
testing.

## Backups
Encrypted backups of customer data are performed daily, with transaction log
backups every hour. Backups are stored in a geographically separate region.
Backup restoration is tested at least quarterly to confirm integrity and that
recovery objectives can be met.

## Disaster Recovery Testing
A full disaster recovery exercise is conducted at least annually, simulating the
loss of a primary region and failover to a secondary region. Results and
corrective actions are documented.
