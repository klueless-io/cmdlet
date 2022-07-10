# frozen_string_literal: true

# Sentence: Sentence case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Sentence do
  let(:value) { 'the quick brown fox jumped over the lazy dog' }

  it { is_expected.not_to be_nil }

  # title case the characters, first letter of every word, in the given 'string'
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('The Quick Brown Fox Jumped Over The Lazy Dog') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'Twenty Five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'Twenty Five 66'
  end
end
