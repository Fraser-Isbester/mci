
# The domain name for the project.
variable "domain" {
  description = "The domain name for the project."
  type        = string
}

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

# The administrative Email for this project.
variable "admin_email" {
  description = "The administrative Email for this project."
  type        = string
}
