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

def stringy(size, mode=1)
  numbers = []
  alternate = {1 => 0, 0 => 1}

  size.times do |index|
    number = index.even? ? mode : alternate[mode]
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'

# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the
# bonus should be half of the salary. If the boolean is false, the bonus
# should be 0.

def calculate_bonus(amount, bonus)
  bonus ? amount/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

def print_in_box(str)
  width = str.size + 2
  frame = "+#{'-'*width}+\n"
  padding = "|#{' '*width}|\n"
  message = "| #{str} | \n"
  puts frame + padding + message + padding + frame
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

longer_message = 'Space: the final frontier. These are the voyages of the starship Enterprise. Its five-year mission: to explore strange new worlds; to seek out new life and new civilizations; to boldly go where no man has gone before!'

def print_in_box_trunc(str)
  wrap_limit = 80
  width = [str.size + 2, wrap_limit].min
  frame = "+#{'-'*width}+\n"
  padding = "|#{' '*width}|\n"
  message = "| #{str.slice(0, width-2)} | \n"
  puts frame + padding + message + padding + frame
end

def print_in_box_wrapped(str)
  wrap_limit = 80.0
  segments = (str.size / wrap_limit).ceil
  width = [str.size + 2, wrap_limit].min
  frame = "+#{'-'*width}+\n"
  padding = "|#{' '*width}|\n"
  message = ""
  (message << "| #{str.slice!(0, width-2)} |\n") until str.empty?
  message = message[0..-3].ljust( (wrap_limit + 2) * segments, " ").concat(" |\n")
  puts frame + padding + message + padding + frame
end

print_in_box_trunc(longer_message)
print_in_box_wrapped(longer_message)

# Write a method that takes a positive integer, n, as an argument, and
# displays a right triangle whose sides each have n stars. The hypotenuse of
# the triangle (the diagonal side in the images below) should have one end at
# the lower-left of the triangle, and the other end at the upper-right.
def triangle(size)
  1.upto(size) { |n| puts ('*' * n).rjust(size, " ") }
end

def upsidedown_triangle(size)
  size.downto(1) { |n| puts ('*' * n).rjust(size, " ") }
end
upsidedown_triangle(5)
upsidedown_triangle(9)

class Triangle
  attr_reader :size

  def initialize(size, orientation = :south_east)
    @size = size
    self.send(orientation)
  end

  def north_east
    size.downto(1) { |n| puts ('*' * n).rjust(size, " ") }
  end

  def south_east
    1.upto(size) { |n| puts ('*' * n).rjust(size, " ") }
  end

  def north_west
    size.downto(1) { |n| puts ('*' * n).ljust(size, " ") }
  end

  def south_west
    1.upto(size) { |n| puts ('*' * n).ljust(size, " ") }
  end
end

Triangle.new(5)     # default orientation - triangle corner in bottom-right
Triangle.new(5, :north_east) # triangle corner in top-right
Triangle.new(5, :north_west) # triangle corner in top-left
Triangle.new(5, :south_east) # triangle corner in bottom-right
Triangle.new(5, :south_west) # triangle corner in bottom-left

# Oh my god, why didn't I just use a Case statement!? O_O'

# Create a simple mad-lib program that prompts for a noun, a verb, an
# adjective, and an adverb and injects those into a story that you create.
def gather_inputs(inputs)
  responses = {}
  inputs.each do |input|
    puts "Enter a(n) #{input}:"
    responses[input] = gets.chomp
  end
  responses
end

def madlib(responses)
  p "Do you #{responses["verb"]} your #{responses["adjective"]} "\
  "#{responses["noun"]} #{responses["adverb"]}? That's hilarious!"
end
inputs = %w(noun verb adjective adverb)
responses = gather_inputs(inputs)
madlib(responses)
# I don't think I understood what was being asked of me here...

# Write a method that takes a positive integer as an argument and
#  returns that number with its digits reversed.
def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Write a method that takes a non-empty string argument, and returns the
# middle character or characters of the argument. If the argument has an
# odd length, you should return exactly one character. If the argument has
# an even length, you should return exactly two characters.
def center_of(str)
  ending = str.size / 2
  start = str.size.odd? ? ending : ending - 1
  str.slice(start..ending)
end

p center_of('I love Ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
