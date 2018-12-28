require 'pry'
class Triangle
  
  attr_accessor :side1, :side2, :side3, :equilateral, :isosceles, :scalene
 
  def initialize(side1, side2, side3)
    @side1 =side1
    @side2 = side2
    @side3 = side3
  end
  
  def kind
    #binding.pry
    if side1 == 0 || side2 == 0 || side3 == 0
      begin
         raise TriangleError
      end
    elsif side1 < 0 || side2 < 0 || side3 < 0 
      begin
        raise TriangleError
      end
    elsif side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
      begin
        raise TriangleError
      end
    elsif side1 == side2 && side2 == side3 && side3 == side1 
      :equilateral
    elsif side2 == side3 || side1 == side2 || side1 == side3 
      :isosceles
    elsif side1 != side2 && side2 != side3 && side1 != side3
      :scalene
    end
  end
  
 
  class TriangleError < StandardError
    def message
      "This is an illegal triangle"
    end
  end
  
  
end
