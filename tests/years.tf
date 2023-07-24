resource "random_integer" "years" {
  min = 1
  max = 30
}

module "years" {
  source   = "../"
  duration = [resource.random_integer.years.result, "years"]
}

module "singular_year" {
  source   = "../"
  duration = [resource.random_integer.years.result, "year"]
}

output "singular_year" {
  value = module.singular_year.years
  precondition {
    condition     = module.years.years == module.singular_year.years
    error_message = "singular version doesn't match"
  }
}

output "years_from_years" {
  value = module.years.years
  precondition {
    condition     = module.years.years == resource.random_integer.years.result
    error_message = "number of years did not match"
  }
}

output "months_from_years" {
  value = module.years.months
  precondition {
    condition     = module.years.months == resource.random_integer.years.result * 365 / 30
    error_message = "number of months did not match"
  }
}

output "weeks_from_years" {
  value = module.years.weeks
  precondition {
    condition     = module.years.weeks == resource.random_integer.years.result * 365 / 7
    error_message = "number of weeks did not match"
  }
}

output "days_from_years" {
  value = module.years.days
  precondition {
    condition     = module.years.days == resource.random_integer.years.result * 365
    error_message = "number of days did not match"
  }
}

output "hours_from_years" {
  value = module.years.hours
  precondition {
    condition     = module.years.hours == resource.random_integer.years.result * 365 * 24
    error_message = "number of hours did not match"
  }
}

output "minutes_from_years" {
  value = module.years.minutes
  precondition {
    condition     = module.years.minutes == resource.random_integer.years.result * 365 * 24 * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_years" {
  value = module.years.seconds
  precondition {
    condition     = module.years.seconds == resource.random_integer.years.result * 365 * 24 * 60 * 60
    error_message = "number of seconds did not match"
  }
}
