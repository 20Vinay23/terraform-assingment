variable "region" {
  type        = string
  description = "AWS region to create resources in"
  default     = "ap-south-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-006d9dc984b8eb4b9"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "MyTerraformInstance"
}

variable "volume_sizes" {
  type        = list(number)
  description = "List of EBS volume sizes in GB"
  default     = [8]
}

variable "tags_map" {
  type        = map(string)
  description = "Map of tags for the EC2 instance"
  default     = {
    "Environment" = "Dev",
    "Project"     = "TerraformAssignment"
  }
}

variable "enable_monitoring" {
  type        = bool
  description = "Enable detailed monitoring"
  default     = false
}
