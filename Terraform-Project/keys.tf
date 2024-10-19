

resource "alicloud_key_pair" "web-key" {
  key_pair_name = "web-key"
  key_file    = "web-key.pem"
}