output "envoy_eip" {
  description = "Elastic ip address for Envoy nlb services"
  value       = aws_eip.eip.*.public_ip
}

output "s3_user_key" {
  value = aws_iam_access_key.prod_media_bucket.id
}

output "s3_secert_key" {
  value     = aws_iam_access_key.prod_media_bucket.encrypted_secret
  sensitive = true
}