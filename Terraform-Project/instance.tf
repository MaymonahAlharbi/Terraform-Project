


resource "alicloud_instance" "instance" { 

  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.security-grp.id]
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 40
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "public-instance"
  vswitch_id                 = alicloud_vswitch.public-subnet.id
  internet_max_bandwidth_out = 100
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  key_name = alicloud_key_pair.web-key.key_pair_name
  user_data                  = base64encode(file("installation.sh"))
  }

