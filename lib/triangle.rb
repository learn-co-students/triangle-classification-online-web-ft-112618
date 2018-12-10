require "pry"

class Triangle
  attr_accessor :length1, :length2, :length3, :lengths

  def initialize(arg1, arg2, arg3)
    @length1, @length2, @length3 = arg1, arg2, arg3
    @lengths = [self.length1, self.length2, self.length3]
  end

  def kind
    if self.lengths.any?{|l| l >= (self.lengths.reduce(&:+) - l)} || self.lengths.any?{|l| l == 0}
      begin
        raise TriangleError
      rescue => e
        puts e.backtrace
        puts e.message
        raise
      end
    elsif self.lengths.uniq.size == 1
      :equilateral
    elsif self.length1 == self.length2 || self.length2 == self.length3 || self.length1 == self.length3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "My dude, this is no triangle! Either one of the sides has a length of 0 or one of the sides is larger than the sum of the other two!"
      "Learn your math, my man!"
    end
  end
end
