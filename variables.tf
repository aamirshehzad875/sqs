variable "deploy_sqs" {
  description = "deploy sqs"
  type        = map(any)
  default = {
    default = false,
    qa      = false,
    staging = true,
    prod    = true,
    test    = false
  }
}
