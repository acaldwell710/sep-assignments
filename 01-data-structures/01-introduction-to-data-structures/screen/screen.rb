require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix =[[width],[height]]
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      @matrix[x][y] = pixel
    end
    #should have x,y coordinates & color info
  end

  def at(x, y)
    if inbounds(x,y)
      return @matrix[x][y]
    else
      nil
    end  
  end

  private

  def inbounds(x, y)
    case
    when x < 0
      in = false
    when x > @width
      in = false
    when y < 0
	    in = false
    when y > @height
	    in = false
    else
      in = true
    end
  end

end
