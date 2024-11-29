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



# Given an unordered array and the information that exactly one value in the array
# occurs twice (every other value occurs exactly once), how would you determine
# which value occurs twice? Write a method that will find and return the duplicate
# value that is known to be in the array.

def find_dup(arr)
  while arr.size > 0
    elm = arr.pop
    return elm if arr.include?(elm)
  end
end

puts "duplicates tests:"
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it
# is not. You may not use the Array#include? method in your solution.

def include?(arr, target)
  arr.each { |elm| return true if elm == target }
  false
end

puts "include? tests:"
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
=begin
I would expect array2 to retain a connection to the values referenced in array2, and so any mutation
of the values in array1 would likewise mutate array2.  If I imagine the element "Curly" as some
object that *happens to* resemble a String, it's a little easier to reason about this.
array1 contains a list containing some number of objects.  Those objects are copied over to array2.
If the object itself is mutated, and each array is just holding on to a reference to that object,
then any change in one array should be reflected in the other.
The output I expect is: [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]
=end
puts array2