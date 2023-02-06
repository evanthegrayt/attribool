# frozen_string_literal: true

module Attribool
  class Value
    def initialize(value, condition = nil)
      ValidatorService.call(:condition, condition)
      @value = value
      @condition = condition
    end

    def to_boolean
      !!(@condition ? @condition.call(@value) : @value)
    end
  end
end
