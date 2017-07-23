class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show update destroy]

  # GET /albums
  def index
    @albums = params[:artist_id].present? ? Album.where(artist_id: params[:artist_id]) : Album.all

    render json: @albums
  end

  # GET /albums/1
  def show
    if params[:artist_id].present?
      if @album.artist_id === params[:artist_id]
        render json: @album
      else
        render json: { 'error' => 'That album cannot be found for this artist' }, status: :unprocessable_entity
      end
    else
      render json: @album
    end
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def album_params
    params.require(:album).permit(:title, :artist_id, :year)
  end
end
