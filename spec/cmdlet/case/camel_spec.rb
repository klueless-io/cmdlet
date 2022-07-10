# frozen_string_literal: true

# Camel: Camel case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Camel do
  let(:value) { 'the quick brown fox' }

  it { is_expected.not_to be_nil }

  # camel case the characters in the given 'string'.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('TheQuickBrownFox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'TwentyFive66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'TwentyFive66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'alpha-numeric coded value with word separation',
                    'p02_ef4',
                    'P02Ef4'

    it_behaves_like :valid_value_will_parse_successfully,
                    'alpha-numeric coded value without word separation',
                    'p02ef4',
                    'P02ef4'
  end
end
