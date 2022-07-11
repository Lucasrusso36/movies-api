class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :update, :destroy]

  # GET /films
  def index
    @films = @user.films.search(params[:title]).sorted_by_title

    render json: @films
  end

  # GET /films/1
  def show
    render json: @film
  end

  # POST /films
  def create
    @film = @user.films.new(film_params)

    if @film.save
      render json: @film, status: :created, location: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /films/1
  def update
    if @film.update(film_params)
      render json: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # DELETE /films/1
  def destroy
    @film.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_params
      params.require(:film).permit(:title, :description, :author, :category_id, :user_id, :image)
    end
end
