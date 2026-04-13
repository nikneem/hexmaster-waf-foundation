## ADDED Requirements

### Requirement: The workflow MUST authenticate to Azure using federated identity
The landing-zone deployment workflow MUST use GitHub OIDC or an equivalent federated identity model for Azure authentication so that long-lived Azure secrets are not required for the normal deployment path.

#### Scenario: A workflow job needs Azure access
- **WHEN** a deployment job authenticates to Azure
- **THEN** it uses the workflow's federated identity configuration rather than a stored client secret as the primary mechanism

### Requirement: The workflow MUST use least-privilege permissions
The landing-zone deployment workflow MUST define GitHub and Azure permissions with the minimum scope required for the deployment stages it performs.

#### Scenario: Workflow permissions are configured
- **WHEN** the workflow or its jobs request permissions
- **THEN** those permissions are limited to the minimum required for the job's purpose

### Requirement: External actions MUST be pinned immutably
The landing-zone deployment workflow MUST reference external GitHub Actions through immutable versions so workflow execution is not dependent on mutable tags or branches.

#### Scenario: The workflow uses a reusable action
- **WHEN** the workflow references an external action
- **THEN** that action is pinned to an immutable revision

### Requirement: Deployment identities MUST remain distinct from runtime and operator identities
The landing-zone deployment workflow MUST preserve identity separation between deployment automation, runtime platform resources, and human operators.

#### Scenario: Access is granted for deployment
- **WHEN** Azure permissions are assigned for the workflow
- **THEN** those permissions are scoped to deployment automation and are not shared with runtime services or operator break-glass access
