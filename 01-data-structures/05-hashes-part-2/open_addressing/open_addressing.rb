require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    #set method
    #COMPUTE the hash code for key, ASSIGN to index
    i = 0
    while((@items[i] != nil) && (@items[i] != nil))
        i += 1
      if(@items[i] == @items.last)
        resize
        #CALL INSERT(KEY, VALUE)
        return
      end
    end
    #SET array[index] to the new key and value
  end

  def [](key)
    #retrieve / get

    key = @items[i]
    while(@items[i] != nil)
      if(@items[i].key = key)
        @items[i].value
      else
        nil
      end
    end
    i = (i + 1) % size
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    #read hashes pt.1 for calculation, .ord or .sum for ascii
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(slot)
    i = 0
    while(@items[i] != nil && @items[i].slot != slot)
      if @items[i] != nil
        i += 1
      else
        slot = @items[i]
      end
      i = (i + 1) % size
    end
    return i
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_size = (size * 2)
    new_items = Array.new(new_size)

    if @max_load_factor > 0.7
      resize
    end
  end
end
