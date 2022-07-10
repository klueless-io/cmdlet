# frozen_string_literal: true

# Ordinal: The suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th
RSpec.describe Cmdlet::Inflection::Ordinal do
  describe '#call' do
    subject { described_class.new.call(value) }

    it_behaves_like :nil_results_in_empty

    context 'when integer' do
      context 'when 1' do
        let(:value) { 1 }
        it { is_expected.to eq('st') }
      end
      context 'when 2' do
        let(:value) { 2 }
        it { is_expected.to eq('nd') }
      end
      context 'when 3' do
        let(:value) { 3 }
        it { is_expected.to eq('rd') }
      end
      context 'when 4' do
        let(:value) { 4 }
        it { is_expected.to eq('th') }
      end
      context 'when 1001' do
        let(:value) { 1001 }
        it { is_expected.to eq('st') }
      end
    end

    context 'when string number' do
      context 'when 1' do
        let(:value) { '1' }
        it { is_expected.to eq('st') }
      end
    end
  end
end
