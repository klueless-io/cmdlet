# frozen_string_literal: true

RSpec.describe Cmdlet::CmdletConfiguration do
  let(:instance) { described_class.new }

  subject { instance }

  it do
    is_expected.to have_attributes(
      tokenizer: be_a(Cmdlet::StringTokenizer),
      padl_count: 30,
      padl_char: ' ',
      padr_count: 30,
      padr_char: ' '
    )
  end

  context 'when altered' do
    before do
      instance.padl_count = 20
      instance.padl_char = '-'
      instance.padr_count = 20
      instance.padr_char = '-'
    end

    it do
      is_expected.to have_attributes(
        padl_count: 20,
        padl_char: '-',
        padr_count: 20,
        padr_char: '-'
      )
    end

    context 'when reset' do
      before { instance.reset }

      it do
        is_expected.to have_attributes(
          padl_count: 30,
          padl_char: ' ',
          padr_count: 30,
          padr_char: ' '
        )
      end
    end
  end
end
