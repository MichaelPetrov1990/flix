class FavoritesController < ApplicationController
  before_action :require_signin, only: [:create, :destroy]
  
  def create
    @movie = Movie.find_by!(slug:(params[:movie_id]))
    @movie.favorites.create!(user: current_user)
    if current_user
      @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    movie = Movie.find(params[:movie_id])
    redirect_to movie
  end
end
