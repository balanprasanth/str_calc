require 'spec_helper'
require_relative '../lib/string_calc'

RSpec.describe StringCalc do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calc = StringCalc.new
      expect(calc.add("")).to eq(0)
    end
  end
end