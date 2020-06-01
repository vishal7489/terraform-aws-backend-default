variable "bucket_prefix" {
  description = "A prefix applied to the S3 bucket created to ensure a unique name."
}

variable "bucket_region" {
  description = "The region to create the S3 bucket in"
}

variable "bucket_sse_algorithm" {
  description = "Encryption algorithm to use on the S3 bucket. Currently only AES256 is supported"
  default     = "AES256"
}

variable "workspaces" {
  type        = list(string)
  description = "A list of terraform workspaces that IAM Roles/Policy will be created for"
  default     = ["prod", "uat", "staging", "labs", "mgmt", "idp"]
}

variable "assume_policy" {
  type        = map(string)
  description = "A map that allows you to specify additional AWS principles that will be added to the backend roles assume role policy"

  default = {
    all  = "arn:aws:iam::975816917933:root,arn:aws:iam::292995800702:root,arn:aws:iam::904761875964:root"
    prod = "arn:aws:iam::393167047391:root"
  uat = "arn:aws:iam::121646045118:root" }
}