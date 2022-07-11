# frozen_string_literal: true

# {{camel cmdlet.name}}: {{cmdlet.description}}
RSpec.describe Handlebarsjs::Helpers::{{camel cmdlet.category}}::{{camel cmdlet.name}} do
  let(:helper_name) { :{{cmdlet.name}} }
  let(:helper) { described_class.new }
  let(:handlebars) { Handlebarsjs::Handlebars.new }
  
  before { handlebars.handlebars_snapshot.add_helper(helper_name, helper) }

  describe '#process_template' do
    subject { handlebars.process_template(template, data).squish }

    let(:lhs) { nil }
    let(:rhs) { nil }
    let(:data) { { lhs: lhs, rhs: rhs } }

    let(:template) do
      <<~TEXT.chomp
        {{#if (and lhs rhs)}}
        {{^}}
        {{/if}}
      TEXT
    end
  end
end
