# frozen_string_literal: true

# Constant: Constant case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Constant do
  let(:value) { 'the quick brown fox' }

  it { is_expected.not_to be_nil }

  # CONSTANT case the characters in the given 'string'.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('THE_QUICK_BROWN_FOX') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'TWENTY_FIVE66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'TWENTY_FIVE66'
  end
end
