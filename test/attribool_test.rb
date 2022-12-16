# frozen_string_literal: true

require_relative "test_helper"

class AttriboolTest < Test::Unit::TestCase
  def setup
    @person = TestHelper::Person.new
  end

  def test_bool_reader_method_name_exceptions
    assert_raise(ArgumentError) do
      TestHelper::Person.bool_reader :t1, :t2, method_name: :will_raise
    end
    assert_nothing_raised { TestHelper::Person.bool_reader :t3, :t4 }
    assert_nothing_raised do
      TestHelper::Person.bool_reader :t5, :t6, method_name: ->(v) { "#{v}?" }
    end
  end

  def test_bool_reader
    @person.hair = nil
    refute(@person.hair?)
    assert_equal(false, @person.hair?)
    @person.hair = "brown"
    assert(@person.hair?)
    assert_equal(true, @person.hair?)
  end

  def test_bool_reader_with_method
    @person.name = nil
    refute(@person.named?)
    assert_equal(false, @person.named?)
    @person.name = "John Smith"
    assert(@person.named?)
    assert_equal(true, @person.named?)
    assert_equal("John Smith", @person.name)
  end

  def test_bool_reader_with_condition
    @person.age = 17
    refute(@person.adult?)
    assert_equal(false, @person.adult?)
    @person.age = 18
    assert(@person.adult?)
    assert_equal(true, @person.adult?)
    refute(@person.common_name?)
    @person.name = "John Smith"
    assert(@person.common_name?)
  end

  def test_bool_writer
    @person.living = "truthy"
    assert_equal(true, @person.instance_variable_get(:@living))
  end

  def test_bool_writer_with_nil_false
    assert_raise(TypeError) { @person.homeowner? }
    @person.homeowner = true
    assert_nothing_raised { @person.homeowner? }
  end

  def test_bool_writer_with_strict
    assert_raise(ArgumentError) { @person.tall = "truthy" }
    assert_nothing_raised { @person.tall = true }
  end

  def test_bool_accessor
    refute(@person.male?)
    @person.male = "truthy"
    assert_equal(true, @person.instance_variable_get(:@male))
    assert(@person.male?)
  end
end
