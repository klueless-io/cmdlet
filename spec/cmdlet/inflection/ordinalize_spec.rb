# frozen_string_literal: true

# Ordinalize: Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.
RSpec.describe Cmdlet::Inflection::Ordinalize do
  describe '#call' do
    subject { described_class.new.call(value) }

    it_behaves_like :nil_results_in_empty

    context 'when integer' do
      context 'when 1' do
        let(:value) { 1 }
        it { is_expected.to eq('1st') }
      end
      context 'when 2' do
        let(:value) { 2 }
        it { is_expected.to eq('2nd') }
      end
      context 'when 3' do
        let(:value) { 3 }
        it { is_expected.to eq('3rd') }
      end
      context 'when 4' do
        let(:value) { 4 }
        it { is_expected.to eq('4th') }
      end
      context 'when 1001' do
        let(:value) { 1001 }
        it { is_expected.to eq('1001st') }
      end
    end

    context 'when string number' do
      context 'when 1' do
        let(:value) { '1' }
        it { is_expected.to eq('1st') }
      end
    end
  end
end
