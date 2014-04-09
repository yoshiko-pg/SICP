class Numeric

  # 平方根を求める
  def square_root(guess)
    if (guess - self.improve_sqrt(guess)).abs < 0.001
      guess
    else
      self.square_root(self.improve_sqrt(guess))
    end
  end

  def improve_sqrt(guess)
    (guess + (self / guess)) / 2
  end

  def sqrt
    self.square_root(1.0)
  end

  # 立方根を求める
  def cube_root(guess)
    if (guess - self.improve_cube(guess)).abs < 0.001
      guess
    else
      self.cube_root(self.improve_cube(guess))
    end
  end

  def improve_cube(guess)
    ( (self / guess.square) + guess * 2) / 3
  end
  
  def cube
    self.cube_root(1.0)
  end

  # 確認用メソッド
  def square
    self * self
  end

  def triple
    self * self * self
  end

  def test_square
    self.sqrt.square
  end

  def test_cube
    self.cube.triple
  end

end

puts 1000.test_square
puts 123456.test_square
puts 9999999.test_square
puts (0.01).test_square

puts 1000.test_cube
puts 123456.test_cube
puts 9999999.test_cube
puts (0.01).test_cube
