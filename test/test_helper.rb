require 'simplecov'

SimpleCov.start { add_filter %r{^/test/} }

require 'test/unit'
require_relative '../lib/attribool'

module TestHelper
  class Person
    extend Attribool

    attr_accessor :name
    attr_accessor :age
    attr_accessor :hair
    attr_accessor :living
    attr_accessor :homeowner

    # NOTE: Ensure both the sytax with and without the `@` prefix is tested.
    bool_accessor '@male'
    bool_writer 'living'
    bool_reader :@hair
    bool_reader :name, method: :named?
    bool_reader :age, method: :adult?, condition: ->(i) { i >= 18 }
    bool_writer :tall, strict: true
    bool_reader :name, prefix: :has
    bool_reader :homeowner, allow_nil: false
    bool_reader :name,
      method: :common_name?,
      condition: ->(n) { ["John Smith", "Jane Smith"].include?(n) }
  end
end
