# frozen_string_literal: true

# Lte: Return true if left hand side LESS THAN or EQUAL TO right hand side
RSpec.describe Cmdlet::Comparison::Lte do
  describe '#call' do
    subject { described_class.new.call(lhs, rhs) }

    context 'as number' do
      let(:lhs) { 1 }
      let(:rhs) { 1 }

      context '1 <= 2' do
        let(:rhs) { 2 }
        it { is_expected.to be_truthy }
      end
      context '1 <= 1' do
        it { is_expected.to be_truthy }
      end
      context '0 <= 1' do
        let(:lhs) { 0 }
        it { is_expected.to be_truthy }
      end
    end
    context 'as string' do
      let(:rhs) { 'b' }

      context 'c <= b' do
        let(:lhs) { 'c' }
        it { is_expected.to be_falsey }
      end
      context 'b <= b' do
        let(:lhs) { 'b' }
        it { is_expected.to be_truthy }
      end
      context 'a <= b' do
        let(:lhs) { 'a' }
        it { is_expected.to be_truthy }
      end
    end
  end
end
