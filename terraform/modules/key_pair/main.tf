resource "tls_private_key" "this" {
  count     = var.create_key_pair ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  count = var.create_key_pair ? 1 : 0

  key_name        = var.key_name
  key_name_prefix = var.key_name_prefix
  public_key      = tls_private_key.this[0].public_key_openssh
}

resource "aws_key_pair" "public_key" {
  count = var.use_public_key ? 1 : 0

  key_name        = var.key_name
  key_name_prefix = var.key_name_prefix
  public_key      = var.public_key
}
