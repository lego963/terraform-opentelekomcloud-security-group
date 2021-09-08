# Configure the OpenTelekomCloud Provider
provider "opentelekomcloud" {
  cloud = "tf"
}

module "ssh_sg" {
  source = "../../"

  prefix      = "simple-example"
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
