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
  end
end
