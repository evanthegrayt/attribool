# frozen_string_literal: true

module Attribool
  ##
  # An abstraction of any class that can convert itself to a boolean.
  class Value
    ##
    # Construct the value with an optional +Proc+ condition.
    #
    # @param [Object] value
    #
    # @param [Proc] condition (default: nil)
    def initialize(value, condition = nil)
      ValidatorService.call(:condition, condition)
      @value = value
      @condition = condition
    end

    ##
    # Convert the value or the condition to a boolean based off truthiness.
    #
    # @return [Boolean]
    def to_boolean
      !!(@condition ? @condition.call(@value) : @value)
    end
  end
end
