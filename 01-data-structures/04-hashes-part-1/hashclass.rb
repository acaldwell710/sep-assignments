class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = item
    elsif @items[i].key != item.key
      self.resize
      self[key] = value
    elsif @items[i].value != item.value
      self.resize
      @items[i] = value
    end
  end


  def [](key)
    @items[self.index(key, self.size)].value
  end

  def resize
    old_items = @items.compact
    @items = Array.new(self.size * 2)
    old_items.each do |item|
      self[item.key] = item.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
