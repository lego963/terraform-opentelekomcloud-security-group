# OpenTelekomCloud Security Group Terraform module

Terraform module which creates Security Group and Security Group Rule resources on OpenTelekomCloud.

These types of resources are supported:

* [Security Group](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_v2)
* [Security Group Rule](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)

## Terraform versions

Terraform 0.12 and newer.

## Usage

```hcl
module "ssh_sg" {
  source = "terraform-opentelekomcloud-modules/security-group/opentelekomcloud"
  prefix      = "ssh"
  description = "Simple security group for SSH"

  ingress_with_source_cidr = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      source_cidr = "0.0.0.0/0"
    }
  ]
}
```


## Examples

* [Simple Security Group](https://github.com/terraform-opentelekomcloud-modules/terraform-opentelekomcloud-security-group/tree/main/examples/simple-security-group)

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13   |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                                              | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [opentelekomcloud_networking_secgroup_v2.this](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_v2)                                            | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.self_ingress_rule](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)                     | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.ingress_with_source_security_group_id](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.ingress_with_source_cidr](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)              | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.egress_with_source_security_group_id](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)  | resource |
| [opentelekomcloud_networking_secgroup_rule_v2.egress_with_source_cidr](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)               | resource |


## Inputs

| Name                                                                                                                                                   | Description                                                                        | Type                                                                                                           | Default   | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | --------- | :------: |
| <a name="input_create"></a> [create](#input\_create)                                                                                                   | Whether to create Security Group and all rules.                                    | `bool`                                                                                                         | `true`    |    no    |
| <a name="input_create_sg"></a> [create_sg](#input\_create\_sg)                                                                                         | Whether to create Security Group.                                                  | `bool`                                                                                                         | `true`    |    no    |
| <a name="input_security_group_id"></a> [security_group_id](#input\_security\_group\_id)                                                                | The ID of the Security Group.                                                      | `string`                                                                                                       | `""`      |    no    |
| <a name="input_prefix"></a> [prefix](#input\_prefix)                                                                                                   | Prefix for Security Group.                                                         | `string`                                                                                                       | `default` |    no    |
| <a name="input_description"></a> [description](#input\_description)                                                                                    | The Security Group description.                                                    | `string`                                                                                                       | `""`      |    no    |
| <a name="input_delete_default_rules"></a> [delete_default_rules](#input\_delete_\default\_rules)                                                       | Wheter to delete default rules.                                                    | `bool`                                                                                                         | `false`   |    no    |
| <a name="input_create_self_ingress_rule"></a> [create_self_ingress_rule](#input\_create\_self\_ingress\_rule)                                          | Wheter to create default self ingress rules (allow all protocols from this group). | `bool`                                                                                                         | `true`    |    no    |
| <a name="input_ingress_with_source_security_group_id"></a> [ingress_with_source_security_group_id](#input\_ingress\_with\_source\_security\_group\_id) | List of ingress rules to create where a security group is remote.                  | `list(object({ from_port = number, to_port = number, protocol = string, source_security_group_id = string }))` | `[]`      |    no    |
| <a name="input_ingress_with_source_cidr"></a> [ingress_with_source_cidr](#input\_ingress\_with\_source\_cidr)                                          | List of ingress rules to create where a CIDR is remote.                            | `list(object({ from_port = number, to_port = number, protocol = string, source_security_group_id = string }))` | `[]`      |    no    |
| <a name="input_egress_with_source_security_group_id"></a> [egress_with_source_security_group_id](#input\_egress_with_source_security_group\_id)        | List of egress rules to create where a security group is remote.                   | `list(object({ from_port = number, to_port = number, protocol = string, source_security_group_id = string }))` | `[]`      |    no    |
| <a name="input_egress_with_source_cidr"></a> [egress_with_source_cidr](#input\_egress\_with\_source\_cidr)                                             | List of egress rules to create where a CIDR is remote.                             | `list(object({ from_port = number, to_port = number, protocol = string, source_security_group_id = string }))` | `[]`      |    no    |

## Outputs

| Name                                                                                                                   | Description                           |
| ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id)                            | The ID of the Security Group          |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name)                      | The Name of the Security Group        |
| <a name="output_security_group_description"></a> [security\_group\_description](#output\_security\_group\_description) | The Description of the Security Group |


## Authors

Module managed by [Rodion Gyrbu](https://github.com/lego963).

## License

Apache 2 Licensed. See LICENSE for full details.
