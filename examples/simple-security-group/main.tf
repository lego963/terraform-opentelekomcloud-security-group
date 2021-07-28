# Configure the OpenTelekomCloud Provider
provider "opentelekomcloud" {
  cloud = "otc"
}

module "security-group" {
  source = "../../"

  prefix = "simple-example"
}
