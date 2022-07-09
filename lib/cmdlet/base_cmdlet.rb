# frozen_string_literal: true

module Cmdlet
  # base cmdlet provides an interface for cmdlets
  class BaseCmdlet
    def call(value)
      value
    end

    # String tokenizer will clean up a string so that
    # all sorts of case formatted strings can be
    # represented in a consistent fashion
    def tokenizer
      @_tokenizer ||= Funcky.configuration.tokenizer
    end
  end
end
