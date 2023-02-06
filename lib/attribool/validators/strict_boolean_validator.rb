# frozen_string_literal: true

module Attribool::Validators
  class StrictBooleanValidator
    def initialize(value, strict)
      @value = value
      @strict = strict
    end

    def valid?
      !@strict || [TrueClass, FalseClass].include?(@value.class)
    end

    def error
      ArgumentError.new("#{@value} is not a boolean")
    end
  end
end
