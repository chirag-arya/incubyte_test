require 'rails_helper'

RSpec.describe StringCalculatorsController, type: :controller do
  render_views
  
  describe "GET #add" do
    context "when the input is empty" do
      it "returns an error message" do
        get :add, params: { numbers: "" }
        expect(response.body).to include("Input is empty")
      end
    end

    context "when the input uses default delimiters" do
      it "returns the sum of numbers separated by commas" do
        get :add, params: { numbers: "1,2,3" }
        expect(response.body).to include("Result: 6")
      end

      it "returns the sum of numbers separated by newlines" do
        get :add, params: { numbers: "1\n2\n3" }
        expect(response.body).to include("Result: 6")
      end
    end

    context "when the input uses custom delimiters" do
      it "returns the sum of numbers with a custom delimiter" do
        get :add, params: { numbers: "//;\n1;2;3" }
        expect(response.body).to include("Result: 6")
      end

      it "returns the sum of numbers with another custom delimiter" do
        get :add, params: { numbers: "//|\n1|2|3" }
        expect(response.body).to include("Result: 6")
      end
    end

    context "when the input contains negative numbers" do
      it "returns an error message with a list of negative numbers" do
        get :add, params: { numbers: "1,-2,3" }
        expect(response.body).to include("Negative numbers not allowed: -2")
      end

      it "raises an error message when multiple negative numbers are present" do
        get :add, params: { numbers: "//;\n1;-2;3;-4" }
        expect(response.body).to include("Negative numbers not allowed: -2, -4")
      end
    end
  end
end
