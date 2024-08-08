variable "deploy_sqs" {
  description = "deploy sqs"
  type        = map(any)
  default = {
    default = false,
    qa      = false,
    staging = false,
    prod    = true,
    test    = true
  }
}
