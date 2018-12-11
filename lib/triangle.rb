class Triangle
  attr_accessor :x, :y, :z

  def initialize(x,y,z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    validate_triangle
    
    if @x == @y && @x == @z
      :equilateral
    elsif @x != @y && @x == @z || @x == @y && @x != @z || @y == @z && @y != @x
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    if @x <= 0 || @y <= 0 || @z <= 0 || @x + @y <= @z || @x + @z <= @y || @y + @z <= @x
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end
