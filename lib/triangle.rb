class Triangle
  attr_accessor :length1, :length2, :length3, :lengths

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
    @lengths = [self.length1, self.length2, self.length3]
  end

  def kind
    if length1 <= 0 || length2 <= 0 || length3 <= 0
      raise TriangleError
    elsif (length1 + length2) <= length3 || (length1 + length3) <= length2 || (length2 + length3) <= length1
      raise TriangleError
    elsif length1 == length2 && length1 == length3
      :equilateral
    elsif length1 == length2 || length1 == length3 || length2 == length3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Not a vaild triangle"
    end
  end
end
