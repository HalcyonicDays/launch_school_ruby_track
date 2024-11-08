# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.
def teddys_age(name="Teddy")
  age = (20..200).to_a.sample
  puts "#{name} is #{age} years old!"
end

# Build a program that asks a user for the length and width of a room in
# meters and then displays the area of the room in both square meters and
# square feet.
def room_size
  puts "Please enter a room length:"
  length = gets.chomp.to_f
  puts "Please enter a room width:"
  width = gets.chomp.to_f
  puts "The room's area is #{(length * width).round(2)} meters"\
  " or #{(length * width * 10.7639).round(2)} feet"
end
# >> Note: The conversion from square meters to square feet should absolutely
# >> be extracted out to a constant.

# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

def calculate_tip(bill, tip)
  gratuity = (bill * tip / 100.0).round(2)
  total = bill + gratuity
  puts "The tip is $#{gratuity}"
  puts "The total is $#{total}"
  return gratuity, total
end

p calculate_tip(200, 15) == [30.0, 230.0]

# Build a program that displays when the user will retire and how many years
# she has to work till retirement.
def retirement(current_age, retirement_age)
  year = Time.now.year
  years_left = retirement_age - current_age
  puts "It's #{year}.  You will retire in #{year + years_left}.\n"\
  "You only have #{years_left} years of work to go!"
end
=begin
puts "What is your name?"
name = gets.chomp
if name.end_with?('!')
  message = "Hello #{name.chop}. why are we screaming?".upcase
else
  message = "Hello #{name.capitalize}"
end
puts message
=end

# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a
# separate line.
# (1..99).each { |n| puts n if n.odd? }

def sum_or_produect(target_number, response)
  case response
  when 's' then (1..target_number).inject(:+)
  when 'p' then (1..target_number).inject(:*)
  end
end
p sum_or_produect(5, 's') == 15
p sum_or_produect(6, 'p') == 720

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name 
# => BOB \n BOB
# This is because the String#Upcase! method is desctructive and mutates the value referenced by
# both 'name' and 'save_name' to be uppercase so "Bob" -> "BOB"

# Write a method that takes a number as an argument. If the argument is a positive number, return
# the negative of that number. If the number is 0 or negative, return the original number.
def negative(int)
  int > 0 ? -int : int
end

# All test cases should return true
puts negative(5)  == -5
puts negative(-3) == -3
puts negative(0)  ==  0      # There's no such thing as -0 in Ruby
