# frozen_string_literal: true

# Padr: take the value and give it padding on the right hand side
RSpec.describe Cmdlet::Str::Padr do
  let(:instance) { described_class.new }

  let(:value) { 'heading 1' }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  context 'when default configuration' do
    describe '#call' do
      subject { instance.call(value) }

      it { is_expected.to eq('heading 1                     ') }

      context 'safely handle nil value' do
        let(:value) { nil }

        it { is_expected.to eq('                              ') }
      end

      context 'safely handle numeric value' do
        let(:value) { 123 }

        it { is_expected.to eq('123                           ') }
      end

      context 'with additional params' do
        subject { instance.call(value, count, char) }
        let(:count) { nil }
        let(:char) { nil }

        context 'with count' do
          let(:count) { 20 }

          it { is_expected.to eq('heading 1           ') }

          context 'and char' do
            let(:char) { '-' }

            it { is_expected.to eq('heading 1-----------') }
          end
        end

        context 'with char' do
          let(:char) { '-' }

          it { is_expected.to eq('heading 1---------------------') }
        end
      end
    end
  end

  context 'when custom configuration' do
    subject { instance.call(value) }

    before do
      KConfig.configuration.cmdlet.padr_count = 15
      KConfig.configuration.cmdlet.padr_char = 'x'
    end

    after do
      KConfig.configuration.cmdlet.reset
    end

    it { is_expected.to eq('heading 1xxxxxx') }
  end
end
