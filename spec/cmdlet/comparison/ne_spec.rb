# frozen_string_literal: true

# Ne: Return true if left hand side is NOT equal to right hand side
RSpec.describe Cmdlet::Comparison::Ne do
  subject { described_class.new.call(lhs, rhs) }

  let(:lhs) { nil }
  let(:rhs) { nil }

  context 'nil != nil' do
    it { is_expected.to be_falsey }
  end

  context "'aaa' != 'aaa'" do
    let(:lhs) { 'aaa' }
    let(:rhs) { 'aaa' }

    it { is_expected.to be_falsey }
  end

  context ":aaa != 'aaa'" do
    let(:lhs) { :aaa }
    let(:rhs) { 'aaa' }

    it { is_expected.to be_falsey }
  end

  context "'aaa' != :aaa" do
    let(:lhs) { 'aaa' }
    let(:rhs) { :aaa }

    it { is_expected.to be_falsey }
  end

  context "'aaa' != 'AAA'" do
    let(:lhs) { 'aaa' }
    let(:rhs) { 'AAA' }

    it { is_expected.to be_truthy }
  end

  context "'aaa' != 'bbb'" do
    let(:lhs) { 'aaa' }
    let(:rhs) { 'bbb' }

    it { is_expected.to be_truthy }
  end
end
