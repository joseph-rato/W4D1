class ArtworksController < ApplicationController
  def index
    artworks = Artwork.all
    render json: artworks
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def create
    artwork = Artwork.new(clean_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.update(clean_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      render plain: 'Its gone!'
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private
  def clean_params
    params.require(:artwork).permit(:image_url, :title, :artist_id)
  end
end
