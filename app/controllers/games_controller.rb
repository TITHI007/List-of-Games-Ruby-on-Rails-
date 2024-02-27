class GamesController < ApplicationController
  def index
    # params[:search_term]
    @search_term=params[:search_term]
    if @search_term!=nil
      @games = Game.search(@search_term)
    else
      @games = Game.all
    end
  end
  def show
    @game_=Game.find(params[:id]) 
    puts @game_
  end
end