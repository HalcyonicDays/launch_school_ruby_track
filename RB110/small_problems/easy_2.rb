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
