resource "random_integer" "hours" {
  min = 1
  max = 30
}

module "duration" {
  source   = "../../"
  duration = [resource.random_integer.hours.result, "hours"]
}

module "singular" {
  source   = "../../"
  duration = [resource.random_integer.hours.result, "hour"]
}

output "singular" {
  value = module.singular.hours
  precondition {
    condition     = module.duration.hours == module.singular.hours
    error_message = "singular version doesn't match"
  }
}

output "months" {
  value = module.duration.months
  precondition {
    condition     = module.duration.months == resource.random_integer.hours.result / (30 * 24)
    error_message = "number of months did not match"
  }
}

output "weeks" {
  value = module.duration.weeks
  precondition {
    condition     = module.duration.weeks == resource.random_integer.hours.result / (7 * 24)
    error_message = "number of weeks did not match"
  }
}

output "days" {
  value = module.duration.days
  precondition {
    condition     = module.duration.days == resource.random_integer.hours.result / 24
    error_message = "number of days did not match"
  }
}

output "hours" {
  value = module.duration.hours
  precondition {
    condition     = module.duration.hours == resource.random_integer.hours.result
    error_message = "number of hours did not match"
  }
}

output "minutes" {
  value = module.duration.minutes
  precondition {
    condition     = module.duration.minutes == resource.random_integer.hours.result * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds" {
  value = module.duration.seconds
  precondition {
    condition     = module.duration.seconds == resource.random_integer.hours.result * 60 * 60
    error_message = "number of seconds did not match"
  }
}
