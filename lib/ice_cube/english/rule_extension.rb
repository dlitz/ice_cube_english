require 'treetop'
require 'ice_cube'
require 'ice_cube/english/schedule_grammar'
require 'ice_cube/english/rule_grammar'

module IceCube
  module English
    module RuleExtension
      def self.included(base)
        base.extend(ClassMethods)
      end
      module ClassMethods
        # Return a new IceCube rule corresponding to the specified english string.
        #
        # If the :multiple option is set, return an Array of rules.
        def from_english(string, options={})
          if options[:multiple]
            grammar = ::IceCube::English::ScheduleGrammarParser.new
            parse_tree = grammar.parse(string.downcase)
            raise ArgumentError.new(grammar.failure_reason) unless parse_tree
            parse_tree.attribute_hashes.map{ |h| from_hash(h) }
          else
            grammar = ::IceCube::English::RuleGrammarParser.new
            parse_tree = grammar.parse(string.downcase)
            raise ArgumentError.new(grammar.failure_reason) unless parse_tree
            from_hash(parse_tree.attributes)
          end
        end
      end
    end
  end
end

class ::IceCube::Rule # reopen
  include ::IceCube::English::RuleExtension
end
