# frozen_string_literal: true

module Attribool::Validators
  module Validator
    module ClassMethods
      def validate(*args)
        new(*args).validate
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def validate
      valid? || raise(error)
    end
  end
end
