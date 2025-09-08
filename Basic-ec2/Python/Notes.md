📌 Terraform Interview Prep – Summary
🔹 Key Concepts & Keywords

Terraform Basics: IaC, declarative, immutable infra, plan → apply cycle.

State Management: terraform.tfstate, remote backend (S3 + DynamoDB lock / Terraform Cloud).

Workspaces: Isolate dev/qa/prod environments.

Modules: Reusable code for VPC, EKS, RDS, Security.

Variables & Locals: DRY code, environment-specific tfvars.

Data Sources: Fetch latest AMI, existing VPC IDs, etc.

Count / For_each: Scaling resources dynamically (multi-env, multi-instances).

Depends_on: Control resource creation order.

Provisioners: Remote-exec / local-exec (though discouraged for prod).

Terraform Import: Bring manually created AWS resources into Terraform.

Terraform Cloud / Sentinel: Remote state, compliance, policy enforcement.

Upgrade Scenarios: Change instance_type in .tfvars, apply → Terraform recreates/upgrades resource.

State Drift Handling: terraform plan -refresh-only, align actual infra with state.

CI/CD Integration: Terraform in Jenkins pipeline (PR approval → plan → apply).

🔹 Real-World Scenarios / Stories
Sanofi (Pharma – Cloud Ops Engineer)

Provisioned VPC, EC2, RDS with Terraform.

Used S3 + DynamoDB for remote state & locking.

Automated tagging via for_each.

Fetched latest AMI with data sources.

Upgraded EC2 (t2.micro → t2.medium) by changing instance_type.

Solved state lock conflicts via DynamoDB locking.

ABN AMRO Clearing Bank (DevOps Engineer)

Managed EKS cluster, Node groups, Helm releases via Terraform.

Repo structured as mono-repo with modules.

Used Terraform Cloud Enterprise backend with Sentinel policies.

Implemented count & for_each for multiple envs (UAT, Pre-Prod).

Migrated manual RDS via terraform import.

Implemented depends_on for sequencing infra build.

Zero-downtime upgrade → blue/green node groups in EKS.

Solved state drift using refresh-only.

CI/CD: Jenkins pipeline → Terraform Plan → Approval → Apply.

🔹 Interview Q&A (Based on Our Chat)

Q1. How do you manage Terraform state in your projects?
👉 Used S3 + DynamoDB for state & locking (Sanofi), Terraform Cloud for remote state & Sentinel policies (ABN AMRO).

Q2. What if two engineers apply Terraform at the same time?
👉 DynamoDB lock prevents concurrency; also enforced GitOps process with PR approval before apply.

Q3. How do you upgrade an EC2 instance type using Terraform?
👉 Change instance_type in variables, run plan → apply. Terraform either recreates or resizes depending on resource.

Q4. Where did you use data sources?
👉 To fetch the latest AMI from SSM, and to fetch existing VPC IDs during migrations.

Q5. Where did you use count or for_each?
👉 for_each → tagging all resources with env/project/owner.
👉 count → spinning up multiple identical EC2 instances or multiple envs (UAT/Pre-Prod).

Q6. Where did you use depends_on?
👉 Ensured RDS created before app servers; in EKS, ensured VPC & subnets existed before cluster provisioning.

Q7. Did you face Terraform state drift? How did you handle it?
👉 Yes, when someone changed infra via AWS console. I used terraform plan -refresh-only to align state.

Q8. Did you ever import resources into Terraform?
👉 Yes, migrated existing RDS into Terraform using terraform import.

Q9. How did you integrate Terraform with CI/CD?
👉 In ABN AMRO, Jenkins pipeline → Terraform plan runs → manual approval → apply to production.

Q10. How do you enforce compliance in Terraform?
👉 Used Sentinel policies in Terraform Cloud (e.g., no unencrypted S3, mandatory tagging).