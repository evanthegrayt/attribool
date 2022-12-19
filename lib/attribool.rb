# frozen_string_literal: true

require_relative "attribool/version"
require_relative "attribool/attribute"
require_relative "attribool/reader_name"
require_relative "attribool/attribute_list"
require_relative "attribool/validators/validator"
require_relative "attribool/validators/method_name_validator"
require_relative "attribool/validators/nil_attribute_validator"
require_relative "attribool/validators/strict_boolean_validator"

##
# Adds macros for dealing with boolean attributes.
#
# @example
#   require "attribool"
#   class Person
#     extend Attribool
#     attr_accessor :name
#     bool_reader :name
#   ends
#   person = Person.new
#   person.name?
#   # false, because @name is nil.
#   person.name = "John Smith"
#   person.name
#   # "John Smith"
#   person.name?
#   # true, because @name is truthy.
module Attribool
  ##
  # Creates methods that return a boolean for attributes that may or may not be
  # booleans themselves. Multiple readers can be created at once
  #
  # @param [Symbol, String] *attributes
  #
  # @kwarg [Boolean] allow_nil
  #
  # @kwarg [Proc] condition
  #
  # @kwarg [Symbol, String, Proc] method_name
  def bool_reader(*attributes, allow_nil: true, method_name: nil, condition: nil)
    Validators::MethodNameValidator.validate(method_name, attributes.size)

    AttributeList.new(*attributes, method_name: method_name).each do |attribute|
      define_method(attribute.reader) do
        instance_variable_get(attribute.ivar).then do |value|
          Validators::NilAttributeValidator.validate(attribute.ivar, value, allow_nil)

          !!(condition ? condition.call(value) : value)
        end
      end
    end
  end

  ##
  # Creates a writer for boolean attributes. Always coerces to boolean based
  # on truthiness.
  #
  # @param [Symbol, String] *attributes
  #
  # @kwarg [Boolean] strict
  def bool_writer(*attributes, strict: false)
    AttributeList.new(*attributes).each do |attribute|
      define_method(attribute.writer) do |value|
        Validators::StrictBooleanValidator.validate(value, strict)

        instance_variable_set(attribute.ivar, !!value)
      end
    end
  end

  ##
  # Creates a simple reader and writer for booleans. This should only be used
  # when the attribute should only ever be +true+ or +false+.
  #
  # @param [Symbol, String] *attributes
  def bool_accessor(*attributes)
    bool_reader(*attributes)
    bool_writer(*attributes)
  end
end
