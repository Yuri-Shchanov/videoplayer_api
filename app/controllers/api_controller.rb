class ApiController < ApplicationController
  def queries_count
    render json: ApiDataStore.instance.get_recent_queries_count, status: :ok
  end
end

