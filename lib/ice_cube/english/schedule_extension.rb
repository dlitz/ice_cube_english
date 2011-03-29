require 'treetop'
require 'ice_cube'
require 'ice_cube/english/schedule_grammar'

module IceCube
  module English
    module ScheduleExtension
      # Add the specified rule to the Schedule as a recurrence rule.
      # The rule may be a Rule object, or it may be an english String.
      def add_recurrence_rule_with_english(rule_or_english)
        return add_recurrence_rule_without_english(rule_or_english) unless rule_or_english.is_a?(String)
        rules = ::IceCube::Rule.from_english(rule_or_english, :multiple=>true)
        rules.each do |rule|
          add_recurrence_rule(rule)
        end
        self
      end

      # Add the specified rule to the Schedule as a exception rule.
      # The rule may be a Rule object, or it may be an english String.
      def add_exception_rule_with_english(rule_or_english)
        return add_exception_rule_without_english(rule_or_english) unless rule_or_english.is_a?(String)
        rules = ::IceCube::Rule.from_english(rule_or_english, :multiple=>true)
        rules.each do |rule|
          add_exception_rule(rule)
        end
        self
      end
    end
  end
end

class IceCube::Schedule   # reopen
  include ::IceCube::English::ScheduleExtension

  alias add_recurrence_rule_without_english add_recurrence_rule
  alias add_recurrence_rule add_recurrence_rule_with_english

  alias add_exception_rule_without_english add_exception_rule
  alias add_exception_rule add_exception_rule_with_english

  alias rrule add_recurrence_rule
  alias exrule add_exception_rule
end
