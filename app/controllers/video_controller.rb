class VideoController < ApplicationController
  def current_views
    views_number = VideoDataStore.instance.get_views(current_views_params)
    render json: views_number, status: :ok
  end

  protected
  def current_views_params
    params.permit(:video_id)
  end
end

