# frozen_string_literal: true

module Attribool::Validators
  class NilAttributeValidator
    include Validator

    def initialize(ivar, value, allow_nil)
      @ivar = ivar
      @value = value
      @allow_nil = allow_nil
    end

    def valid?
      @allow_nil || !@value.nil?
    end

    def error
      TypeError.new("#{@ivar} is nil")
    end
  end
end
