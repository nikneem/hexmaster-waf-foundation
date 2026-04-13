## Why

The landing-zone infrastructure is now defined in Bicep, but the repository still lacks a repeatable GitHub Actions workflow to validate, preview, deploy, and verify it. A dedicated workflow change is needed so the platform can be deployed safely with GitHub-native automation, Azure OIDC, and clear operational feedback.

## What Changes

- Define a GitHub Actions deployment workflow for the subscription-scope landing-zone Bicep entrypoint.
- Define secure Azure authentication and permission boundaries for the workflow.
- Define validation, preview, deployment, and verification behavior for infrastructure changes.
- Define operational outputs and guardrails so deployments are reviewable and supportable.

## Capabilities

### New Capabilities
- `landing-zone-deployment-workflow`: GitHub Actions orchestration for validating, previewing, and deploying the landing zone Bicep entrypoint.
- `workflow-identity-security`: OIDC, workflow permissions, action pinning, and Azure RBAC requirements for secure deployment automation.
- `deployment-verification-operations`: Post-deploy verification, summary output, artifacts, and operator-facing diagnostics for the deployment workflow.

### Modified Capabilities

## Impact

- `.github/workflows/`
- repository environments, variables, and workflow permissions
- Azure federated identity and RBAC assignments for deployment
- deployment operator experience and post-deploy troubleshooting
