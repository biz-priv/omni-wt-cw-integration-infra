resource "aws_ssm_parameter" "s3_prefix_lenovo" {
  name  = "/${var.application}/${var.env}/s3-prefix"
  type  = "String"
  value = var.s3_prefix


  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/s3-prefix"
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
    Name        = "/${var.application}/${var.env}/s3-suffix"
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
    Name        = "/${var.application}/${var.env}/create-shipment-status-table-name"
  }
}

resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table_status_index" {
  name  = "/${var.application}/${var.env}/create-shipment-status-table-status-index"
  type  = "String"
  value = "Status-index"


  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/create-shipment-status-table-status-index"
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
    Name        = "/${var.application}/${var.env}/create-shipment-status-table-housebill-index"

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
    Name        = "/${var.application}/${var.env}/createShipment/cw/url"

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
    Name        = "/${var.application}/${var.env}/createShipment/cw/auth"

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
    Name        = "/${var.application}/${var.env}/add-milestone/sqs/queue.arn"

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
    Name        = "/${var.application}/${var.env}/add-milestone-status-table-name"

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
    Name        = "/${var.application}/${var.env}/pod-status-table-name"

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
    Name        = "/${var.application}/${var.env}/customer-list-table-name"
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
    Name        = "/${var.application}/${var.env}/pod-status-stream-arn"
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
    Name        = "/${var.application}/${var.env}/pod-docs/sqs/queue.arn"

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
    Name        = "/${var.application}/${var.env}/create-shipment/sqs/queue.arn"
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_lenovo_create_shipment_sqs_url" {
  name  = "/${var.application}/${var.env}/create-shipment/sqs/queue.url"
  type  = "String"
  value = aws_sqs_queue.omni_wt_cw_lenovo_create_shipment_queue.url

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/create-shipment/sqs/queue.url"
  }
}

resource "aws_ssm_parameter" "wt_cw_create_shipment_status_table_stream_arn" {
  name  = "/${var.application}/${var.env}/create-shipment-status-stream-arn"
  type  = "String"
  value = aws_dynamodb_table.wt_cw_create_shipment_status_table.stream_arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/create-shipment-status-stream-arn"
  }
}

resource "aws_ssm_parameter" "cw_webtracker_base_url" {
  name  = "/${var.application}/${var.env}/cw-webtracker-base/url"
  type  = "String"
  value = var.cw_webtracker_base_url

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/cw-webtracker-base/url"
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_cost_transmitter_sqs_arn" {
  name  = "/${var.application}/${var.env}/cost-transmitter/sqs/queue.arn"
  type  = "String"
  value = aws_sqs_queue.omni_wt_cw_cost_transmitter_sqs.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/cost-transmitter/sqs/queue.arn"
  }
}

resource "aws_ssm_parameter" "omni_wt_cw_cost_transmitter_table" {
  name  = "/${var.application}/${var.env}/cost-transmitter-table-name"
  type  = "String"
  value = aws_dynamodb_table.omni_wt_cw_cost_transmitter_table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/cost-transmitter-table-name"
  }
}

resource "aws_ssm_parameter" "create_shipment_duplicates_dl" {
  name  = "/${var.application}/${var.env}/create-shipment-duplicates/dl"
  type  = "String"
  value = var.duplicates_alerts_dl

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/create-shipment-duplicates/dl"
  }
}

resource "aws_ssm_parameter" "omni_cw_wt_error_notification_sns_topic_arn" {
  name  = "/${var.application}/${var.env}/error-notifications/sns.arn"
  type  = "String"
  value = aws_sns_topic.omni-wt-cw-error-notification.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/error-notifications/sns.arn"
  }
}

resource "aws_ssm_parameter" "lenovo_customer_id" {
  name  = "/${var.application}/${var.env}/lenovo/customerid"
  type  = "String"
  value = var.lenovo_customer_id

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "/${var.application}/${var.env}/lenovo/customerid"
  }
}
