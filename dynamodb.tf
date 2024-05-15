resource "aws_dynamodb_table" "lenovo_create_shipment_status_table" {
  name             = "lenovo-create-shipment-status-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "ShipmentId"
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

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
