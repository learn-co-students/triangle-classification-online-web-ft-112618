class Triangle

  attr_accessor :a, :b, :c #:equilateral, :isosceles, :scalene

  def initialize(a,b,c)
    # hash.each do |method, value|
    #   self.send("#{method}=", value)
    # end
    @a = a
    @b = b
    @c = c
  end


  def kind
    self.validate
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end


  def validate
    if a <= 0 || b <= 0 || c <= 0
      raise TriangleError
    elsif a + b <= c || a + c <= b || b + c <= a
      raise TriangleError
    else
      true
    end 
  end


  class TriangleError < StandardError

  end

end
