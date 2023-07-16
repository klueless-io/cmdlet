# frozen_string_literal: true

# FormatJson: FormatJson will take an object and write it out as pretty JSON
RSpec.describe Cmdlet::Misc::FormatJson do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  describe '#call' do
    subject { instance.call(value) }

    let(:value) { nil }

    context 'safely handle nil' do
      it { is_expected.to eq('{}') }
    end

    context 'when value is hash' do
      let(:value) { { the: 'quick', brown: 'fox' } }

      it { is_expected.to eq("{\n  \"the\": \"quick\",\n  \"brown\": \"fox\"\n}") }
    end
  end
end
