resource "random_integer" "minutes" {
  min = 1
  max = 30
}

module "minutes" {
  source   = "../"
  duration = [resource.random_integer.minutes.result, "minutes"]
}

module "singular_minutes" {
  source   = "../"
  duration = [resource.random_integer.minutes.result, "minute"]
}

output "singular_minutes" {
  value = module.singular_minutes.minutes
  precondition {
    condition     = module.minutes.minutes == module.singular_minutes.minutes
    error_message = "singular version doesn't match"
  }
}

output "years_from_minutes" {
  value = module.minutes.years
  precondition {
    condition     = module.minutes.years == resource.random_integer.minutes.result / (365 * 24 * 60)
    error_message = "number of years did not match"
  }
}

output "months_from_minutes" {
  value = module.minutes.months
  precondition {
    condition     = module.minutes.months == resource.random_integer.minutes.result / (30 * 24 * 60)
    error_message = "number of months did not match"
  }
}

output "weeks_from_minutes" {
  value = module.minutes.weeks
  precondition {
    condition     = module.minutes.weeks == resource.random_integer.minutes.result / (7 * 24 * 60)
    error_message = "number of weeks did not match"
  }
}

output "days_from_minutes" {
  value = module.minutes.days
  precondition {
    condition     = module.minutes.days == resource.random_integer.minutes.result / (24 * 60)
    error_message = "number of days did not match"
  }
}

output "hours_from_minutes" {
  value = module.minutes.hours
  precondition {
    condition     = module.minutes.hours == resource.random_integer.minutes.result / 60
    error_message = "number of hours did not match"
  }
}

output "minutes_from_minutes" {
  value = module.minutes.minutes
  precondition {
    condition     = module.minutes.minutes == resource.random_integer.minutes.result
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_minutes" {
  value = module.minutes.seconds
  precondition {
    condition     = module.minutes.seconds == resource.random_integer.minutes.result * 60
    error_message = "number of seconds did not match"
  }
}
