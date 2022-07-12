# frozen_string_literal: true

# PluralizeNumber: Returns the plural form of the word based on a count
RSpec.describe Cmdlet::Inflection::PluralizeNumber do
  describe '#call' do
    subject { described_class.new.call(value, count) }

    let(:value) { nil }
    let(:count) { 1 }

    context 'when value not supplied' do
      it { is_expected.to eq('') }
    end

    context 'when value supplied' do
      let(:value) { 'person' }
      context 'when one person' do
        let(:count) { 1 }
        it { is_expected.to eq('person') }

        context 'when 2 people' do
          let(:count) { 2 }
          it { is_expected.to eq('people') }
        end
      end
    end
  end
end
