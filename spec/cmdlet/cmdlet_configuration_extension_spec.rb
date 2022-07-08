# frozen_string_literal: true

RSpec.describe Cmdlet::CmdletConfigurationExtension do
  let(:k_config) { KConfig }

  let(:cfg) { ->(config) {} }

  let(:instance) { k_config.configuration }

  before :each do
    k_config.configure(&cfg)
  end
  after :each do
    k_config.reset
  end

  context 'sample usage' do
    subject { instance.cmdlet }
    let(:cfg) do
      lambda do |config|
        config.cmdlet.padl_count = 5
        config.cmdlet.padl_char = '-'
        config.cmdlet.padr_count = 6
        config.cmdlet.padr_char = '*'
      end
    end

    it do
      is_expected.to have_attributes(
        padl_count: 5,
        padl_char: '-',
        padr_count: 6,
        padr_char: '*'
      )
    end
  end
end
