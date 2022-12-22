# frozen_string_literal: true

module Attribool::Validators
  class ConditionValidator < Attribool::Validators::Validator
    def initialize(condition)
      @condition = condition
      super
    end

    def valid?
      @condition.nil? || @condition.is_a?(Proc)
    end

    def error
      ArgumentError.new("Condition is not a proc")
    end
  end
end
