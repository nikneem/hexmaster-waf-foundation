## ADDED Requirements

### Requirement: GitHub self-hosted runners SHALL execute on Azure Virtual Machine Scale Sets
The landing zone SHALL host GitHub self-hosted runners on an Azure Virtual Machine Scale Set so that runner compute can scale between zero and ten instances while keeping execution private inside the landing-zone network.

#### Scenario: A GitHub Actions job requires a private runner
- **WHEN** a workflow targets the landing-zone self-hosted runner platform
- **THEN** the workflow is executed by a runner implemented through the landing-zone VM scale set

### Requirement: The runner VM scale set MUST scale from zero on demand
The runner platform MUST include an event-driven scaling path that increases VM scale set capacity when matching GitHub workflow jobs queue and returns capacity to zero when the runner pool is idle.

#### Scenario: No matching self-hosted jobs are active
- **WHEN** no queued or running jobs require the landing-zone runner pool
- **THEN** the VM scale set returns to zero instances

### Requirement: Runner execution MUST have private access to landing-zone resources
The runner platform MUST integrate with the landing-zone network so that authorized workflows can reach hub-hosted services and permitted Azure resources without traversing a public management path.

#### Scenario: A workflow needs to reach a private platform service
- **WHEN** a runner job executes a deployment or operational task
- **THEN** it can reach the permitted private service through the landing-zone network model

### Requirement: Runner execution MUST use isolated identity and secret boundaries
The runner platform MUST define workload identity, image retrieval, and secret-handling boundaries that separate runner execution from operator access and from future workload identities.

#### Scenario: A runner job accesses Azure resources
- **WHEN** a runner job authenticates to Azure or retrieves required secrets
- **THEN** it uses the runner platform's defined identity and secret model rather than shared operator credentials
