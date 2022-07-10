# frozen_string_literal: true

# BackSlash: Convert to back slash notation
RSpec.describe Cmdlet::Case::BackSlash do
  let(:value) { 'the quick brown fox' }

  # convert to back slash notation
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the\quick\brown\fox') }

    it_behaves_like :nil_results_in_empty

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing number supplied',
                    'Twenty Five66',
                    'Twenty\Five66'

    it_behaves_like :valid_value_will_parse_successfully,
                    'trailing space and number supplied',
                    'Twenty Five 66',
                    'Twenty\Five66'
  end
end
