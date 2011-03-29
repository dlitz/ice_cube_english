module IceCube
  module English
    module GrammarHelper
      class <<self
        def deep_merge!(result, hash)
          hash.each_pair do |k,v|
            case v
            when Hash
              if result.include?(k)
                raise ArgumentError("type mismatch: #{k.inspect}: #{v.class.name} -> #{result[k].class.name}") unless result[k].is_a?(Hash)
                deep_merge!(result[k], v)
              else
                result[k] = {}
                deep_merge!(result[k], v)
              end
            when Array
              if result.include?(k)
                raise ArgumentError("type mismatch: #{k.inspect}: #{v.class.name} -> #{result[k].class.name}") unless result[k].is_a?(Array)
                result[k] += v
              else
                result[k] = []
                result[k] += v
              end
            else
              result[k] = v
            end
          end
          result
        end
      end

      RULE_TYPES = {
        "secondly" => "IceCube::SecondlyRule",
        "seconds" => "IceCube::SecondlyRule",
        "second" => "IceCube::SecondlyRule",
        "minutely" => "IceCube::MinutelyRule",
        "minutes" => "IceCube::MinutelyRule",
        "minute" => "IceCube::MinutelyRule",
        "hourly" => "IceCube::HourlyRule",
        "hours" => "IceCube::HourlyRule",
        "hour" => "IceCube::HourlyRule",
        "daily" => "IceCube::DailyRule",
        "days" => "IceCube::DailyRule",
        "day" => "IceCube::DailyRule",
        "weekly" => "IceCube::WeeklyRule",
        "weeks" => "IceCube::WeeklyRule",
        "week" => "IceCube::WeeklyRule",
        "monthly" => "IceCube::MonthlyRule",
        "months" => "IceCube::MonthlyRule",
        "month" => "IceCube::MonthlyRule",
        "annually" => "IceCube::YearlyRule",
        "yearly" => "IceCube::YearlyRule",
        "years" => "IceCube::YearlyRule",
        "year" => "IceCube::YearlyRule",
      }

      DAYS = {
        "sundays" => 0,
        "sunday" => 0,
        "mondays" => 1,
        "monday" => 1,
        "tuesdays" => 2,
        "tuesday" => 2,
        "wednesdays" => 3,
        "wednesday" => 3,
        "thursdays" => 4,
        "thursday" => 4,
        "fridays" => 5,
        "friday" => 5,
        "saturdays" => 6,
        "saturday" => 6,
      }

      DAYS_OF_WEEK = {
        "sundays" => :sunday,
        "sunday"  => :sunday,
        "mondays" => :monday,
        "monday"  => :monday,
        "tuesdays" => :tuesday,
        "tuesday"  => :tuesday,
        "wednesdays" => :wednesday,
        "wednesday"  => :wednesday,
        "thursdays" => :thursday,
        "thursday"  => :thursday,
        "fridays" => :friday,
        "friday"  => :friday,
        "saturdays" => :saturday,
        "saturday"  => :saturday,
      }

      MONTHS_OF_YEAR = {
        "january" => :january,
        "february"  => :february,
        "march" => :march,
        "april"  => :april,
        "may" => :may,
        "june"  => :june,
        "july" => :july,
        "august"  => :august,
        "september" => :september,
        "october"  => :october,
        "november" => :november,
        "december"  => :december,
      }
    end
  end
end
