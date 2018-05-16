class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @num = -1
  end

  def push(item)
    @stack.top = @stack.push(item)
  end

  def pop
    temp = @top
    @stack[@num] = nil
    @stack.top = @stack.pop(item)
    @num -= 1
    @top = @stack[@num]
    return temp
  end

  def empty?
    if !@queue.empty?
      @queue.last
    else
      true
    end
  end
end
