variable "aws_region" {
  description = "部署区域"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "资源命名前缀"
  type        = string
  default     = "three-tier"
}

variable "vpc_cidr" {
  description = "VPC 网段"
  type        = string
  default     = "10.0.0.0/16"
}