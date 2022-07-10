# frozen_string_literal: true

# Dash: Dash case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Dash do
  let(:value) { 'The Quick Brown Fox' }

  it { is_expected.not_to be_nil }

  # convert to dash notation
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the-quick-brown-fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'Twenty Five66',
                    'twenty-five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'Twenty Five 66',
                    'twenty-five66'
  end
end
