resource "aws_dynamodb_table" "wt_cw_create_shipment_status_table" {
  name         = "wt-cw-create-shipment-status-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ShipmentId"
  # stream_enabled   = true
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

  global_secondary_index {
    name            = "Status-index"
    hash_key        = "Status"
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
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-create-shipment-status-${var.env}"
  }
}

resource "aws_dynamodb_table" "wt_cw_customers_list_table" {
  name         = "wt-cw-customers-list-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "BillNo "
  # stream_enabled   = true
  # stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "BillNo "
    type = "S"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "wt-cw-customers-list-${var.env}"
  }
}
