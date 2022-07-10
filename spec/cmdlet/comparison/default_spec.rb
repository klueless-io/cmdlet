# frozen_string_literal: true

# Default: Return true if **all of** the given values are truthy.
RSpec.describe Cmdlet::Comparison::Default do
  describe '#call' do
    subject { described_class.new.call(*values) }

    context 'only default value provided' do
      let(:values) { ['happy'] }

      it { is_expected.to eq('happy') }
    end

    context 'value and default value' do
      let(:values) { [value, default_value] }
      let(:value) { 'sad' }
      let(:default_value) { 'happy' }

      it { is_expected.to eq('sad') }

      context 'when first value is missing' do
        let(:value) { nil }

        it { is_expected.to eq('happy') }
      end
    end

    context 'list of values and default value' do
      let(:values) { [david, lisa, ben, default_value] }
      let(:david) { nil }
      let(:lisa) { nil }
      let(:ben) { nil }
      let(:default_value) { 'happy' }

      context 'default group emotion' do
        it { is_expected.to eq('happy') }

        context 'group emotion when ben is mad' do
          let(:ben) { 'mad' }

          it { is_expected.to eq('mad') }

          context 'and lisa is sad' do
            let(:lisa) { 'sad' }

            it { is_expected.to eq('sad') }
          end
        end
      end
    end
  end
end
