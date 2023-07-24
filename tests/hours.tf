resource "random_integer" "hours" {
  min = 1
  max = 30
}

module "hours" {
  source   = "../"
  duration = [resource.random_integer.hours.result, "hours"]
}

module "singular_hours" {
  source   = "../"
  duration = [resource.random_integer.hours.result, "hour"]
}

output "singular_hours" {
  value = module.singular_hours.hours
  precondition {
    condition     = module.hours.hours == module.singular_hours.hours
    error_message = "singular version doesn't match"
  }
}

output "years_from_hours" {
  value = module.hours.years
  precondition {
    condition     = module.hours.years == resource.random_integer.hours.result / (365 * 24)
    error_message = "number of years did not match"
  }
}

output "months_from_hours" {
  value = module.hours.months
  precondition {
    condition     = module.hours.months == resource.random_integer.hours.result / (30 * 24)
    error_message = "number of months did not match"
  }
}

output "weeks_from_hours" {
  value = module.hours.weeks
  precondition {
    condition     = module.hours.weeks == resource.random_integer.hours.result / (7 * 24)
    error_message = "number of weeks did not match"
  }
}

output "days_from_hours" {
  value = module.hours.days
  precondition {
    condition     = module.hours.days == resource.random_integer.hours.result / 24
    error_message = "number of days did not match"
  }
}

output "hours_from_hours" {
  value = module.hours.hours
  precondition {
    condition     = module.hours.hours == resource.random_integer.hours.result
    error_message = "number of hours did not match"
  }
}

output "minutes_from_hours" {
  value = module.hours.minutes
  precondition {
    condition     = module.hours.minutes == resource.random_integer.hours.result * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_hours" {
  value = module.hours.seconds
  precondition {
    condition     = module.hours.seconds == resource.random_integer.hours.result * 60 * 60
    error_message = "number of seconds did not match"
  }
}
