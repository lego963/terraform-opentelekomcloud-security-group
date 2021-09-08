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

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13   |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Providers

No providers.

## Modules

| Name                                                    | Source | Version |
| ------------------------------------------------------- | ------ | ------- |
| <a name="module_ssh_sg"></a> [ssh_sg](#module\_ssh\_sg) | ../../ |         |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name                                                                                                                 | Description                           |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| <a name="output_security_group_id"></a> [security_group_id](#output\_security\_group\_id)                            | The ID of the Security Group          |
| <a name="output_security_group_name"></a> [security_group_name](#output\_security\_group\_name)                      | The name of the Security Group        |
| <a name="output_security_group_description"></a> [security_group_description](#output\_security\_group\_description) | The description of the Security Group |
