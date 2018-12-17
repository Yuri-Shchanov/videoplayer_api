class MemoryStore
  include Singleton

  def keys_by_regexp(regexp)
    data = Rails.cache.instance_variable_get(:@data)
    # На тестах попробовать искать с помощью bsearch. Сначала отсортировать.
    data.keys.select do |key|
      regexp =~ key && read(key, {raw: true}).present?
    end
  end

  def read(key, options = nil)
    Rails.cache.read(key, options)
  end

  def read_multi(keys)
    Rails.cache.read_multi(*keys)
  end

  def fetch(key, options = nil, &block)
    Rails.cache.fetch(key, options, &block)
  end

  def increment(key, value, options = nil)
    Rails.cache.increment(key, value, options)
  end
end