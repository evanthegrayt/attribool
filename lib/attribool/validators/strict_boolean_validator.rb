# frozen_string_literal: true

module Attribool::Validators
  ##
  # Ensures that a value is a boolean, unless strictness isn't enforced.
  class StrictBooleanValidator
    ##
    # Construct the validator.
    #
    # @param [Object] value
    #
    # @param [Boolean] strict
    def initialize(value, strict)
      @value = value
      @strict = strict
    end

    ##
    # Is +strict+ set to +false+, or is +@value+ a boolean?
    #
    # @return [Boolean]
    def valid?
      !@strict || [TrueClass, FalseClass].include?(@value.class)
    end

    ##
    # The exception to raise if validations fail.
    #
    # @return [ArgumentError] the exception with message
    def error
      ArgumentError.new("#{@value} is not a boolean")
    end
  end
end
