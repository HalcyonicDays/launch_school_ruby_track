# Question 1
# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = "hello world"
end

greeting

# >> An error resulting from the greeting variable never having been assigned a value,
# >> since the output of an "if false" statement will never be evaulated.

# >> Fascinating.  I knew that a variable was first initialized to nil as part of variable
# >> assignment, but I didn't realize that this was performed in a situation like this.
# >> Perhaps this is because the interpreter needs to allocate memory for the greeting
# >> variable at build-time and it needs to do that without figuring out the output of
# >> a conditional, since that if statement could be anything, and nontrivial to figure
# >> out, so the if is evauluated at run-time, but the memory has already been allocated?

# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  # => "hi there"  (umm... yes, that's correct)
puts greetings          # => { a: 'hi there'}

# Question 3
# In other practice problems, we have looked at how the scope of variables affects the
# modification of one "layer" when they are passed to another.
# To drive home the salient aspects of variable scope and modification of one scope
# by another, consider the following similar sets of code.
# What will be printed by each of these code groups?

# A) 

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "two"
puts "two is: #{two}"     # => "three"
puts "three is: #{three}" # => "one"

# Question 4
# Ben was tasked to write a simple ruby method to determine if an input string is an
# IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar
# with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number?
# that determines if a string is a numeric string between 0 and 255 as required for
# IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that there
# are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5"
# should be invalid)."
# Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end
