# frozen_string_literal: true

# Safe: pass through the value with &lt;&gt; and single and double quotes left as is
RSpec.describe Cmdlet::Misc::Safe do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  describe '#call' do
    subject { instance.call(value) }

    let(:value) { nil }

    context 'safely handle nil' do
      it { is_expected.to eq('') }
    end
  end
end
