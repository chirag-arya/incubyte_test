# spec/lib/string_calculator_spec.rb
require 'rails_helper'

RSpec.describe StringCalculator, type: :lib do
  describe ".add" do
    context "when the input is empty" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "when the input uses default delimiters (comma, newline)" do
      it "returns the sum of numbers separated by commas" do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end

      it "returns the sum of numbers separated by newlines" do
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
      end

      it "handles mixed delimiters (comma and newline)" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "when the input uses a custom delimiter" do
      it "returns the sum of numbers separated by a semicolon" do
        expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      end

      it "returns the sum of numbers separated by a pipe" do
        expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
      end
    end

    context "when the input contains negative numbers" do
      it "raises an error with a list of negative numbers" do
        expect { StringCalculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
      end

      it "raises an error when multiple negative numbers are present" do
        expect { StringCalculator.add("//;\n1;-2;3;-4") }.to raise_error("Negative numbers not allowed: -2, -4")
      end
    end
  end
end
