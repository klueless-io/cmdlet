# frozen_string_literal: true

# Snake: Snake case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Snake do
  let(:value) { 'the Quick brown Fox' }

  it { is_expected.not_to be_nil }

  # snake case the characters in the given 'string'.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the_quick_brown_fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'twenty five66',
                    'twenty_five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'twenty five 66',
                    'twenty_five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'using dash notation as input',
                    'the-quick-brown-fox66',
                    'the_quick_brown_fox66'
  end
end
