class StringCalculatorsController < ApplicationController
  def add
    numbers = params[:numbers]
    # Check if numbers parameter is present
    if numbers.nil? || numbers.empty?
      @error = "Input is empty"
    else
      # Call the StringCalculator's add method
      begin
        @result = StringCalculator.add(numbers)
      rescue => e
        @error = e.message
      end
    end
  end

end
