# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require './lib/rubocop/cop/style/raise_exception.rb'

describe RuboCop::Cop::Style::RaiseException do
  subject(:cop) { described_class.new }

  it 'reports an offense for a raise with variables' do
    inspect_source(cop, 'raise e, msg')
    expect(cop.offenses.size).to eq(1)
  end

  it 'reports an offense for a raise with variables' do
    inspect_source(cop, 'raise Error, msg')
    expect(cop.offenses.size).to eq(0)
  end

  it 'reports an offense for a raise with variables' do
    inspect_source(cop, 'raise "my error", msg')
    expect(cop.offenses.size).to eq(0)
  end
end
