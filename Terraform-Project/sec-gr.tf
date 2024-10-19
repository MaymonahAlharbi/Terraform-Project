resource "alicloud_security_group" "security-grp" {
  name        = "web-security-grp"
  description = "security group for public instance"
  vpc_id      = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.security-grp.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.security-grp.id
  cidr_ip           = "0.0.0.0/0"
}
