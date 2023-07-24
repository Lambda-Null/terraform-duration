variable "duration" {
  type = tuple([number, string])
  validation {
    condition = contains([
      "years", "year",
      "months", "month",
      "weeks", "week",
      "days", "day",
      "hours", "hour",
      "minutes", "minute",
      "seconds", "second"
    ], var.duration[1])
    error_message = "Unknown duration unit"
  }
  description = "The desired duration in the format [amount, \"unit\"], most common units of time are valid in both singular and plural forms"
}

locals {
  value = var.duration[0]
  unit  = var.duration[1]
  baseline = (
    local.unit == "weeks" || local.unit == "week"
    ? local.value * 7 * 24 * 60 * 60
    : (
      local.unit == "months" || local.unit == "month"
      ? local.value * 30 * 24 * 60 * 60
      : (
        local.unit == "seconds" || local.unit == "second"
        ? local.value
        : 60 * (
          local.unit == "minutes" || local.unit == "minute"
          ? local.value
          : 60 * (
            local.unit == "hours" || local.unit == "hour"
            ? local.value
            : 24 * (
              local.unit == "days" || local.unit == "day"
              ? local.value
              : 365 * local.value
            )
          )
        )
      )
    )
  )
}

output "seconds" {
  value = local.baseline
  description = "duration in seconds"
}

output "minutes" {
  value = local.baseline / 60
  description = "duration in minutes"
}

output "hours" {
  value = local.baseline / (60 * 60)
  description = "duration in hours"
}

output "days" {
  value = local.baseline / (24 * 60 * 60)
  description = "duration in days"
}

output "weeks" {
  value = local.baseline / (7 * 24 * 60 * 60)
  description = "duration in weeks"
}

output "months" {
  value = local.baseline / (30 * 24 * 60 * 60)
  description = "duration in months"
}

output "years" {
  value = local.baseline / (365 * 24 * 60 * 60)
  description = "duration in years"
}
