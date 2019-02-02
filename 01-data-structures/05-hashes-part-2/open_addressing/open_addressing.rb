require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(@size)
    @number_of_values = 0
  end

  def []=(key, value) #finally working
    #set method

    i = index(key, @size)
    new_item = @items[i]
    if new_item.nil?
      @items[i] = Node.new(key, value)
    elsif new_item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        new_index = index(key, @size)
        break if @items[new_index] == nil
      end
      self[key] = value
    elsif new_item.key == key && new_item.value != value
      if next_open_index(i) == -1
        resize
        new_index = index(key, @size)
        @items[new_index].value = value
      else
        new_index = next_open_index(index(key, @size))
        @items[new_index] = value
      end
    end
  end

  def [](key) #works
    #retrieve / get
    i = index(key, @size)
    item = @items[i]
    if item.key != key
      @items.each do |i|
        item.next
      end
    else
      item.value
    end
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size) #working correctly
    #read hashes pt.1 for calculation, .ord or .sum for ascii
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index) #working correctly
    i = index
    while index <= (@size - 1)
      if @items[index] == nil
        return index
      elsif @items[index] != nil && index == (i - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@size - 1)
        index = 0
      else
        index = (index + 1)
      end
    end
    -1
  end


  # Simple method to return the number of items in the hash
  def size #working correctly
    @size
  end

  # Resize the hash
  def resize #working properly
    @size = @size * 2
    new_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
      new_hash[index(item.key, @size)] = item
      end
    end
    @items = new_hash
  end
end
