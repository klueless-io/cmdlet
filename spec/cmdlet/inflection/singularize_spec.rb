# frozen_string_literal: true

# Singularize: The reverse of #pluralize, returns the singular form of a word in a string
RSpec.describe Cmdlet::Inflection::Singularize do
  let(:value) { 'octopi' }

  it { is_expected.not_to be_nil }

  # The reverse of #pluralize, returns the singular form of a word in a string
  describe '#call' do
    subject { described_class.new.call(value) }

    it { is_expected.to eq('octopus') }

    context 'when :symbol' do
      let(:value) { :octopi }

      it { is_expected.to eq('octopus') }
    end
  end
end
