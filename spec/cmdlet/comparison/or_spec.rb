# frozen_string_literal: true

# Or: Return true if any value is truthy.
RSpec.describe Cmdlet::Comparison::Or do
  subject { described_class.new.call(lhs, rhs) }

  let(:lhs) { nil }
  let(:rhs) { nil }

  describe '#call' do
    context 'nil || nil' do
      it { is_expected.to be_falsey }
    end
    context 'data || nil' do
      let(:lhs) { 'data' }
      it { is_expected.to be_truthy }
    end
    context 'nil || data' do
      let(:rhs) { 'data' }
      it { is_expected.to be_truthy }
    end
    context 'data || data' do
      let(:lhs) { 'data' }
      let(:rhs) { 'data' }
      it { is_expected.to be_truthy }
    end
  end
end
