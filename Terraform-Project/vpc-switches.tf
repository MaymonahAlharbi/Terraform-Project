data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "Terraform-Project"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "public-subnet" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "public-subnet"
}

resource "alicloud_vswitch" "private-subnet" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "172.16.1.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "private-subnet"
}