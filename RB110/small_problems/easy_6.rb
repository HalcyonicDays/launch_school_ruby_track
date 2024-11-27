# Write a method that takes a floating point number that represents an angle between
# 0 and 360 degrees and returns a String that represents that angle in degrees,
# minutes and seconds. You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes, and a double quote (") to represent seconds.
# A degree has 60 minutes, while a minute has 60 seconds

DEGREE = "\u00B0"

def dms(value)
  value = value % 360
  degrees = value.floor
  floaty_minutes = 60 * (value - degrees)
  minutes = floaty_minutes.floor
  seconds = (60 * (floaty_minutes - minutes)).round(2)
  # This is to fix
  if minutes == 60
    degrees += 1
    minutes = 0
  end
  if seconds == 60
    minutes += 1
    seconds = 0
  end
  "#{degrees}#{DEGREE}#{sprintf("%02d",minutes)}'#{sprintf("%02d",seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")

# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
def remove_vowels(arr)
  arr.map { |word| word.delete('aeiouAEIOU') }
end

puts "remove vowel test: "
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that
the first 2 numbers are 1 by definition, and each subsequent number is the sum of the
two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at
an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes
6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that
has the number of digits specified as an argument. (The first Fibonacci number has index 1.)
=end
=begin
def find_fibonacci_index_by_length(target_length)
  idx = 1
  fib_length = 0
  fib_num = 1
  last_num = 1

  while fib_length < target_length
    current_num = fib_num + last_num
    fib_num = last_num
    last_num = current_num
    
    fib_length = fib_num.to_s.length
    idx += 1
  end
  idx
end

puts "find fibonacci test: "
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

def reverse!(list)
  start_idx = 0
  end_idx = -1

  (list.size/2.0).ceil.times do
    list[start_idx], list[end_idx] = list[end_idx], list[start_idx]
    start_idx += 1
    end_idx -= 1
  end

  list
end

puts "reverse arrays 1 tests: "
list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = [1, 2, 3, 4, 1]
result = reverse!(list)
p result == [1, 4, 3, 2, 1] # true
p list == [1, 4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
=end

# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

def reverse(list)
  reversed_list = []
  
  (list.size - 1).downto(0) { |idx| reversed_list << list[idx] }

  reversed_list
end

puts "reverse arrays 2 tests: "
p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse(['abc']) == ['abc']                   # => true
p reverse([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true


def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

puts "merge test:"
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of
# the original Array, respectively. If the original array contains an odd number
# of elements, the middle element should be placed in the first half Array.

def halvsies(list)
  half_length = (list.length / 2.0).ceil
  first_half = list[0...half_length]
  second_half = list[half_length..list.length]
  [first_half, second_half]
end

puts "halvsies tests:"
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halvsies([5]) == [[5], []] # true
p halvsies([]) == [[], []] # true
