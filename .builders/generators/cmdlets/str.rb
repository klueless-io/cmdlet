# frozen_string_literal: true

KManager.action :string_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :str)
      .cmdlet do
        name :padl
        description           'pass through the value with <> and single and double quotes left as is'
        result                'the value with <> and single and double quotes left as is'

        parameter             :value, 'value to apply padding to', param_type: 'String|Symbol|Int'
        parameter             :count, 'how much padding to apply. defaults to configuration.padl_count', param_type: 'Int'
        parameter             :char , 'character to pad with. defaults to configuration.padl_char', param_type: 'String'

        ruby <<-RUBY
          value = '' if value.nil?
          # count = Handlebars::Helpers.configuration.padl_count if count.nil?
          count = 30 if count.nil?
          count = count.to_i if count.is_a?(String)
          # char = Handlebars::Helpers.configuration.padl_char if char.nil?
          char = ' ' if char.nil?
          value.to_s.rjust(count, char)
        RUBY
      end
      .generate
      # .debug
  end
end
