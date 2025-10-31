require 'spec_helper'
require_relative '../lib/string_calc'

RSpec.describe StringCalc do
  let(:calculator) { StringCalc.new }
  
  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end
    
    context 'with single number' do
      it 'returns the number itself' do
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
      end
    end
    
    context 'with two numbers' do
      it 'returns their sum' do
        expect(calculator.add("1,2")).to eq(3)
        expect(calculator.add("10,20")).to eq(30)
      end
    end
    
    context 'with multiple numbers' do
      it 'returns the sum of all numbers' do
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end
    
    context 'with newline delimiter' do
      it 'handles newlines between numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end
    
    context 'with custom delimiter' do
      it 'supports custom delimiter specified at the beginning' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
      
      it 'supports different custom delimiters' do
        expect(calculator.add("//|\n1|2|3")).to eq(6)
        expect(calculator.add("//***\n1***2***3")).to eq(6)
      end
    end
    
    context 'with negative numbers' do
      it 'throws an exception for a single negative number' do
        expect { calculator.add("-1,2") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -1"
        )
      end
      
      it 'shows all negative numbers in the exception message' do
        expect { calculator.add("1,-2,3,-4") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -2, -4"
        )
      end
      
      it 'works with custom delimiter and negative numbers' do
        expect { calculator.add("//;\n1;-2;3") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -2"
        )
      end
    end
  end
end