# frozen_string_literal: true

# Lt: Return true if left hand side LESS THAN right hand side
RSpec.describe Cmdlet::Comparison::Lt do
  describe '#call' do
    subject { described_class.new.call(lhs, rhs) }

    context 'as number' do
      let(:lhs) { 1 }
      let(:rhs) { 1 }

      context '1 < 1' do
        it { is_expected.to be_falsey }
      end
      context '0 < 1' do
        let(:lhs) { 0 }
        it { is_expected.to be_truthy }
      end
    end
    context 'as string' do
      let(:lhs) { 'b' }
      let(:rhs) { 'b' }

      context 'b < b' do
        it { is_expected.to be_falsey }
      end
      context 'a < b' do
        let(:lhs) { 'a' }
        it { is_expected.to be_truthy }
      end
    end
  end
end
