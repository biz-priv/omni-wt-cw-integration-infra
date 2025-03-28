resource "aws_dynamodb_table" "wt_cw_create_shipment_status_table" {
  name         = "wt-cw-create-shipment-status-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ShipmentId"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "ShipmentId"
    type = "S"
  }

  attribute {
    name = "Status"
    type = "S"
  }

  attribute {
    name = "Housebill"
    type = "S"
  }

  attribute {
    name = "BillNo"
    type = "S"
  }

  attribute {
    name = "RetryCount"
    type = "S"
  }

  global_secondary_index {
    name            = "Status-RetryCount-Index"
    hash_key        = "Status"
    range_key       = "RetryCount"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "Housebill-index"
    hash_key        = "Housebill"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "BillNo-index"
    hash_key        = "BillNo"
    projection_type = "ALL"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    ProjectID   = "PRJ0020819"
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-create-shipment-status-${var.env}"
  }
}

resource "aws_dynamodb_table" "wt_cw_customers_list_table" {
  name         = "wt-cw-customers-list-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "BillNo"
  # stream_enabled   = true
  # stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "BillNo"
    type = "S"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    ProjectID   = "PRJ0020819"
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-customers-list-${var.env}"
  }
}

resource "aws_dynamodb_table" "wt_cw_add_milestone_table" {
  name         = "wt-cw-add-milestone-status-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "OrderNo"
  range_key    = "OrderStatusId"

  attribute {
    name = "OrderNo"
    type = "S"
  }

  attribute {
    name = "OrderStatusId"
    type = "S"
  }

  attribute {
    name = "ReferenceNo"
    type = "S"
  }

  global_secondary_index {
    name            = "ReferenceNo-index"
    hash_key        = "ReferenceNo"
    projection_type = "ALL"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    ProjectID   = "PRJ0020819"
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-add-milestone-${var.env}"
  }
}

resource "aws_dynamodb_table" "wt_cw_pod_status_table" {
  name             = "wt-cw-pod-status-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "OrderNo"
  range_key        = "DocType"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "OrderNo"
    type = "S"
  }

  attribute {
    name = "DocType"
    type = "S"
  }

  attribute {
    name = "Status"
    type = "S"
  }

  global_secondary_index {
    name            = "Status-index"
    hash_key        = "Status"
    projection_type = "ALL"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    ProjectID   = "PRJ0020819"
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-pod-status-${var.env}"
  }
}

resource "aws_dynamodb_table" "omni_wt_cw_cost_transmitter_table" {
  name             = "omni-wt-cw-cost-transmitter-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "OrderNo"
  range_key        = "SeqNo"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "OrderNo"
    type = "S"
  }

  attribute {
    name = "SeqNo"
    type = "S"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    ProjectID   = "PRJ0020819"
    Environment = var.env
    STAGE       = var.env
    Name        = "omni-wt-cw-cost-transmitter-${var.env}"
  }
}