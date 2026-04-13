## ADDED Requirements

### Requirement: The workflow SHALL publish deployment summaries for operators
The landing-zone deployment workflow SHALL publish a human-readable summary of validation, preview, deployment, and verification outcomes so operators can quickly understand what happened in a run.

#### Scenario: A workflow run completes a deployment path
- **WHEN** the workflow reaches the end of a run
- **THEN** it emits an operator-readable summary of the deployment outcome and key outputs

### Requirement: The workflow MUST preserve deployment evidence
The landing-zone deployment workflow MUST retain the key preview and deployment outputs needed to review or troubleshoot a run.

#### Scenario: A deployment run generates preview or output data
- **WHEN** the workflow produces deployment evidence
- **THEN** that evidence is preserved in a reviewable form for the run

### Requirement: The workflow MUST execute post-deploy verification
The landing-zone deployment workflow MUST perform post-deploy verification checks against the landing-zone deployment outcome before reporting success.

#### Scenario: A deployment operation reports success
- **WHEN** the workflow enters its verification stage
- **THEN** it executes defined checks against the deployed landing-zone resources

### Requirement: The workflow SHALL provide operator-facing diagnostics guidance
The landing-zone deployment workflow SHALL provide enough output or references that an operator can begin troubleshooting failed or degraded infrastructure changes without reconstructing the deployment context manually.

#### Scenario: A deployment or verification step fails
- **WHEN** the workflow reports a failure
- **THEN** it includes operator-facing diagnostics guidance or references tied to the failed deployment context
