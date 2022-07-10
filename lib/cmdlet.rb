# frozen_string_literal: true

# require 'k_log'
require 'k_config'
require 'active_support/core_ext/integer/inflections'

require_relative 'cmdlet/version'
require_relative 'cmdlet/configuration'
require_relative 'cmdlet/base_cmdlet'
require_relative 'cmdlet/string_tokenizer'

require_relative 'cmdlet/_'

module Cmdlet
  # raise Cmdlet::Error, 'Sample message'
  Error = Class.new(StandardError)

  # Your code goes here...
end

if ENV.fetch('KLUE_DEBUG', 'false').downcase == 'true'
  namespace = 'Cmdlet::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('cmdlet/version') }
  version   = Cmdlet::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
