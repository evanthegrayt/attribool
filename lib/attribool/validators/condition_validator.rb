# frozen_string_literal: true

module Attribool::Validators
  ##
  # Ensures that a condition is either +nil+ or a +Proc+.
  class ConditionValidator
    ##
    # Construct the validator.
    #
    # @param [nil, Proc] condition
    def initialize(condition)
      @condition = condition
    end

    ##
    # Is the condition either +nil+ or a +Proc+?
    #
    # @return [Boolean]
    def valid?
      @condition.nil? || @condition.is_a?(Proc)
    end

    ##
    # The exception to raise if validations fail.
    #
    # @return [ArgumentError] the exception with message
    def error
      ArgumentError.new("Condition is not a proc")
    end
  end
end
