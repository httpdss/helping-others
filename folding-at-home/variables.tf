variable "aws_region" {
  description = "AWS Region to use"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the cluster"
  default     = "foldingat-at-home"
}

variable "instance_count" {
  default = 1
}

variable "instance_type_gpu" {
  # consider usgin p3.2xlarge or any from p3 familiy. watch out for costs!
  default = "p3.2xlarge"
}

variable "instance_type" {
  # consider usgin p3.2xlarge or any from p3 familiy. watch out for costs!
  default = "t2.micro"
}

variable "gpu_enabled" {
  default = false
}

variable "spot_price" {
  default = "0.03"
}

# default = "ami-0b0aa5ef9a1150681"
variable "ami_id" {}
