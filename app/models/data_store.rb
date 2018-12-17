class DataStore
  include Singleton

  def initialize
    cache_store = Rails.configuration.cache_store
    store_name = cache_store.is_a?(Array)? cache_store.first : cache_store
    case store_name
      when :redis_cache_store
        @store = Services::RedisStore.instance
      else
        @store = Services::MemoryStore.instance
    end
  end
end
