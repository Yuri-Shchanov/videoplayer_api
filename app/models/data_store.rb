class DataStore
  include Singleton

  def initialize
    case Rails.configuration.cache_store
      when :redis_store
        @store = RedisStore.instance
      else
        @store = MemoryStore.instance
    end
  end
end