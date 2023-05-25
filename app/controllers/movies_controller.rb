class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

end
