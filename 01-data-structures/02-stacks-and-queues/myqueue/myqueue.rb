class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    if @head != @queue[0]
    		@queue += @queue(element)
    else
    		@head
    end
  end

  def dequeue
    @queue.delete_if { |i| i == 0 }
  end

  def empty?
    if @head == nil
      return true
    else
      return false
    end
  end
end
