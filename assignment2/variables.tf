variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "ubuntu_ami_id" {
  description = "The AMI ID for Ubuntu."
  default     = "ami-0866a3c8686eaeeba"  # Ubuntu 20.04 for us-east-1
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  default     = "t2.micro"
}

# Key Pair Name
variable "key_name" {
  description = "Name of the key pair."
  default     = "my-terraform-key"
}

# Public Key Path
variable "public_key_path" {
  description = "Path to the public key file."
  default     = "/home/vinay.kumar3@happiestminds.com/.ssh/id_rsa.pub"
}

# Private Key Path
variable "private_key_path" {
  description = "Path to the private key file."
  default     = "/home/vinay.kumar3@happiestminds.com/.ssh/id_rsa"
}
