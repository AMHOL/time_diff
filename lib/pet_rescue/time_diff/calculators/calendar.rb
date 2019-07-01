module PetRescue
  module TimeDiff
    module Calculators
      class Calendar
        DATE_MAPPING = {
          years: {
            diff: ->(min, max) {
              max.year - min.year
            },
            next: ->(date_time, n = 1) {
              date_time.next_year(n)
            }
          },
          months: {
            diff: ->(min, max) {
              ((max.year * 12) + max.month) - ((min.year * 12) + min.month)
            },
            next: ->(date_time, n = 1) {
              date_time.next_month(n)
            }
          },
          weeks: {
            diff: ->(min, max) {
              ((max.to_time - min.to_time) / 604800).to_i
            },
            next: ->(date_time, n = 1) {
              date_time.next_day(n * 7)
            }
          },
          days: {
            diff: ->(min, max) {
              ((max.to_time - min.to_time) / 86400).to_i
            },
            next: ->(date_time, n = 1) {
              date_time.next_day(n)
            }
          },
          hours: {
            diff: ->(min, max) {
              ((max.to_time - min.to_time) / 3600).to_i
            },
            next: ->(date_time, n = 1) {
              date_time + (Rational(1, 24) * n)
            }
          },
          minutes: {
            diff: ->(min, max) {
              ((max.to_time - min.to_time) / 60).to_i
            },
            next: ->(date_time, n = 1) {
              date_time + (Rational(1, 1440) * n)
            }
          },
          seconds: {
            diff: ->(min, max) {
              (max.to_time - min.to_time).to_i
            },
            next: ->(date_time, n = 1) {
              date_time + (Rational(1, 86400) * n)
            }
          },
        }.freeze

        def components(components)
          DATE_MAPPING.slice(
            *DATE_MAPPING.keys & components
          )
        end
      end
    end
  end
end
