# frozen_string_literal: true

# Pluralize: Returns the plural form of the word in the string
RSpec.describe Cmdlet::Inflection::Pluralize do
  let(:value) { 'octopus' }

  it { is_expected.not_to be_nil }

  # Returns the plural form of the word in the string
  describe '#call' do
    subject { described_class.new.call(value) }

    it_behaves_like :nil_results_in_empty

    it { is_expected.to eq('octopi') }

    context 'when :symbol' do
      let(:value) { :octopus }

      it { is_expected.to eq('octopi') }
    end
  end
end
