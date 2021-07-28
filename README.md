# OpenTelekomCloud Security Group Terraform module

Terraform module which creates Security Group and Security Group Rule resources on OpenTelekomCloud.

These types of resources are supported:

* [Security Group](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_v2)
* [Security Group Rule](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)

## Terraform versions

Terraform 0.12 and newer.

## Usage

```hcl
module "security-group" {
  source = "terraform-opentelekomcloud-modules/security-group/opentelekomcloud"
}
```


## Examples

* [Simple Security Group](https://github.com/terraform-opentelekomcloud-modules/terraform-opentelekomcloud-security-group/tree/main/examples/simple-security-group)

## Requirements

| Name                                                                                           | Version    |
| ---------------------------------------------------------------------------------------------- | ---------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.12.21 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                             | Type     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [opentelekomcloud_networking_secgroup_v2.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_v2)           | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2) | resource |

## Inputs

| Name                                                 | Description                                     | Type   | Default | Required |
| ---------------------------------------------------- | ----------------------------------------------- | ------ | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create Security Group and all rules. | `bool` | `true`  |    no    |

## Outputs

| Name                                                                                        | Description                  |
| ------------------------------------------------------------------------------------------- | ---------------------------- |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Security Group |


## Authors

Module managed by [Rodion Gyrbu](https://github.com/lego963).

## License

Apache 2 Licensed. See LICENSE for full details.
