output "this_key_pair_key_name" {
  description = "The key pair name."
  value       = element(concat(aws_key_pair.this.*.key_name, list("")), 0)
}

output "this_key_pair_fingerprint" {
  description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
  value       = element(concat(aws_key_pair.this.*.fingerprint, list("")), 0)
}

output "this_key_pair_private_key" {
  description = "Private Key content"
  value       = element(concat(tls_private_key.this.*.private_key_pem, list("")), 0)
  sensitive   = true
    depends_on = [
      tls_private_key.this,
  ]
}
