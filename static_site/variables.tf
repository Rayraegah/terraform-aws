# -----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# -----------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# -----------------------------------------------------------------------------
# PARAMETERS
# -----------------------------------------------------------------------------

variable "domain" {
  description = "The domain which you want to serve the website on."
}

variable "zone_id" {
  description = "The ID of hosted zone."
}

variable "bucket_name" {
  description = "The name of S3 bucket."
}

variable "acm_certificate_arn" {
  description = "The domain of the website."
}
