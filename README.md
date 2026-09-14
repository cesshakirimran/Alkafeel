# Site blueprint — Terraform practice

A small, real Terraform project built around the problem in the one blueprint, many sites.

Each site gets a resource group, a VNet with an OT subnet and an iDMZ subnet,
NSGs that enforce the segmentation rule (OT may publish up, the iDMZ may never
initiate down), a Key Vault and a Log Analytics workspace.

Adding a site means adding five lines to `terraform.tfvars`. That is the whole
point of the exercise.

## Run it

Works without an Azure subscription:

    terraform init
    terraform fmt -recursive
    terraform validate

Needs a subscription (`az login` first):

    terraform plan
    terraform apply
    terraform destroy

Everything here is cheap — a Key Vault and a Log Analytics workspace cost
effectively nothing idle. Run `terraform destroy` when you're done anyway.

## The exercises that actually teach you something

1. Run `plan`, then add a third site to `terraform.tfvars` and run `plan` again.
   Read the output. Notice it proposes to create one site and touch nothing else.

2. Change something in the portal by hand — add a tag to a resource group.
   Run `plan` again. Terraform notices. That is drift detection, and it is the
   single best answer to "why IaC rather than clicking".

3. Open `terraform.tfstate` and look at it. Then explain to yourself why this
   file must live in remote storage with locking, and why it must never go in
   git. It contains resource IDs and can contain secrets.

4. Break a validation rule on purpose — set a site code to `HSC_BDR`. See the
   error. Input validation in modules is how you stop a bad site definition
   reaching production.

5. Try to delete the `deny-idmz-into-ot` rule and articulate, out loud, what
   you just allowed.

## Mapping to what you already know

| ARM templates            | Terraform                                  |
|--------------------------|--------------------------------------------|
| Deployment history in RG | State file (must be remote and locked)     |
| Linked templates         | Modules                                    |
| `copy` loops             | `for_each` / `count`                       |
| Parameters files         | `.tfvars`                                  |
| What-if                  | `plan` (and it is the review artifact)     |
| Azure only               | Providers — Azure, GitHub, Cloudflare, etc |

The two genuinely new concepts are **state** and **providers**. Everything else
you have already done in a different syntax.
