# Question 1
# Every object in Ruby has access to a method called object_id, which returns
# a numerical value that uniquely identifies the object. This method can be used
# to determine whether two variables are pointing to the same object.
# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id  # => some_id_1
puts b.object_id  # => some_id_2
puts c.object_id  # => some_id_1 (same as a)

# Question 2
# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# => these all share one object_id because there's only one instance of the number 42

# Question 3
# Let's call a method, pass two strings as arguments and see how they can be 
# treated differently depending on the method invoked on them inside the method
# definition. Study the following code and state what will be displayed...and why:

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"
# >> string_arg_one => pumpkins
# >> string_arg_two => pumpkinsrutabaga
# >> param_one is reassigned, so it's reference to its initial value is effectively
# >> broken, meanwhile param_two retains its reference, so it's modified by the
# >> methods and "rutabaga" is appended directly onto the existing String object

# Question 4
# To drive that last one home...let's turn the tables and have the string show
# a modified output, while the array thwarts the method's efforts to modify the
# user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# >> pumpkinsrutabaga
# >> ["pumpkins"]

# Question 5
# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# >> pumpkins
# >> ["pumpkins", "rutabaga"]

# Whether the above "coincidentally" does what we think we wanted depends upon
# what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for
# the next programmer to maintain? That is, the resulting method should not mutate
# either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array
# should be set to ['pumpkins', 'rutabaga']

def cleaner_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = cleaner_method(my_string, my_array)

# I'm tempted to create a "module Rutabagable" to solve this problem, although I don't
# know what its purpose would be, so it's probably best not to.

# Question 6
# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid?(color)
  color == "blue" || color == "green"
end

