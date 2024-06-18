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

resource "aws_ssm_parameter" "cw_api_endpoint" {
  name  = "/${var.application}/${var.env}/createShipment/cw/url"
  type  = "String"
  value = var.cw_api_endpoint


  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "cw_api_auth" {
  name  = "/${var.application}/${var.env}/createShipment/cw/auth"
  type  = "String"
  value = var.cw_api_auth


  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_lenovo_add_milestone_sqs_arn" {
  name  = "/${var.application}/${var.env}/add-milestone/sqs/queue.arn"
  type  = "String"
  value = aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_add_milestone_table_name" {
  name  = "/${var.application}/${var.env}/add-milestone-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_add_milestone_table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_lenovo_pod_status_table_name" {
  name  = "/${var.application}/${var.env}/pod-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_pod_status_table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_lenovo_customer_list_table_name" {
  name  = "/${var.application}/${var.env}/customer-list-table-name"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_customers_list_table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_lenovo_pod_status_table_stream_arn" {
  name  = "/${var.application}/${var.env}/pod-status-stream-arn"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_pod_status_table.stream_arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_lenovo_pod_status_sqs_arn" {
  name  = "/${var.application}/${var.env}/pod-docs/sqs/queue.arn"
  type  = "String"
  value = aws_sqs_queue.omni_wt_cw_lenovo_pod_docs_sqs.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_lenovo_create_shipment_sqs_arn" {
  name  = "/${var.application}/${var.env}/create-shipment/sqs/queue.arn"
  type  = "String"
  value = aws_sqs_queue.omni_wt_cw_lenovo_create_shipment_queue.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table_stream_arn" {
  name  = "/${var.application}/${var.env}/create-shipment-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_create_shipment_status_table.stream_arn


  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}