class CustomerController < ApplicationController
  def add_stream
    if CustomerDataStore.instance.add_stream(add_stream_params)
      render status: :ok
    end
  end

  def current_streams
    streams_number = CustomerDataStore.instance.get_streams(current_streams_params)
    render json: streams_number, status: :ok
  end

  protected
  def add_stream_params
    params.permit(:customer_id, :video_id)
  end

  def current_streams_params
    params.permit(:customer_id)
  end
end

