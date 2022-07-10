# frozen_string_literal: true

# Or: Return true if any value is truthy.
RSpec.describe Cmdlet::Comparison::Or do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  describe '#call' do
    it { expect(instance.call(nil)).to be_falsey }
    it { expect(instance.call(nil, nil)).to be_falsey }
    it { expect(instance.call(nil, 1, nil)).to be_truthy }
  end
end
