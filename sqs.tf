resource "aws_sqs_queue" "omni_wt_cw_lenovo_add_milestone_sqs" {
  name                       = "omni-wt-cw-lenovo-add-milestone-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "omni-wt-cw-lenovo-add-milestone-${var.env}"
  }
}

data "aws_iam_policy_document" "omni_wt_cw_lenovo_add_milestone_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}",
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-apar-failure-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_wt_cw_lenovo_add_milestone_queue_policy" {
  queue_url = aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.id
  policy    = data.aws_iam_policy_document.omni_wt_cw_lenovo_add_milestone_queue_policy.json
}

resource "aws_sns_topic_subscription" "omni_shipment_milestone_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.arn

  filter_policy = jsonencode(
    {
      FK_OrderStatusId = [
        "PUP",
        "TTC",
        "DEL",
      ]
    }
  )
}

resource "aws_sns_topic_subscription" "omni_apar_failure_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-apar-failure-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_wt_cw_lenovo_add_milestone_sqs.arn
}


resource "aws_sqs_queue" "omni_wt_cw_lenovo_pod_docs_sqs" {
  name                       = "omni-wt-cw-lenovo-pod-docs-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0
    tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "omni-wt-cw-lenovo-pod-docs-${var.env}"
  }
}

data "aws_iam_policy_document" "omni_wt_cw_lenovo_pod_docs_sqs_policy" {
  policy_id = "${aws_sqs_queue.omni_wt_cw_lenovo_pod_docs_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_wt_cw_lenovo_pod_docs_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-file-${var.env}",
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_wt_cw_lenovo_pod_docs_sqs_policy" {
  queue_url = aws_sqs_queue.omni_wt_cw_lenovo_pod_docs_sqs.id
  policy    = data.aws_iam_policy_document.omni_wt_cw_lenovo_pod_docs_sqs_policy.json
}

resource "aws_sns_topic_subscription" "omni_shipment_file_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-file-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_wt_cw_lenovo_pod_docs_sqs.arn

  filter_policy = jsonencode(
    {
      FK_DocType = [
        "HCPOD",
        "POD",
      ]
    }
  )
}

data "aws_s3_bucket" "cargowise_to_datawarehouse_bucket" {
  bucket = "${var.env}-cargowise-to-datawarehouse"
}

resource "aws_sqs_queue" "omni_wt_cw_lenovo_create_shipment_queue" {
  name = "wt-cw-create-shipment-queue-${var.env}.fifo"
  visibility_timeout_seconds = 900
  fifo_queue = true
}

resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.omni_wt_cw_lenovo_create_shipment_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "example-ID"
    Statement = [
      {
        Sid    = "example-statement-ID"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action   = "SQS:SendMessage"
        Resource = aws_sqs_queue.omni_wt_cw_lenovo_create_shipment_queue.arn
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = var.aws_account_number
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::${var.env}-cargowise-to-datawarehouse"
          }
        }
      }
    ]
  })
}



resource "aws_sqs_queue" "omni_wt_cw_cost_transmitter_sqs" {
  name                       = "omni-wt-cw-cost-transmitter-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0
    tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
    Name        = "omni-wt-cw-cost-transmitter-${var.env}"
  }
}

data "aws_iam_policy_document" "omni_wt_cw_cost_transmitter_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_wt_cw_cost_transmitter_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_wt_cw_cost_transmitter_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-apar-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_wt_cw_cost_transmitter_queue_policy" {
  queue_url = aws_sqs_queue.omni_wt_cw_cost_transmitter_sqs.id
  policy    = data.aws_iam_policy_document.omni_wt_cw_cost_transmitter_queue_policy.json
}

resource "aws_sns_topic_subscription" "omni_shipment_apar_wt_cw_cost_transmitter_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-apar-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_wt_cw_cost_transmitter_sqs.arn
}
