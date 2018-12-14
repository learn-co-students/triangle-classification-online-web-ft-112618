class Triangle
  class TriangleError < StandardError 
  end

  attr_reader :sides

  def initialize(a, b, c)
    @sides = [a,b,c]
  end  

  def kind
    raise TriangleError if invalidTriangle?
    case self.sides.uniq.length
    when 1
      :equilateral
    when 2
      :isosceles    
    else
      :scalene
    end

  end

  def invalidTriangle?
    true if self.sides.any?(0) ||
      self.sides[0] + self.sides[1] <= self.sides[2] ||
      self.sides[1] + self.sides[2] <= self.sides[0] ||
      self.sides[2] + self.sides[0] <= self.sides[1]
  end
end
