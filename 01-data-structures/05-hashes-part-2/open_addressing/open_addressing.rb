require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    key = index
    while key = @items[index] && value = @items[index]
      index += 1
      if @items.last
        resize
        []=(key, value)
      end
    end
    @items[index]
  end

  def [](key)
    key = @items[index]
    @items[index] = head
    if head != nil
      while next != nil
        if key = @items[i].key
          @items.value
        end
        @items[i] = @items[i] + 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.split("")
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if @items[index] <= 4
      @items[index]
    else @items[index] = 5
      @items[index] + 1
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    new_size = size*2
    new_items = Array.new(new_size)

    if max_load_factor > 0.7
      resize
    end
  end
end
