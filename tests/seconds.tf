resource "random_integer" "seconds" {
  min = 1
  max = 30
}

module "seconds" {
  source   = "../"
  duration = [resource.random_integer.seconds.result, "seconds"]
}

module "singular_seconds" {
  source   = "../"
  duration = [resource.random_integer.seconds.result, "second"]
}

output "singular_seconds" {
  value = module.singular_seconds.seconds
  precondition {
    condition     = module.seconds.seconds == module.singular_seconds.seconds
    error_message = "singular version doesn't match"
  }
}

output "years_from_seconds" {
  value = module.seconds.years
  precondition {
    condition     = module.seconds.years == resource.random_integer.seconds.result / (365 * 24 * 60 * 60)
    error_message = "number of years did not match"
  }
}

output "months_from_seconds" {
  value = module.seconds.months
  precondition {
    condition     = module.seconds.months == resource.random_integer.seconds.result / (30 * 24 * 60 * 60)
    error_message = "number of months did not match"
  }
}

output "weeks_from_seconds" {
  value = module.seconds.weeks
  precondition {
    condition     = module.seconds.weeks == resource.random_integer.seconds.result / (7 * 24 * 60 * 60)
    error_message = "number of weeks did not match"
  }
}

output "days_from_seconds" {
  value = module.seconds.days
  precondition {
    condition     = module.seconds.days == resource.random_integer.seconds.result / (24 * 60 * 60)
    error_message = "number of days did not match"
  }
}

output "hours_from_seconds" {
  value = module.seconds.hours
  precondition {
    condition     = module.seconds.hours == resource.random_integer.seconds.result / (60 * 60)
    error_message = "number of hours did not match"
  }
}

output "minutes_from_seconds" {
  value = module.seconds.minutes
  precondition {
    condition     = module.seconds.minutes == resource.random_integer.seconds.result / 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_seconds" {
  value = module.seconds.seconds
  precondition {
    condition     = module.seconds.seconds == resource.random_integer.seconds.result
    error_message = "number of seconds did not match"
  }
}
