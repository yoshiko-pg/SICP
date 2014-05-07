def pascal(num)

  prev = []
  line = [1]

  num.times do |n|
    p line.join(' ')
    line = [1]

    prev.each_cons(2){|a, b| line << a + b }
    line << 1

    prev = line.dup

  end
end

pascal(10)

# "1"
# "1 1"
# "1 2 1"
# "1 3 3 1"
# "1 4 6 4 1"
# "1 5 10 10 5 1"
# "1 6 15 20 15 6 1"
# "1 7 21 35 35 21 7 1"
# "1 8 28 56 70 56 28 8 1"
# "1 9 36 84 126 126 84 36 9 1"