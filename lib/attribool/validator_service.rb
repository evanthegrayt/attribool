# frozen_string_literal: true

module Attribool
  ##
  # A simple interface to run validators, which should implement a +valid?+
  # method which returns true if conditions are valid, and an +error+ method
  # which returns an exception class and message to be raised when validations
  # fail.
  class ValidatorService
    ##
    # Run the validator.
    #
    # @param [Symbol] validator_name
    #
    # @param [Object] *args to be forwarded to validator
    def self.call(validator_name, *args)
      new(::Attribool::Validators.fetch(validator_name), *args).validate
    end

    ##
    # Construct the service and inject the validator.
    #
    # @param [Class] Validator
    #
    # @param [Object] *args
    def initialize(validator, *args)
      @validator = validator.new(*args)
    end

    ##
    # Raises the validator's exception unless its conditions are met.
    #
    # @return [Boolean]
    #
    # @raise [Exception] if validation fails
    def validate
      @validator.valid? || raise(@validator.error)
    end
  end
end
