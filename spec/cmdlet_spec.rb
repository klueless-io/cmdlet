# frozen_string_literal: true

RSpec.describe Cmdlet do
  it 'has a version number' do
    expect(Cmdlet::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise Cmdlet::Error, 'some message' }
      .to raise_error('some message')
  end
end
