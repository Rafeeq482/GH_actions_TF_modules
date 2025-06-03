variable "ami" {
  type        = string
  description = "AMI ID to use for the instance"
  default     = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
  default     = "SNS"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
  default     = "subnet-06cdf6a7520a97aee"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
  default     = ["sg-0194e3f72b2b56c0e"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
  default = {
    Name = "MYEC2INSTANCE"
  }
}
