# frozen_string_literal: true

# PluralizeNumberWord: Returns the plural form of the word based on a count with the count prefixed in the format &quot;3 categories&quot;
RSpec.describe Cmdlet::Inflection::PluralizeNumberWord do
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
        it { is_expected.to eq('1 person') }

        context 'when 2 people' do
          let(:count) { 2 }
          it { is_expected.to eq('2 people') }
        end
      end
    end
  end
end
