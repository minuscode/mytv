class HomeController < ApplicationController

  def index
    @movies = params[:search].present? ? Movie.where(:title => params[:search]) : Movie.all
  end
end
