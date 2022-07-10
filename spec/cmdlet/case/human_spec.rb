# frozen_string_literal: true

# Human: Human case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Human do
  let(:value) { 'the Quick brown Fox' }

  it { is_expected.not_to be_nil }

  # human will convert text to human case, aka capitalize first letter only
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('The quick brown fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'Twenty five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'Twenty five 66'
  end
end
