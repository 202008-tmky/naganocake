class Admins::GenresController < ApplicationController
  def index
	  @genres = Genre.all
	  @genre = Genre.new
  end

  def create
      @genre = Genre.new(genre_params)
      @genre.save
      redirect_to request.referer
  end

  def edit
  end

  private

  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end
end
