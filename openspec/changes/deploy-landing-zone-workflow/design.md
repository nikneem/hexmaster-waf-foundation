## Context

The repository now contains a subscription-scope Bicep entrypoint for the landing zone under `infra/landing-zone/main.bicep`, plus module structure for governance, connectivity, shared services, runner execution, and workload spokes. What is missing is the GitHub Actions workflow that can validate and deploy that infrastructure consistently.

The workflow must support a safe bootstrap path before the self-hosted VMSS runner platform exists. It must also align with the repository's security and cost posture: GitHub OIDC over static credentials, least-privilege permissions, immutable action pinning, readable deployment stages, and supportable post-deploy feedback.

## Goals / Non-Goals

**Goals:**
- Define a GitHub Actions workflow that validates, previews, deploys, and verifies the landing-zone Bicep entrypoint.
- Make the workflow usable before the platform's own self-hosted runner capability is available.
- Use GitHub OIDC and least-privilege Azure RBAC for deployment authentication.
- Produce clear deployment summaries, artifacts, and post-deploy verification guidance for operators.
- Keep the workflow aligned with the low-cost, hub-and-spoke landing-zone design already implemented in `infra/`.

**Non-Goals:**
- Changing the landing-zone network or platform architecture itself.
- Replacing the Bicep deployment model with another IaC system.
- Defining workload-specific application delivery pipelines.
- Introducing long-lived Azure credentials as the primary deployment path.

## Decisions

### Use a staged GitHub Actions workflow

The workflow should separate validation, preview, deploy, and verify concerns into explicit jobs or stages so infrastructure changes are easier to review and troubleshoot.

Alternatives considered:
- Single monolithic deploy job: simpler to author, but harder to audit and troubleshoot.
- Multiple disjoint workflows: more flexible, but increases coordination and configuration overhead.

### Bootstrap on GitHub-hosted runners first

The workflow should default to GitHub-hosted runners for bootstrap and early platform deployment. The self-hosted VMSS runner platform is part of the landing zone and therefore cannot be assumed to exist before the workflow first provisions it.

Alternatives considered:
- Require self-hosted runners from day one: circular dependency for initial deployment.

### Authenticate to Azure with GitHub OIDC

The workflow should use workload identity federation to Azure so it can deploy without storing long-lived client secrets in the repository.

Alternatives considered:
- Static service principal secrets: easier to set up initially, but weaker operational and security posture.

### Keep permissions and action references explicit

The workflow should use least-privilege permissions at workflow and job scope, and pin actions to immutable SHAs. This keeps deployment automation aligned with supply-chain and privilege-minimization goals.

Alternatives considered:
- Broad default permissions and version-tag action references: faster to author, but weaker and less predictable.

### Target the subscription-scope landing-zone entrypoint

The main deployment workflow should target `infra/landing-zone/main.bicep` and the selected parameter file or files that describe a deployment environment. It should also support preview and deploy operations for workload spoke onboarding inputs where those are modeled through parameters.

Alternatives considered:
- Per-module deployment workflows: finer-grained, but less aligned with the repository's current top-level deployment model.

### Include post-deploy verification and operator summaries

The workflow should produce structured summaries, preserve preview output, and run basic post-deploy checks so operators can understand what changed and how to investigate failures.

Alternatives considered:
- Rely only on Azure deployment success/failure exit codes: simpler, but not sufficient for operational clarity.

## Risks / Trade-offs

- **Bootstrap and steady-state runner models differ** -> Keep bootstrap execution on GitHub-hosted runners and treat self-hosted VMSS runners as a later optimization path.
- **Least-privilege RBAC may be harder to configure initially** -> Document the required roles and scopes explicitly in the workflow design and setup notes.
- **What-if and verification steps add runtime** -> Keep them focused on infrastructure safety and operator value rather than excessive pipeline work.
- **Workflow complexity can grow quickly** -> Prefer a small number of readable stages and centralize repeated deployment inputs.

## Migration Plan

1. Add the workflow file and required repository configuration.
2. Configure Azure federated identity and RBAC for the workflow.
3. Run validation and preview-only paths first.
4. Enable deployment against the landing-zone Bicep entrypoint.
5. Add post-deploy verification and summaries.

Rollback strategy:
- Disable or revert the workflow file if deployment automation is not yet ready.
- Re-run preview-only mode after any workflow correction before enabling deployment again.

## Open Questions

- Which branch or environment protections should gate production landing-zone deployment?
- Should spoke onboarding share the same workflow with conditional inputs, or use a separate workflow later?
- What exact repository variables and environment names should be standardized for Azure subscription and deployment target selection?
