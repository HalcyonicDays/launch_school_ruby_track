# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title and occupation.

def greetings(name, job_details)
  "Hello, #{name.join(' ')}! Nice to have a #{job_details[:title]} " +
  "#{job_details[:occupation]} around."
end

def clean_greetings(name, job_details)
  full_name = name.join(' ')
  profession = "#{job_details[:title]} #{job_details[:occupation]}"
  "Hello, #{full_name}! Nice to have a #{profession} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) ==
  "Hello, John Q Doe! Nice to have a Master Plumber around."
p clean_greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) ==
  "Hello, John Q Doe! Nice to have a Master Plumber around."

# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.

def twice(number)
  is_double?(number.to_s) ? number : number * 2
end

def is_double?(number)
  return false if number.length.odd?
  number.slice!(0..number.length / 2 - 1) == number
end

puts "twice tests:"
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument. You may assume that
# the argument will always be a valid integer that is greater than 0.

def sequence(int)
  (int..-1).to_a + (1..int).to_a
  int > 0 ? (1..int).to_a : (int..1).to_a
end

puts "sequence tests:"
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-3)
