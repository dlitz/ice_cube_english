require 'test_helper'
require 'ice_cube_english'

class IceCubeEnglishTest < Test::Unit::TestCase
  tests = [
    ["DAILY", [IceCube::Rule.daily]],   # all caps

    ["secondly", [IceCube::Rule.secondly]],
    ["minutely", [IceCube::Rule.minutely]],
    ["hourly", [IceCube::Rule.hourly]],
    ["daily", [IceCube::Rule.daily]],
    ["weekly", [IceCube::Rule.weekly]],
    ["monthly", [IceCube::Rule.monthly]],
    ["yearly", [IceCube::Rule.yearly]],
    ["every second", [IceCube::Rule.secondly]],
    ["every minute", [IceCube::Rule.minutely]],
    ["every hour", [IceCube::Rule.hourly]],
    ["every day", [IceCube::Rule.daily]],
    ["every week", [IceCube::Rule.weekly]],
    ["every month", [IceCube::Rule.monthly]],
    ["every year", [IceCube::Rule.yearly]],
    ["every 1 second", [IceCube::Rule.secondly]],
    ["every 1 minute", [IceCube::Rule.minutely]],
    ["every 1 hour", [IceCube::Rule.hourly]],
    ["every 1 day", [IceCube::Rule.daily]],
    ["every 1 week", [IceCube::Rule.weekly]],
    ["every 1 month", [IceCube::Rule.monthly]],
    ["every 1 year", [IceCube::Rule.yearly]],
    ["every 3 seconds", [IceCube::Rule.secondly(3)]],
    ["every 3 minutes", [IceCube::Rule.minutely(3)]],
    ["every 3 hours", [IceCube::Rule.hourly(3)]],
    ["every 3 days", [IceCube::Rule.daily(3)]],
    ["every 3 weeks", [IceCube::Rule.weekly(3)]],
    ["every 3 months", [IceCube::Rule.monthly(3)]],
    ["every 3 years", [IceCube::Rule.yearly(3)]],
    ["every 14 seconds", [IceCube::Rule.secondly(14)]],
    ["every 14 minutes", [IceCube::Rule.minutely(14)]],
    ["every 14 hours", [IceCube::Rule.hourly(14)]],
    ["every 14 days", [IceCube::Rule.daily(14)]],
    ["every 14 weeks", [IceCube::Rule.weekly(14)]],
    ["every 14 months", [IceCube::Rule.monthly(14)]],
    ["every 14 years", [IceCube::Rule.yearly(14)]],
    ["every monday", [IceCube::Rule.weekly.day(:monday)]],
    ["every tuesday", [IceCube::Rule.weekly.day(:tuesday)]],
    ["every wednesday", [IceCube::Rule.weekly.day(:wednesday)]],
    ["every thursday", [IceCube::Rule.weekly.day(:thursday)]],
    ["every friday", [IceCube::Rule.weekly.day(:friday)]],
    ["every saturday", [IceCube::Rule.weekly.day(:saturday)]],
    ["every sunday", [IceCube::Rule.weekly.day(:sunday)]],
    ["every 100 wednesdays", [IceCube::Rule.weekly(100).day(:wednesday)]],

    ["every friday the 13th", [IceCube::Rule.monthly.day_of_month(13).day(:friday)]],
    ["every friday the 13th that falls in october", [IceCube::Rule.monthly.day_of_month(13).day(:friday).month_of_year(:october)]],
    ["every friday the 13th in october", [IceCube::Rule.monthly.day_of_month(13).day(:friday).month_of_year(:october)]],
    ["every friday the 13th of october", [IceCube::Rule.monthly.day_of_month(13).day(:friday).month_of_year(:october)]],
    ["every friday in october", [IceCube::Rule.weekly.day(:friday).month_of_year(:october)]],
    ["every day in october", [IceCube::Rule.daily.month_of_year(:october)]],

    ["every monday;every wednesday;every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday; every wednesday; every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday,every wednesday,every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday, every wednesday, every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday; every wednesday; and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday, every wednesday, and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday; and every wednesday; and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday, and every wednesday, and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday;and every wednesday;and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday,and every wednesday,and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday ;and every wednesday ;and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],
    ["every monday ,and every wednesday ,and every friday.", [IceCube::Rule.weekly.day(:monday), IceCube::Rule.weekly.day(:wednesday), IceCube::Rule.weekly.day(:friday)]],

    ["every monday, wednesday, and friday", [IceCube::Rule.daily.day(:monday, :wednesday, :friday)]],
    ["every day for 6 occurrences", [IceCube::Rule.daily.count(6)]],
    ["every wednesday for 6 occurrences", [IceCube::Rule.weekly.day(:wednesday).count(6)]],
    ["every wednesday and friday for 6 occurrences", [IceCube::Rule.daily.day(:wednesday, :friday).count(6)]],
    ["every monday at 12am", [IceCube::Rule.weekly.day(:monday).hour_of_day(0).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 1am", [IceCube::Rule.weekly.day(:monday).hour_of_day(1).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 2am", [IceCube::Rule.weekly.day(:monday).hour_of_day(2).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 3am", [IceCube::Rule.weekly.day(:monday).hour_of_day(3).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 4am", [IceCube::Rule.weekly.day(:monday).hour_of_day(4).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 5am", [IceCube::Rule.weekly.day(:monday).hour_of_day(5).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 6am", [IceCube::Rule.weekly.day(:monday).hour_of_day(6).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 7am", [IceCube::Rule.weekly.day(:monday).hour_of_day(7).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 8am", [IceCube::Rule.weekly.day(:monday).hour_of_day(8).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 9am", [IceCube::Rule.weekly.day(:monday).hour_of_day(9).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 10am", [IceCube::Rule.weekly.day(:monday).hour_of_day(10).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 11am", [IceCube::Rule.weekly.day(:monday).hour_of_day(11).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 12pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(12).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 1pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(13).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 2pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(14).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 3pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(15).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 4pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(16).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 5pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 6pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(18).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 7pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(19).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 8pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(20).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 9pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(21).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 10pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(22).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 11pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(23).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 5:43 p.m.", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(43).second_of_minute(0)]],
    ["every monday at 5:01:02pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(1).second_of_minute(2)]],
    ["every monday at 5:01", [IceCube::Rule.weekly.day(:monday).hour_of_day(5).minute_of_hour(1).second_of_minute(0)]],
    ["every monday at 12:01", [IceCube::Rule.weekly.day(:monday).hour_of_day(12).minute_of_hour(1).second_of_minute(0)]],
    ["every monday at 12:01pm", [IceCube::Rule.weekly.day(:monday).hour_of_day(12).minute_of_hour(1).second_of_minute(0)]],
    ["every monday at 12:01am", [IceCube::Rule.weekly.day(:monday).hour_of_day(0).minute_of_hour(1).second_of_minute(0)]],
    ["every monday at 17", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["every monday at 17:01", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(1).second_of_minute(0)]],
    ["every monday at 17:01:59", [IceCube::Rule.weekly.day(:monday).hour_of_day(17).minute_of_hour(1).second_of_minute(59)]],
    ["every day at noon", [IceCube::Rule.daily.hour_of_day(12).minute_of_hour(0).second_of_minute(0)]],
    ["every day at midnight", [IceCube::Rule.daily.hour_of_day(0).minute_of_hour(0).second_of_minute(0)]],
    ["at 5:00pm every day", [IceCube::Rule.daily.hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["on the first day of the month", [IceCube::Rule.monthly.day_of_month(1)]],
    ["on the 1st day of the month", [IceCube::Rule.monthly.day_of_month(1)]],
    ["on the last day of the month", [IceCube::Rule.monthly.day_of_month(-1)]],
    ["at 5:00pm on the last day of the month", [IceCube::Rule.monthly.day_of_month(-1).hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["every 2 hours on the first day of the month", [IceCube::Rule.hourly(2).day_of_month(1)]],
    ["every 2 hours on the 1st day of the month", [IceCube::Rule.hourly(2).day_of_month(1)]],
    ["every 2 hours on the 2nd day of the month", [IceCube::Rule.hourly(2).day_of_month(2)]],
    ["every 2 hours on the 1st and 2nd day of the month", [IceCube::Rule.hourly(2).day_of_month(1).day_of_month(2)]],
    ["every 2 hours on the 1st and 2nd days of the month", [IceCube::Rule.hourly(2).day_of_month(1).day_of_month(2)]],
    ["every 2 hours on the last day of the month", [IceCube::Rule.hourly(2).day_of_month(-1)]],
    ["every 2 hours on the 2nd last day of the month", [IceCube::Rule.hourly(2).day_of_month(-2)]],
    ["every 2 hours on the first and last days of the month", [IceCube::Rule.hourly(2).day_of_month(1).day_of_month(-1)]],
    ["every 2 hours on the 1st and 2nd wednesdays of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [1, 2])]],
    ["every 2 hours on the first monday and wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:monday => [1], :wednesday => [1])]],
    ["every 2 hours on the first and 2nd monday and wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:monday => [1,2], :wednesday => [1,2])]],
    ["every 2 hours on the first and last wednesdays of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [1, -1])]],
    ["every 2 hours on the first wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [1])]],
    ["every 2 hours on the 1st wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [1])]],
    ["every 2 hours on the 2nd wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [2])]],
    ["every 2 hours on the 3rd wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [3])]],
    ["every 2 hours on the 4th wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [4])]],
    ["every 2 hours on the 5th wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [5])]],
    ["every 2 hours on the last wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [-1])]],
    ["every 2 hours on the 2nd last wednesday of the month", [IceCube::Rule.hourly(2).day_of_week(:wednesday => [-2])]],
    ["at 5pm on the last wednesday of the month", [IceCube::Rule.monthly.day_of_week(:wednesday => [-1]).hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["at 5pm on the last wednesday and friday of the month", [IceCube::Rule.daily.day_of_week(:wednesday => [-1], :friday => [-1]).hour_of_day(17).minute_of_hour(0).second_of_minute(0)]],
    ["every 2 hours on the 2nd second of the minute on the 45th minute of the hour", [IceCube::Rule.hourly(2).second_of_minute(2).minute_of_hour(45)]],
    ["at 45 minutes past the hour", [IceCube::Rule.hourly.minute_of_hour(45).second_of_minute(0)]],
    ["at 45 and 52 minutes past the hour", [IceCube::Rule.minutely.minute_of_hour(45).minute_of_hour(52).second_of_minute(0)]],
  ]

  tests.each_with_index do |t, i|
    string, expected_rules = t
    define_method :"test_parsing_#{i}" do
      assert_nothing_raised string.inspect do
        assert_equal expected_rules.map{|r| r.to_hash}, IceCube::Rule.from_english(string, :multiple=>true).map{|r| r.to_hash}, "IceCube::Rule.from_english #{string.inspect}"

        s = IceCube::Schedule.new(Time.now)
        s.add_recurrence_rule string
        assert_equal expected_rules.map{|r| r.to_hash}, s.to_hash[:rrules].map{|r| r.to_hash}, "IceCube::Schedule#add_recurrence_rule #{string.inspect}"

        s = IceCube::Schedule.new(Time.now)
        s.rrule string
        assert_equal expected_rules.map{|r| r.to_hash}, s.to_hash[:rrules].map{|r| r.to_hash}, "IceCube::Schedule#rrule #{string.inspect}"

        s = IceCube::Schedule.new(Time.now)
        s.add_exception_rule string
        assert_equal expected_rules.map{|r| r.to_hash}, s.to_hash[:exrules].map{|r| r.to_hash}, "IceCube::Schedule#add_exception_rule #{string.inspect}"

        s = IceCube::Schedule.new(Time.now)
        s.exrule string
        assert_equal expected_rules.map{|r| r.to_hash}, s.to_hash[:exrules].map{|r| r.to_hash}, "IceCube::Schedule#exrule #{string.inspect}"
      end
    end
  end
end
