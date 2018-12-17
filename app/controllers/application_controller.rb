class ApplicationController < ActionController::API
  after_action :incriment_queries_counter

  protected
  def incriment_queries_counter
    ApiDataStore.instance.increment_queries_counter
  end
end
