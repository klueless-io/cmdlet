# frozen_string_literal: true

# And: Return true if **all of** the given values are truthy.
RSpec.describe Cmdlet::Comparison::And do
  let(:lhs) { nil }
  let(:rhs) { nil }

  it { is_expected.not_to be_nil }

  describe '#call' do
    subject { described_class.new.call(lhs, rhs) }

    context 'nil && nil' do
      it { is_expected.to be_falsey }
    end
    context 'data && nil' do
      let(:lhs) { 'data' }
      it { is_expected.to be_falsey }
    end
    context 'nil && data' do
      let(:rhs) { 'data' }
      it { is_expected.to be_falsey }
    end
    context 'data && data' do
      let(:lhs) { 'data' }
      let(:rhs) { 'data' }
      it { is_expected.to be_truthy }
    end
  end
end
