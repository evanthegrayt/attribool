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
    MAJOR = 0

    ##
    # Minor version.
    #
    # @return [Integer]
    MINOR = 0

    ##
    # Patch version.
    #
    # @return [Integer]
    PATCH = 2

    ##
    # Version as +MAJOR.MINOR.PATCH+
    #
    # @return [String]
    def self.to_s
      "#{MAJOR}.#{MINOR}.#{PATCH}"
    end
  end
end
