# frozen_string_literal: true

module Cmdlet
  # Register this configuration access extension for Cmdlet configuration
  module CmdletConfigurationExtension
    def cmdlet
      return @cmdlet if defined? @cmdlet

      @cmdlet = CmdletConfiguration.new
    end
  end

  # Structure for storing Cmdlet configuration
  class CmdletConfiguration
    include KLog::Logging

    attr_accessor :tokenizer
    attr_accessor :padl_count
    attr_accessor :padl_char
    attr_accessor :padr_count
    attr_accessor :padr_char

    def initialize
      @tokenizer = Cmdlet::StringTokenizer.new

      reset
    end

    def reset
      @padr_count = 30
      @padr_char = ' '
      @padl_count = 30
      @padl_char = ' '
    end
  end
end

KConfig::Configuration.register(:cmdlet, Cmdlet::CmdletConfigurationExtension)
