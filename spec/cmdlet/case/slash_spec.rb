# frozen_string_literal: true

# Slash: Slash case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Slash do
  let(:value) { 'the quick brown fox' }

  it { is_expected.not_to be_nil }

  # slash case the characters in the given 'string'.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the/quick/brown/fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty Five66',
                    'twenty/Five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty Five 66',
                    'twenty/Five66'
  end
end
