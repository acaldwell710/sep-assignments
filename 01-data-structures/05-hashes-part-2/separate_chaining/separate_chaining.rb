require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @number_of_values = 0
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

  # Calculate the current load factor
  def load_factor
    buckets = 5
    k = 5
    calc = (number_of_values / buckets) - k
    return calc
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    new_size = size * 2
    new_items = Array.new(new_size)

    if max_load_factor > 0.7
      resize
    end
  end
end
