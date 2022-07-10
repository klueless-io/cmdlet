# frozen_string_literal: true

# Lower: Lower case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Lower do
  let(:value) { 'The Quick Brown Fox' }

  it { is_expected.not_to be_nil }

  # Downcase/Lowercase all of the characters in the given string.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('the quick brown fox') }

    it_behaves_like :nil_results_in_empty
  end
end
