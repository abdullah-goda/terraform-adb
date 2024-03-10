output "sec_group" {
  value       = aws_subnet.public_subnets[0].id
  description = "..."
}