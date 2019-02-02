require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @items = Array.new(size)
    @number_of_values = 0
    @max_load_factor = 0.7
    @new_array = []
  end

  def []=(key, value)
    #set

    new_item = Node.new(key, value)
    i = index(key, @size)
    new_link = Node.new(key, value)

    #COLLISION!
    @items[i] != nil ? list = @items[i] : list = LinkedList.new

    list.add_to_tail(new_link)
    @items[i] = list
    @number_of_values = @number_of_values + 1

    #Resize the hash if the load factor grows too large
    if load_factor.to_f > @max_load_factor.to_f
      resize
    end
  end

  def [](key)
    #get
    list = @items.at(index(key, @size))
    if list != nil
      current = list.head
      while current != nil
        if current.key == key
          return current.value
        end
          current = current.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor

      @number_of_values / self.size.to_f
      #number of entries occupied / number of buckets
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    new_hash = Array.new(@size)
    (0..@items.length - 1).each do |i|
      list = @items[i]
      if list != nil
        current = list.head
        new_index = index(current.key, new_hash.size)
        while current != nil
          list = LinkedList.new
          list.add_to_tail(current)
          new_hash[new_index] = list
          current = current.next
        end
      end
    end
    @items = new_hash
  end
end
