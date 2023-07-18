# frozen_string_literal: true

# Omit: this content will not get written out, useful for commenting out code
RSpec.describe Cmdlet::Misc::Omit do
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
