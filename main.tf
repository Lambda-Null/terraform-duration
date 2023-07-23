variable "duration" {
  type = tuple([number, string])
}

locals {
  value    = var.duration[0]
  unit     = var.duration[1]
  baseline = local.unit == "minutes" || local.unit == "minute" ? local.value : 60 * (local.unit == "hours" || local.unit == "hour" ? local.value : 24 * local.value)
}

output "seconds" {
  value = local.baseline * 60
}

output "minutes" {
  value = local.baseline
}

output "hours" {
  value = local.baseline / 60
}

output "days" {
  value = local.baseline / (24 * 60)
}

output "weeks" {
  value = local.baseline / (7 * 24 * 60)
}

output "months" {
  value = local.baseline / (30 * 24 * 60)
}
