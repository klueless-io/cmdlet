# frozen_string_literal: true

# Safe: pass through the value with &lt;&gt; and single and double quotes left as is
RSpec.describe Cmdlet::Misc::Safe do
  describe '#call' do
    subject { described_class.new.call(value) }

    it_behaves_like :nil_results_in_empty

    context 'when <hello name="world" />' do
      let(:value) { '<hello name="world" />' }
      it { is_expected.to eq('<hello name="world" />') }
    end
  end
end
