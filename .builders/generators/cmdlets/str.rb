# frozen_string_literal: true

KManager.action :string_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :str)
      .cmdlet do
        name :padl
        description           'take the value and give it padding on the left hand side'
        result                "the value padded on LHS with [char (default ' ')] and [count (default 30)]"

        parameter             :value, 'value to apply padding to', param_type: 'String|Symbol|Int'
        parameter             :count, 'how much padding to apply. defaults to configuration.padl_count', param_type: 'Int', default: 'nil'
        parameter             :char , 'character to pad with. defaults to configuration.padl_char', param_type: 'String', default: 'nil'

        ruby <<-RUBY
        value = '' if value.nil?
        count = KConfig.configuration.cmdlet.padl_count if count.nil?
        count = count.to_i if count.is_a?(String)
        char = KConfig.configuration.cmdlet.padl_char if char.nil?
        value.to_s.rjust(count, char)
        RUBY
      end
      .cmdlet do
        name :padr
        description           'take the value and give it padding on the right hand side'
        result                "the value padded on RHS with [char (default ' ')] and [count (default 30)]"

        parameter             :value, 'value to apply padding to', param_type: 'String|Symbol|Int'
        parameter             :count, 'how much padding to apply. defaults to configuration.padr_count', param_type: 'Int', default: 'nil'
        parameter             :char , 'character to pad with. defaults to configuration.padr_char', param_type: 'String', default: 'nil'

        ruby <<-RUBY
        value = '' if value.nil?
        count = KConfig.configuration.cmdlet.padr_count if count.nil?
        count = count.to_i if count.is_a?(String)
        char = KConfig.configuration.cmdlet.padr_char if char.nil?
        value.to_s.ljust(count, char)
        RUBY
      end
      .generate
      # .debug
  end
end
