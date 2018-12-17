Rails.application.routes.draw do
  post "customer/add_stream"
  get "customer/current_streams"
  get "video/current_views"
  get "api/queries_count"
end