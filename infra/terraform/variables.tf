
# The Google Project ID. https://support.google.com/googleapi/answer/7014113?hl=en
variable "project_id" {
  description = "The Google project id."
  type        = string
}

# The Google Cloud region.
variable "region" {
  description = "The Google Cloud region."
  type        = string
  default     = "us-west1"
}
