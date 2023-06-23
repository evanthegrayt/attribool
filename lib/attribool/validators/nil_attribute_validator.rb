# frozen_string_literal: true

module Attribool::Validators
  ##
  # Ensures that a value is not +nil+, unless +nil+ is allowed as a value.
  class NilAttributeValidator
    ##
    # Construct the validator.
    #
    # @param [String, Symbol] ivar
    #
    # @param [Object] value
    #
    # @param [Boolean] allow_nil
    def initialize(ivar, value, allow_nil)
      @ivar = ivar
      @value = value
      @allow_nil = allow_nil
    end

    ##
    # Do we either allow values to be +nil+, or is the value not +nil+?
    #
    # @return [Boolean]
    def valid?
      @allow_nil || !@value.nil?
    end

    ##
    # The exception to raise if validations fail.
    #
    # @return [TypeError] the exception with message
    def error
      TypeError.new("#{@ivar} is nil")
    end
  end
end
