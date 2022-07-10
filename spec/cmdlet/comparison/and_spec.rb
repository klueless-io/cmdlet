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

    it { expect(instance.call(nil)).to be_falsey }
    it { expect(instance.call(0, 1, 2, 3)).to be_truthy }
    it { expect(instance.call(nil, 2, 3, 3)).to be_falsey }
  end
end
