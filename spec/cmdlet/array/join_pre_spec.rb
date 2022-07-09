# frozen_string_literal: true

# JoinPre: join an array of values with separator as a string and using the separator at the beginning of string
RSpec.describe Cmdlet::Array::JoinPre do
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
