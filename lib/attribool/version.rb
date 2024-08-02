# frozen_string_literal: true

module Attribool
  ##
  # Module that contains all gem version information. Follows semantic
  # versioning. Read: https://semver.org/
  module Version
    ##
    # Major version.
    #
    # @return [Integer]
    MAJOR = 2

    ##
    # Minor version.
    #
    # @return [Integer]
    MINOR = 0

    ##
    # Patch version.
    #
    # @return [Integer]
    PATCH = 5

    module_function

    ##
    # Version as +[MAJOR, MINOR, PATCH]+
    #
    # @return [Array<Integer>]
    def to_a
      [MAJOR, MINOR, PATCH]
    end

    ##
    # Version as +MAJOR.MINOR.PATCH+
    #
    # @return [String]
    def to_s
      to_a.join(".")
    end

    ##
    # Version as +{major: MAJOR, minor: MINOR, patch: PATCH}+
    #
    # @return [Hash]
    def to_h
      %i[major minor patch].zip(to_a).to_h
    end
  end

  ##
  # The version, as a string.
  #
  # @return [String]
  VERSION = Version.to_s
end
