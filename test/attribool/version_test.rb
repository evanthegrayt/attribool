# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/attribool/version'

class Attribool::VersionTest < Test::Unit::TestCase
  def test_version_exists_and_follows_semantiv_versioning
    assert Attribool::VERSION
    assert_match Attribool::Version.to_s, Attribool::VERSION
  end

  def test_to_a
    assert_instance_of(Array, Attribool::Version.to_a)
    assert_equal(
      [
        Attribool::Version::MAJOR,
        Attribool::Version::MINOR,
        Attribool::Version::PATCH
      ],
      Attribool::Version.to_a
    )
  end

  def test_to_h
    assert_instance_of(Hash, Attribool::Version.to_h)
    assert_equal(
      {
        major: Attribool::Version::MAJOR,
        minor: Attribool::Version::MINOR,
        patch: Attribool::Version::PATCH
      },
      Attribool::Version.to_h
    )
  end

  def test_to_s
    assert_instance_of(String, Attribool::Version.to_s)
    assert_match(/\d+\.\d+.\d+/, Attribool::Version.to_s)
  end

  def test_major
    assert_instance_of(Integer, Attribool::Version::MAJOR)
  end

  def test_minor
    assert_instance_of(Integer, Attribool::Version::MINOR)
  end

  def test_patch
    assert_instance_of(Integer, Attribool::Version::PATCH)
  end

  def test_gemfile_lock_should_contain_the_current_version
    refute_empty File.readlines(
      File.join(__dir__, '..', '..', 'Gemfile.lock')
    ).grep(
      /^\s*attribool\s+\(#{Attribool::VERSION}\)/
    )
  end
end
