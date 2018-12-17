class CustomerDataStore < DataStore
  def get_streams(params)
    regexp = Regexp.new("^customer_#{params["customer_id"]}_stream_[\\d]+$")
    @store.keys_by_regexp(regexp).count
  end

  def add_stream(params)
    return false if params["customer_id"].blank? || params["video_id"].blank?
    @store.fetch("customer_#{params["customer_id"]}_stream_#{params["video_id"]}", {expires_in: 6}) do
      1
    end
    true
  end
end