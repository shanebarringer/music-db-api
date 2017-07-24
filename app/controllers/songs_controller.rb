class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs
  def index
    @songs = params[:album_id].present? ? Song.where(album_id: params[:album_id]) : Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    if params[:album_id].present?
      puts @song.inspect
      puts params[:album_id]
      if @song.album_id === params[:album_id]
        render json: @song
      else
        render json: { 'error' => 'That song cannot be found for this album' }, status: :unprocessable_entity
      end
    else
      render json: @song
    end
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:name, :artist_id, :album_id)
    end
end
