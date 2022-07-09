# frozen_string_literal: true

RSpec.describe Cmdlet::BaseCmdlet do
  let(:subject) { described_class.new }

  describe 'initialize' do
    it { is_expected.not_to be_nil }

    describe '#tokenizer' do
      it { is_expected.to respond_to(:tokenizer) }
    end
  end
end
