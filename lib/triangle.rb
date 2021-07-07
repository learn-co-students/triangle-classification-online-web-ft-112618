class Triangle

attr_accessor :length_1, :length_2, :length_3

def initialize(length_1, length_2, length_3)
  @length_1 = length_1
  @length_2 = length_2
  @length_3 = length_3
end

def kind
 validate_triangle
  if length_1 == length_2 && length_1 == length_3
    :equilateral
  elsif length_1 != length_2 && length_1 != length_3 && length_2 != length_3
    :scalene
  else
    :isosceles
  end
end

def validate_triangle
  real_triangle = [(length_1 + length_2 > length_3), (length_2 + length_3 > length_1), (length_3) + (length_1) > (length_2)]
  [length_1, length_2, length_3].each {|s| real_triangle << false if s <= 0}
  raise TriangleError if real_triangle.include?(false)
end 

class TriangleError < StandardError
end


end
