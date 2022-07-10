# frozen_string_literal: true

# Lamel: Lower camel case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Lamel do
  let(:value) { 'The quick brown fox' }

  it { is_expected.not_to be_nil }

  # lamel case is the same as camel case except with the first character as lower case
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('theQuickBrownFox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'twentyFive66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'twentyFive66'
  end
end
