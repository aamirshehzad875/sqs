
provider "aws" {
  region  = "us-east-1"
  profile = "faheem-test"
}

locals {
  sqs_messaging_queue_name = "sqs-${terraform.workspace}-messaging-notifications-queue-link"
}

module "sqs_messaging_notifications" {
  source                    = "terraform-aws-modules/sqs/aws"
  version                   = "4.0.1"
  name                      = local.sqs_messaging_queue_name
  message_retention_seconds = 1209600 # 14 days
  max_message_size          = 262144  # 256 KB

  tags = {
    app       = "link social network"
    env       = terraform.workspace
    terraform = "true"
  }

  count = lookup(var.deploy_sqs, terraform.workspace) ? 1 : 0

}

# output "sqs_messaging_notifications_queue_url" {
#   value       = module.sqs_messaging_notifications.queue_url
#   description = "The URL of the SQS queue"
# }





