class ApiDataStore < DataStore
  def increment_queries_counter
    key = "#{Time.now.to_i}_queries"
    @store.fetch(key, {expires_in: 1.minute.seconds, raw: true}) do
      0
    end
    @store.increment(key, 1, {expires_in: 1.minute.seconds, raw: true})
  end

  def get_recent_queries_count
    regexp = Regexp.new("^[\\d]+_queries$")
    keys = @store.keys_by_regexp(regexp)
    filtered_keys = keys.select do |key|
      key.to_i > 1.minute.seconds.ago.to_i
    end
    @store.read_multi(filtered_keys).values.sum
  end
end