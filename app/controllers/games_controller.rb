require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    i = 0
    while i < 10
      @letters << ('A'..'Z').to_a.sample
      i += 1
    end
  end

  def score
    @word = params[:answer].upcase
    @letters = params[:array].split(", ")
    @message = gen_message(@word, @letters)

  end

  def english?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    serialized_file = URI.open(url).read
    word = JSON.parse(serialized_file)
    return word["found"]
  end

  def within_grid(attempt, grid)
    new_array = []
    attempt_array = attempt.upcase.chars
    if attempt_array.all? { |letter| grid.include?(letter) }
      grid.each do |e|
        new_array << e if attempt_array.include?(e)
      end
      return attempt_array.size <= new_array.size
    else
      return false
    end
  end

  def gen_message(attempt, letters)
    if english?(attempt) == true
      if within_grid(attempt, letters) == true
        return "Congratulations! #{@word} is a valid English word!"
      else
        return "Sorry, but #{@word} can't be built out of #{params[:array]}."
      end
    else
      return "Sorry, but #{@word} is not an English word."
    end
  end
end
