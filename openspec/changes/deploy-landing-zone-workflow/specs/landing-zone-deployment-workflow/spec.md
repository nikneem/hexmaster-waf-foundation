## ADDED Requirements

### Requirement: The repository SHALL provide a GitHub Actions workflow for landing-zone deployment
The repository SHALL provide a GitHub Actions workflow that targets the landing-zone Bicep entrypoint and orchestrates infrastructure deployment through explicit validation, preview, and deployment behavior.

#### Scenario: A deployment workflow is invoked
- **WHEN** an authorized workflow run is triggered for the landing zone
- **THEN** the workflow operates against the repository's defined landing-zone deployment entrypoint rather than ad hoc individual resource commands

### Requirement: The workflow MUST perform validation before deployment
The landing-zone deployment workflow MUST validate the Bicep source and deployment inputs before executing an Azure deployment operation.

#### Scenario: A deployment run starts
- **WHEN** the workflow begins a deployment path
- **THEN** it performs validation steps before any infrastructure changes are applied

### Requirement: The workflow MUST support a preview step for infrastructure changes
The landing-zone deployment workflow MUST provide a preview or what-if style step so operators can inspect infrastructure impact before deployment.

#### Scenario: A change is prepared for deployment
- **WHEN** the workflow reaches the preview stage
- **THEN** it generates reviewable output describing the intended infrastructure changes

### Requirement: The workflow SHALL support bootstrap deployment before self-hosted runners exist
The landing-zone deployment workflow SHALL support an initial deployment path that does not require the platform's own self-hosted ACA Jobs runner capability to already exist.

#### Scenario: The landing zone is deployed for the first time
- **WHEN** the platform has not yet provisioned its own self-hosted runner resources
- **THEN** the workflow can still execute through a supported bootstrap runner path
