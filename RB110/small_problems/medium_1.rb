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

=begin
# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

Problem: draw a symetrical nxn diamond where n is an odd number

input : odd integer
output: draw drawn to console with asterisks

Examples:
(3x3)
 *
***
 *

(5x5)
  *
 ***
*****
 ***
  *

Requirements:
- output some number of diamonds on each row
  - starting with 1, and increasing by 2 until reaching the max size
  - once at max size, decrease back down to 1
  - diamond-line must be centered

Data Structure: n/a? a loop

Algorithm:
- iterate up from 1 max size
- at each step, output that number of stars, centered
- then iterate back down to 1
- a single loop can be used if the +/- operator is switch halfway through
  - this has the advantage of using a single loop to count up and down
=end

STAR = '*'
def diamond(max_size)
  puts "#{max_size}x#{max_size} diamond:"
  amount = 1
  operator = :+
  rows = 0
  
  loop do
    star_pattern = STAR * amount
    
    puts (star_pattern).center(max_size)
    amount = amount.send(operator, 2)
    operator = :- if amount == max_size
    
    rows += 1
    break if rows == max_size
  end
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)

def hollow_diamond(max_size)
  puts "#{max_size}x#{max_size} hollow diamond:"
  amount = 1
  operator = :+
  rows = 0
  
  loop do
    max_stars  = [amount, 2].min
    min_spaces = [amount-2,0].max
    star_pattern = (STAR * max_stars).split('').join(' ' * min_spaces)

    puts (star_pattern).center(max_size)
    amount = amount.send(operator, 2)
    operator = :- if amount == max_size
    
    rows += 1
    break if rows == max_size
  end
end
=begin
  Since using the #send method should rightfully raise a few eyebrows, please
  enjoy this more sensible (and readable) version below:
  Note: original version is preserved above as a cautionary tale.

  ascending? = true
  amount = (ascending? ? amount + 2 : amount - 2)
  ascending? = false if amount == max_size

  This replaces:

  operator = :+
  amount = amount.send(operator, 2)
  operator = :- if amount == max_size
=end

hollow_diamond(1)
hollow_diamond(3)
hollow_diamond(5)
hollow_diamond(7)
hollow_diamond(9)

=begin

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

=end

class Minilang
  def initialize()
    @register = 0
    @stack = []
  end

  def execute(commands)
    stack = []
    chunks = commands.split

    chunks.each do |command|
      if is_number?(command)
        self.register = command.to_i
        next
      else
        send(interpret(command))
        # method(interpret(command)).call
      end
    end
    nil
  end

  private
    attr_accessor :register, :stack
    class InvalidEntry < NameError; end

    def interpret(command)
      case command
      when 'PUSH'  then :minilang_push
      when 'POP'   then :minilang_pop
      when 'ADD'   then :minilang_add
      when 'SUB'   then :minilang_sub
      when 'MULT'  then :minilang_mult
      when 'DIV'   then :minilang_div
      when 'MOD'   then :minilang_mod
      when 'PRINT' then :minilang_print
      else              :invalid_command
      end
    end

    def is_number?(value)
      value == value.to_i.to_s 
    end

    def invalid_command
      raise InvalidEntry
    end

    def minilang_push
      stack << register
    end

    def minilang_pop
      self.register = stack.pop
    end

    def minilang_add
      self.register = register + minilang_pop
    end

    def minilang_sub
      self.register = register - minilang_pop
    end

    def minilang_mult
      self.register = register * minilang_pop
    end

    def minilang_div
      self.register = register / minilang_pop
    end

    def minilang_mod
      self.register = register % minilang_pop
    end

    def minilang_print
      puts register
    end
end

=begin
Minilang.new.execute('PRINT')
#=> 0

Minilang.new.execute('5 PUSH 3 MULT PRINT')
#=> 15

Minilang.new.execute('5 PRINT PUSH 3 PRINT ADD PRINT')
#=> 5
#=> 3
#=> 8

Minilang.new.execute('5 PUSH POP PRINT')
# 5

Minilang.new.execute('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
#=> 5
#=> 10
#=> 4
#=> 7

Minilang.new.execute('3 PUSH PUSH 7 DIV MULT PRINT ')
#=> 6

Minilang.new.execute('4 PUSH PUSH 7 MOD MULT PRINT ')
#=> 12

Minilang.new.execute('-3 PUSH 5 SUB PRINT')
#=> 8

Minilang.new.execute('6 PUSH')
# (nothing printed; no PRINT commands)
=end
# Minilang.new.execute('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD PRINT SUB PRINT DIV PRINT')
#=> 8
# Minilang.new.execute('MOO')
#=> Minilang::InvalidEntry

# Write a method that takes a sentence string as input, and returns the same string with
# any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
# 'eight', 'nine' converted to a string of digits.

NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  str.split.map do |word|
    clean_word = word.downcase.gsub(/[^a-z]/, '')
    if NUMBERS.include?(clean_word)
      NUMBERS.index(clean_word).to_s + word.gsub(clean_word, '')
    else
      word
    end
  end.join(' ')
end

def word_to_digit(str)
  str.split.map do |word|
    clean_word = word.downcase.gsub(/[^a-z]/, '')
    if NUMBERS.include?(clean_word)
      NUMBERS.index(clean_word).to_s + word.gsub(clean_word, '')
    else
      word
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 
  'Please call me at 5 5 5 1 2 3 4. Thanks.'

# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
# number is the sum of the two previous numbers: the 3rd Fibonacci number is
# 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end
# 1, 1, 2, 3, 5, 8, 13
puts "fibonacci (recursive) tests:"
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
