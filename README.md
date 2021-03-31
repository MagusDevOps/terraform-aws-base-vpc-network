# Base VPC Network
provides a solid base for most application to get started on it provides the ability to:
* Create the VPC
* Create 3 standard route tables (public, private, no-internet)
* creates and adds an internet gateway to the public route table
* has the ability to create a nat gateway and attache it to the private route table
* has the ability to create a transit gateway
* has the ability to attach the vpc to the transit gateway
* has the ability to share the transit gateway with your organization

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway.transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.vpc_attachment](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_egress_only_internet_gateway.egress](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/egress_only_internet_gateway) | resource |
| [aws_eip.nat_gateway_eip](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/eip) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/nat_gateway) | resource |
| [aws_ram_principal_association.transit_gateway_ram_principle_association](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.transit_gateway_ram_share](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.share_group](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/ram_resource_share) | resource |
| [aws_route.private_route_table_eigw](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route) | resource |
| [aws_route.public_route_table_igw](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route) | resource |
| [aws_route.public_route_table_igw_ipv6](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route) | resource |
| [aws_route.route_private_egress](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route) | resource |
| [aws_route_table.no-internet](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route_table) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route_table) | resource |
| [aws_route_table_association.nat_gateway_subnet_route_table](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.transit_gateway_subnet_association](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/route_table_association) | resource |
| [aws_subnet.nat_gateway_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/subnet) | resource |
| [aws_subnet.transit_gateway_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/3.33.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cidr_map"></a> [aws\_cidr\_map](#input\_aws\_cidr\_map) | required if transit\_gateway\_enabled is set to tru | <pre>object({<br>    transit_gateway = string<br>  })</pre> | `{}` | no |
| <a name="input_aws_vpc_cidr"></a> [aws\_vpc\_cidr](#input\_aws\_vpc\_cidr) | cidr for the vpc that is to be created to us | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | used to tag resources with an environment tag | `string` | n/a | yes |
| <a name="input_nat_gateway_count"></a> [nat\_gateway\_count](#input\_nat\_gateway\_count) | allows for the creation of multiple nat gateways for HA private egress | `number` | `1` | no |
| <a name="input_nat_gateway_enabled"></a> [nat\_gateway\_enabled](#input\_nat\_gateway\_enabled) | flag to enable the creation of a nat gateway | `bool` | `false` | no |
| <a name="input_ram_enabled"></a> [ram\_enabled](#input\_ram\_enabled) | allows the sharing of the transit gateway with organization accounts | `bool` | `false` | no |
| <a name="input_ram_principle_id"></a> [ram\_principle\_id](#input\_ram\_principle\_id) | the resources access management principle id with which to share the transit gateway if transit gateway and ram are enabled | `string` | `""` | no |
| <a name="input_transit_gateway_attachment_enabled"></a> [transit\_gateway\_attachment\_enabled](#input\_transit\_gateway\_attachment\_enabled) | flag to enable the attachment of the vpc created in the module | `bool` | `false` | no |
| <a name="input_transit_gateway_enabled"></a> [transit\_gateway\_enabled](#input\_transit\_gateway\_enabled) | flag to enable the creation of a transit gateway | `bool` | `false` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | the transit gateway id to be used to attach the vpc to if attachment enabled and transit gateway created through a different instance or process | `string` | `""` | no |
| <a name="input_transit_gateway_subnet_count"></a> [transit\_gateway\_subnet\_count](#input\_transit\_gateway\_subnet\_count) | the number of subnets to create with the transit gateway, effects HA ability | `number` | `1` | no |
| <a name="input_zone_priority"></a> [zone\_priority](#input\_zone\_priority) | used to prioritize high availability resource creation following the zone creation order defined | `list(string)` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | is from output of x-account-az-mapping module | <pre>object({<br>    zone = object({<br>      name = string<br>      id = string<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv6_block"></a> [ipv6\_block](#output\_ipv6\_block) | n/a |
| <a name="output_route_table_no_internet_id"></a> [route\_table\_no\_internet\_id](#output\_route\_table\_no\_internet\_id) | n/a |
| <a name="output_route_table_private_id"></a> [route\_table\_private\_id](#output\_route\_table\_private\_id) | n/a |
| <a name="output_route_table_public_id"></a> [route\_table\_public\_id](#output\_route\_table\_public\_id) | n/a |
| <a name="output_transit_gateway_arn"></a> [transit\_gateway\_arn](#output\_transit\_gateway\_arn) | n/a |
| <a name="output_transit_gateway_id"></a> [transit\_gateway\_id](#output\_transit\_gateway\_id) | n/a |
| <a name="output_transit_gateway_vpc_attachment_id"></a> [transit\_gateway\_vpc\_attachment\_id](#output\_transit\_gateway\_vpc\_attachment\_id) | n/a |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
