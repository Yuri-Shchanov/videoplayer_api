class VideoDataStore < DataStore
  def get_views(params)
    regexp = Regexp.new("^customer_[\\d]+_stream_#{params["video_id"]}$")
    @store.keys_by_regexp(regexp).count
  end
end