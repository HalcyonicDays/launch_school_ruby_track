# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  arr[1..-1].push(arr[0])
end

puts "rotation 1 tests:"
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

puts "bonus tests:"
p rotate_string('abc') == 'bca'
p rotate_integer(12345) == 23451

# Write a method that can rotate the last n digits of a number. For example:

def rotate_rightmost_digits(number, last_n)
  static = number.to_s[0...-last_n]
  rotating = number.to_s[-last_n..-1]
  rotated = rotate_string(rotating)
  (static + rotated).to_i
end

puts "rotation 2 tests:"
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation
of that argument. You can (and probably should) use the rotate_rightmost_digits
method from the previous exercise.

Note that you do not have to handle multiple 0s.
=end
def max_rotation(number)
  rotatable = number.to_s.chars
  rotatable.size.times do |start_idx|
    static  = rotatable.first(start_idx)
    rotated = rotate_array(rotatable[start_idx..-1])
    rotatable = static + rotated
  end
  rotatable.join.to_i
end

puts "rotation 3 tests:"
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row
of switches and toggle every one of them. You go back to the beginning, and
on this second pass, you toggle switches 2, 4, 6, and so on. On the third
pass, you go back again to the beginning and toggle switches 3, 6, 9, and so
on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an
Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

  round 1: every light is turned on
  round 2: lights 2 and 4 are now off; 1, 3, 5 are on
  round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
  round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
  round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
=end

def n_switchs(total_lights)
  switches = Array.new(total_lights + 1, false)
  1.upto(total_lights) do |pass|
    switches.each_with_index do |state, idx|
      switches[idx] = toggle_switch(state) if (idx % pass == 0)
    end
  end

  lit_lights = []
  switches[0..total_lights + 1].each_with_index do |state, idx| 
    next if idx.zero?
    lit_lights << idx if state
  end
  lit_lights
end

def toggle_switch(state)
  state = !state
end

p n_switchs(5)  == [1, 4]
p n_switchs(10) == [1, 4, 9]
p n_switchs(1000) == [
  1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 
  225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
  729, 784, 841, 900, 961
]

# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

def diamond(odd_int)

end

diamond(1)
diamond(3)
diamond(5)
diamond(9)
=begin
* (1x1)

 * (3x3)
***
 *

  * (5x5)
 ***
*****
 ***
  *
=end
