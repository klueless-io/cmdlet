# frozen_string_literal: true

# {{camel cmdlet.name}}: {{cmdlet.function_description}}
RSpec.describe Funcky::{{camel cmdlet.category}}::{{camel cmdlet.name}} do
  let(:instance) { described_class.new }
  
  describe 'initialize' do
    subject { instance }
  
    it { is_expected.not_to be_nil }
  end

  describe '#parse' do
    subject { instance.parse(value) }

    let(:value) { nil }

    context 'safely handle nil' do
      it { is_expected.to eq('') }
    end
  end
end
