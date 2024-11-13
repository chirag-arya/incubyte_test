class StringCalculatorsController < ApplicationController
  def add
    numbers = params[:numbers]

    # Check if numbers parameter is present
    if numbers.blank?
      @error = "Input is empty"
      puts "Setting error: #{@error}"
    else
      # Call the StringCalculator's add method
      begin
        @result = StringCalculator.add(numbers)
      rescue => e
        @error = e.message
      end
    end
    puts "Rendering add view"
    respond_to do |format|
      format.html { render :add } # Explicitly render the 'add' view
    end
  end

end
