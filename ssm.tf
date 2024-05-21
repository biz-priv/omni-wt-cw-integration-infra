resource "aws_ssm_parameter" "s3_prefix_lenovo" {
  name  = "/${var.application}/${var.env}/s3-prefix"
  type  = "String"
  value = var.s3_prefix

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "s3_suffix_lenovo" {
  name  = "/${var.application}/${var.env}/s3-suffix"
  type  = "String"
  value = var.s3_suffix

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table" {
  name  = "/${var.application}/${var.env}/create-shipment-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_create_shipment_status_table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

# resource "aws_ssm_parameter" "lenovo_create_shipment_status_table_stream_arn" {
#   name  = "/${var.application}/${var.env}/create-shipment-status-table-stream-arn"
#   type  = "String"
#   value = aws_dynamodb_table.lenovo_create_shipment_status_table.stream_arn

#   tags = {
#     Application = var.application
#     CreatedBy   = var.created_by
#     Environment = var.env
#     STAGE       = var.env
#   }
# }

resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table_status_index" {
  name  = "/${var.application}/${var.env}/create-shipment-status-table-status-index"
  type  = "String"
  value = "Status-index"

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table_housebill_index" {
  name  = "/${var.application}/${var.env}/create-shipment-status-table-housebill-index"
  type  = "String"
  value = "Housebill-index"

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
