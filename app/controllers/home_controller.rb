class HomeController < ApplicationController

  def index
    @movies = Movie.search(params[:search])
  end
end
