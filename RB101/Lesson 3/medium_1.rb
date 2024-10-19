# Question 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from 
# back in the days before computers had video screens).
# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line
# indented 1 space to the right:

=begin
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end
chant = 'The Flintstones Rock!'
10.times{ |n| puts chant.rjust(chant.size + n) }
10.times{ |n| puts "#{' ' * n}" + chant }

# Question 2
# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
# >> Integer cannot be coerced into String
# >> this can be fixed by converting the integer into String, for example:
"#{(40 + 2)}"
(40 + 2).to_s

# Question 3
# Alan wrote the following method, which was intended to show
# all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Alyssa noticed that this will fail if the input is 0, or
# a negative number, and asked Alan to change the loop. 
# How can you make this work without using the begin/end until
# construct? Note that we're not looking to find the factors for 0
# or negative numbers, but we just want to handle it gracefully
# instead of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end



# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# >> Take the modulus (remainder) of <number>.  If the remainder is '0', then
# >> the divisor divides evenly into the number, and is therefore a factor.
# >> Note: I suppose this is also a way to test if an integer-division operation
# >> would return an integer without using float-division.

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the 
# method (the factors before the method's end)?
# >> this returns the list of factors, as the final line of a method is implicitly
# >> returned if the method doesn't explicitly return elsewhere in the method.

# Question 4
# Alyssa was asked to write an implementation of a rolling buffer. 
# Elements are added to the rolling buffer and if the buffer becomes full, then
# new elements that are added will displace the oldest elements in the buffer.
# She wrote two implementations saying, "Take your pick. Do you like << or +
# for modifying the buffer?". Is there a difference between the two, other
# than what operator she chose to use to concatenate an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# >> The first implementation (with <<) modified the buffer in-place.  As a result,
# >> the final line returning the new buffer is unnecessary since it has already
# >> been modified.  The method name might be worth changing to "update_buffer" to
# >> make it more clear that this method mutates the "buffer" argument.
# >> The second implementation (using +) creates a new "buffer" variable which
# >> the method returns.

# Question 5
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the
# sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it, he
# got an error. Something about the limit variable. What's wrong with the code?
# How would you fix this so that it works?
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# >> The limit variable is inaccessible (out of scope) for the "fib" method.
# >> This can be fixed by adding "limit" as another parameter/argument for the
# >> "fib" method.

# Question 6
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)
p answer - 8
# >> new_answer equals 50
# >> answer still equals 42, so [p answer - 8] => 34

# Question 7
# One day Spot was playing with the Munster family's home computer and 
# he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" =>   { "age" => 32,  "gender" => "male" },
  "Lily" =>     { "age" => 30,  "gender" => "female" },
  "Grandpa" =>  { "age" => 402, "gender" => "male" },
  "Eddie" =>    { "age" => 10,  "gender" => "male" },
  "Marilyn" =>  { "age" => 23,  "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa
# could stop him, he hit the Enter key with his tail:
mess_with_demographics(munsters)
# Did the family's data get ransacked? Why or why not?
# >> yes, because hash operations are a destructive operation, and the list of
# >> values provided by demo_hash.values retain their references to their original
# >> hashes.

# Question 8
# Method calls can take expressions as arguments. Suppose we define a method 
# called rps as follows, which follows the classic rules of rock-paper-scissors
# game: it returns the winning fist or, in the case of a tie, the fist that both
# players played.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?
puts rps(
  rps(
    rps("rock", "paper"),     # => "paper"
    rps("rock", "scissors")   # => "rock"
    ),                        # => "paper"
  "rock")                     # => "paper"
# => paper

# Question 9
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?
bar(foo)
# => "no"
# >> foo is called with default parameters, but this doesn't really matter since
# >> it returns "yes" no matter what.  Bar is called with "yes" as the param, which
# >> means param is not equal to "no", so we evaluate the false clause, which is "no"
