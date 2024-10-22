variable "key_pair_name" {
  description = "The key pair to use for the EC2 instance"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key for SSH access"
  type        = string
}