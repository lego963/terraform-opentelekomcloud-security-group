# Simple Security Group

Configuration in this directory creates a Security Group and a Security Group Rule resource which may be sufficient for development environment.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name                                                                                           | Version    |
| ---------------------------------------------------------------------------------------------- | ---------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.12.21 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9  |

## Providers

No providers.

## Modules

| Name                                                                           | Source | Version |
| ------------------------------------------------------------------------------ | ------ | ------- |
| <a name="module_security-group"></a> [security-group](#module\_security-group) | ../../ |         |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name                                                                                        | Description                  |
| ------------------------------------------------------------------------------------------- | ---------------------------- |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Security Group |
