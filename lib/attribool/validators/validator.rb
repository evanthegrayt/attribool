# frozen_string_literal: true

module Attribool::Validators
  class Validator
    def self.validate(*args)
      new(*args).validate
    end

    def initialize(*)
      raise "#{self.class} is an abstract class" if base_class?
    end

    def validate
      valid? || raise(error)
    end

    def valid?
      raise NoMethodError, "Validator must implement `valid?'"
    end

    def error
      raise NoMethodError, "Validator must implement `error'"
    end

    private

    def base_class?
      instance_of?(Attribool::Validators::Validator)
    end
  end
end
