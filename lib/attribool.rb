# frozen_string_literal: true

require_relative "attribool/version"
require_relative "attribool/value"
require_relative "attribool/attribute"
require_relative "attribool/validators"
require_relative "attribool/reader_name"
require_relative "attribool/attribute_list"
require_relative "attribool/validator_service"
require_relative "attribool/validators/condition_validator"
require_relative "attribool/validators/method_name_validator"
require_relative "attribool/validators/nil_attribute_validator"
require_relative "attribool/validators/strict_boolean_validator"
require_relative "attribool/validators/attribute_list_validator"

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
    ValidatorService.call(:method_name, method_name, attributes.size)

    AttributeList.build(*attributes, method_name: method_name).each do |attribute|
      define_method(attribute.reader) do
        instance_variable_get(attribute.ivar).then do |value|
          ValidatorService.call(:nil_attribute, attribute.ivar, value, allow_nil)

          Value.new(value, condition).to_boolean
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
    AttributeList.build(*attributes).each do |attribute|
      define_method(attribute.writer) do |value|
        ValidatorService.call(:strict_boolean, value, strict)

        instance_variable_set(attribute.ivar, Value.new(value).to_boolean)
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
