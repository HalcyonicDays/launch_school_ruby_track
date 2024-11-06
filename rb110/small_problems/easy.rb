# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.
 def repeat(str, repetitions)
  repetitions.times { puts str }
 end
 repeat('Hello', 3)

 # Write a method that takes one integer argument, which may be positive,
 # negative, or zero. This method returns true if the number's absolute value
 # is odd. You may assume that the argument is a valid integer value.
def is_odd?(int)
  int % 2 == 1               # baseline
  int.remainder(2)**2 == 1   # variant 1
  int.remainder(2).abs == 1  # variant 2
end
puts is_odd?(2)   == false
puts is_odd?(5)   == true
puts is_odd?(-17) == true
puts is_odd?(-8)  == false
puts is_odd?(0)   == false
puts is_odd?(7)   == true

# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.
def stringy(int)
  pattern = '1'*int
  idx = 0
  loop do
    pattern[idx] = '0' if idx % 2 == 1
    idx += 1
    break if idx == pattern.length
  end
  pattern
end
# I was too committed to maintining the variable I was working with (pattern)
# as a String.  Had I started with an Array and then transformed it into a
# String as the final step, I would have a better time.  This highlights the
# importance of selecting the right data structure.
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
