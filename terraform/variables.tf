variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "eu-central-1"
}

variable "project" {
  description = "The resource project"
  default     = "myproject"
}

variable "environment" {
  description = "Environment for the resource"
  default     = "team1"
}
