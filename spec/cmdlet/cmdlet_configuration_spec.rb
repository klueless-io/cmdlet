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
end
