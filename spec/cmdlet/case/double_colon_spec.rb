# frozen_string_literal: true

# DoubleColon: Double colon case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::DoubleColon do
  let(:value) { 'the quick brown fox' }

  it { is_expected.not_to be_nil }

  # double_colon notation for the characters in the given 'string'. aka ruby namespace
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the::quick::brown::fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'twenty::five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'Twenty Five 66',
                    'Twenty::Five66'
  end
end
