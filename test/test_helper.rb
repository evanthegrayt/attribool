# frozen_string_literal: true

require 'simplecov'

SimpleCov.start { add_filter %r{^/test/} }

require 'test/unit'
require_relative '../lib/attribool'

module TestHelper
  class Person
    extend Attribool

    attr_reader :living
    attr_accessor :name
    attr_accessor :age
    attr_accessor :hair
    attr_accessor :homeowner

    bool_accessor '@male'
    bool_writer 'living'
    bool_reader :@hair
    bool_reader :name, method_name: ->(m) { "#{m}d?" }
    bool_reader :age, method_name: :adult?, condition: ->(i) { i >= 18 }
    bool_writer :tall, strict: true
    bool_reader :homeowner, allow_nil: false
    bool_reader :name,
      method_name: :common_name?,
      condition: ->(n) { ['John Smith', 'Jane Smith'].include?(n) }
  end
end
