# frozen_string_literal: true

# Eq: Return true if two values are equal
RSpec.describe Cmdlet::Comparison::Eq do
  describe '#call' do
    subject { described_class.new.call(lhs, rhs) }

    let(:lhs) { nil }
    let(:rhs) { nil }

    context 'nil == nil' do
      it { is_expected.to be_truthy }
    end

    context "'aaa' == 'aaa'" do
      let(:lhs) { 'aaa' }
      let(:rhs) { 'aaa' }

      it { is_expected.to be_truthy }
    end

    context ":aaa == 'aaa'" do
      let(:lhs) { :aaa }
      let(:rhs) { 'aaa' }

      it { is_expected.to be_truthy }
    end

    context "'aaa' == :aaa" do
      let(:lhs) { 'aaa' }
      let(:rhs) { :aaa }

      it { is_expected.to be_truthy }
    end

    context "'aaa' == 'AAA'" do
      let(:lhs) { 'aaa' }
      let(:rhs) { 'AAA' }

      it { is_expected.to be_falsey }
    end

    context "'aaa' == 'bbb'" do
      let(:lhs) { 'aaa' }
      let(:rhs) { 'bbb' }

      it { is_expected.to be_falsey }
    end
  end
end
