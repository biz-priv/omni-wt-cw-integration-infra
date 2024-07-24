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

variable "cw_api_endpoint" {
  type     = string
  nullable = false
}

variable "cw_api_auth" {
  type     = string
  nullable = false
}

variable "cw_webtracker_base_url" {
  type = string
  nullable = false
}

variable "omni_wt_cw_emails" {
  type    = list(string)
  nullable = false
}

variable "lenovo_customer_id" {
  type = string
  nullable = false
}

variable "duplicates_alerts_dl" {
  type = string
  nullable = false
}

variable "cost_transmitter_bill_to_number" {
  type = string
  nullable = false
}