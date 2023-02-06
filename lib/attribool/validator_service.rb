# frozen_string_literal: true

module Attribool
  class ValidatorService
    def self.call(validator, *args)
      new(validator, *args).validate
    end

    def initialize(validator, *args)
      @validator = ::Attribool::Validators.const_get(
        "#{validator.to_s.split("_").map(&:capitalize).join}Validator"
      ).new(*args)
    end

    def validate
      @validator.valid? || raise(@validator.error)
    end
  end
end
