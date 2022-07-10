# frozen_string_literal: true

# Join: join an array of values with separator as a string
RSpec.describe Cmdlet::Array::Join do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  describe '#call' do
    it { expect(instance.call([1, 2, 3])).to eq('1,2,3') }
    it { expect(instance.call(%w[a b c], ' | ')).to eq('a | b | c') }
  end
end
