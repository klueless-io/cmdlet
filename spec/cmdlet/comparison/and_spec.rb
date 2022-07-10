# frozen_string_literal: true

# And: Return true if **all of** the given values are truthy.
RSpec.describe Cmdlet::Comparison::And do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  describe '#call' do
    subject { instance.call(*values) }

    context 'handle nil' do
      let(:values) { nil }

      it { is_expected.to be_falsey }
    end

    context 'all values are truthy' do
      let(:values) { [0, 1, 2] }

      it { is_expected.to be_truthy }
    end

    context 'some values are truthy' do
      let(:values) { [nil, 1, 2] }

      it { is_expected.to be_falsey }
    end
  end
end
