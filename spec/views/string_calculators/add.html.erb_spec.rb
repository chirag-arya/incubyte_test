require 'rails_helper'

RSpec.describe "string_calculators/add.html.erb", type: :view do
  context "when the calculation is successful" do
    it "displays the correct result" do
      assign(:result, 6)

      render

      expect(rendered).to include("Result: 6")
    end
  end

  context "when there is an error" do
    it "displays the error message" do
      assign(:error, "Negative numbers not allowed: -2")

      render

      expect(rendered).to include("Error: Negative numbers not allowed: -2")
    end
  end
end
