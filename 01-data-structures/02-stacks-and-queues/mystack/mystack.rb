class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @num = -1
  end

  def push(item)
    @top = item
    @num += 1
    @stack[@num] = @top
  end

  def pop
    temp = @top
    @stack[@num] = nil
    @num -= 1
    @top = @stack[@num]
    return temp
  end

  def empty?
    if @num < 0
      return true
    else
      return false
    end
  end
end
