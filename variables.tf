variable "env" {
  type     = string
  nullable = false
}

variable "region" {
  type     = string
  nullable = false
}

variable "aws_account_number" {
  type     = string
  nullable = false
}

variable "created_by" {
  type     = string
  nullable = false
}
variable "application" {
  type     = string
  nullable = false
}

variable "s3_prefix" {
  type     = string
  nullable = false
}

variable "s3_suffix" {
  type     = string
  nullable = false
}
