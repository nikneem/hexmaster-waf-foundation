## 1. Workflow scaffold

- [x] 1.1 Create the GitHub Actions workflow skeleton for the landing-zone deployment entrypoint and define its triggers, inputs, and bootstrap runner strategy.
- [x] 1.2 Add shared workflow variables, environment selection, and reusable command setup for `infra/landing-zone/main.bicep` and its parameter files.

## 2. Identity and security

- [x] 2.1 Configure Azure authentication in the workflow using GitHub OIDC and document the required federated credential and Azure RBAC setup.
- [x] 2.2 Harden the workflow with least-privilege permissions, immutable action pinning, and explicit deployment guards.

## 3. Validation and deployment orchestration

- [x] 3.1 Implement validation and preview stages for the landing-zone deployment, including Bicep validation and Azure what-if or equivalent review output.
- [x] 3.2 Implement the deployment stage for the subscription-scope landing-zone entrypoint with support for controlled environment targeting.

## 4. Verification and operations

- [x] 4.1 Add post-deploy verification, deployment summaries, and artifact retention for preview and deployment evidence.
- [x] 4.2 Document the workflow's required repository configuration, operational usage, and failure-triage guidance.
