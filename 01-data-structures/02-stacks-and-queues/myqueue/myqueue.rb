class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @count = 0
  end

  def enqueue(element)
    @queue[@count] = element
    @tail = @queue[@count]
    if @count == 0
    		@head = @queue[@count]
    end
    @count =+ 1
  end

  def dequeue
    temp = @head
    @count -= 1

    @queue[@count] = nil
    @head = @queue[0]

    if @count <= 1
      @tail = @queue[0]
    end
    return temp
  end

  def empty?
    if @head == nil
      return true
    else
      return false
    end
  end
end
