# frozen_string_literal: true

KManager.action :misc_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :misc)
      .cmdlet do
        name :safe
        description           'pass through the value with <> and single and double quotes left as is'
        result                'the value with <> and single and double quotes left as is'

        parameter             :values, 'valure to pass throught', param_type: 'String|Int'

        ruby <<-RUBY
          value = '' if value.nil?
          value
        RUBY
      end
      .generate
      # .debug
  end
end
