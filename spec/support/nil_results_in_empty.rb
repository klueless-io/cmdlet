# frozen_string_literal: true

RSpec.shared_examples :nil_results_in_empty do
  let(:value) { nil }

  it { is_expected.to eq('') }
end
