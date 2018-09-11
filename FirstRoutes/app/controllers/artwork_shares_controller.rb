class ArtworkShareController < ApplicationController
  def create
    share = ArtworkShare.new(clean_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])
    if share
      render json: share
      share.destroy
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  private

  def clean_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
