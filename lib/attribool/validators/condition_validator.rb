# frozen_string_literal: true

module Attribool::Validators
  class ConditionValidator
    def initialize(condition)
      @condition = condition
    end

    def valid?
      @condition.nil? || @condition.is_a?(Proc)
    end

    def error
      ArgumentError.new("Condition is not a proc")
    end
  end
end
