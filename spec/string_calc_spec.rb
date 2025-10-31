require 'spec_helper'
require_relative '../lib/string_calc'

RSpec.describe StringCalc do
  let(:calculator) { StringCalculator.new }
  
    it 'returns the num itself for a single num' do
    calculator = StringCalc.new
    expect(calculator.add("1")).to eq(1)
    end

    it 'returns sum of two comma-separated numbers' do
    calculator = StringCalc.new
    expect(calculator.add("1,2")).to eq(3)
    end

    it 'returns sum of multiple comma-separated numbers' do
    calculator = StringCalc.new
    expect(calculator.add("1,2,3,4,5")).to eq(15)
    end
end