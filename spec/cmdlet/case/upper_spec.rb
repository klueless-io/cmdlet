# frozen_string_literal: true

# Upper: Upper case the characters in the given &#x27;string&#x27;
RSpec.describe Cmdlet::Case::Upper do
  let(:value) { 'the quick brown fox' }

  it { is_expected.not_to be_nil }

  # Upcase/Uppercase all of the characters in the given string.
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('THE QUICK BROWN FOX') }

    it_behaves_like :nil_results_in_empty
  end
end
