class GenresController < ApplicationController
	def show
		  @genres = Genre.all.where(is_active: true)
		  @genre = Genre.find(params[:id])
	end
end
