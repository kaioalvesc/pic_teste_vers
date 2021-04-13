variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Access Key"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}