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
    @array = params[:array]
    # @message = gen_message(@attempt, @letters)

  end

  # def english?(word)
  #   url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  #   serialized_file = URI.open(url).read
  #   word = JSON.parse(serialized_file)
  #   return word["found"]
  # end
end
