# Variable Shadowing
# >> this is when a variable within an inner scope shares the name of a variable in an outer
# >> scope and as a result the variable in the outer scope is no longer accessible within the 
# >> inner scope because it is essentially of a lower precedence than the variable of the same
# >> name initialized within the inner scope.  e.g.
numbers = [1, 2, 3, 4]
number = 7

numbers.each { |number| number = 1 }
puts number
# => "7" because the "number" in the block passed to each is shadowing the "number" local 
# variable initialized above, and is essentially its own variable with no relation to the 
# "number" variable a few lines above it.

numbers.each { number = 1 }
puts number  
# => "1" due to number = 7 being reassigned to number = 1 because this is the same variable
# as the one first initalized several lines earlier.

# Parameters vs Arguments
  # => Parameters are part of Method Definition
  # => Arguments are part of Method Invocation

def my_method(param_1, param_2)
  puts param_1, param_2
end
arg_1, arg_2 = nil, nil
my_method(arg_1, arg_2)

# Operator vs Method call (in Ruby)
# >> Operators perform operations on one or more operands
# >> Methods are responsible for behavior, while an operator is responsible for operations
# >> Operators can be mathematical or logical, e.g. +, -, **, %, ||, &&


# Output vs Return
# >> an output may be something like a puts statement, which generates some sort of information
# >> for the user.  A return value/object is a way for a method to complete evaluation and send a
# >> result back to the point at which the method was invoked.


# sprintf
# >> called as sprintf(formatting, value), e.g. sprintf "%.1f", 1.234 #=> "1.2"
# >> From ruby-docs: Returns the string resulting from applying the given format string to 
# >> any additional arguments.
# >> this can be similar to string interpolation "#{}", but with additional formatting options,
# >> such as rounding a number to a given number of decimal places.  This is done via conversion.
# >> For example, it's possible to use sprintf("%b") to convert a number into binary


# When can you remove the caller of method ( e.g. Kernel.puts() )?
# >> Scope!  If a method is defined with a specific scope, such as a local method,
# >> or a method that's part of a class, then that method's caller can be removed
# >> when the method remains within that scope.
# => But wait!  Then why do class variables use self.var_name for assignment?
# >> First of all, the class is using self.var_name=() as the method name, and not self.var_name(),
# >> but also, the self.var_name is necessary because otherwise it would be "var_name = value" which
# >> would be interpreted as assignment for a local variable, var_name, rather than the instance
# >> variable, @var_name.
# => would this be an example of variable shadowing? 


# YAML notes
# >> YAML is basically an externally-stored, pre-defined hash table with String keys
# >> These can be useful for configuration information, as well as storing information
# >> in a separate file (such as one that would not get uploaded to github)

=begin
Notes on Language:
- def some_method(); end
  - p some_method is actually two method calls because it is a syntatic sugar
  - for "p( some_method() )"

- $var is a global variable.  Really?  I thought GLOBAL was a global variable
- @@var is a class variable (accessible to all instances of that class)
- @var is an instance variable and 

- Everything in the Core library is automatically loaded.  Everything in the
- Standard library is available, but needs to be loaded (require) first.

- in Ruby, variable reassignment and variable initialization look the same.
- a variable is not necessarily initialized to a new object, since it can be
- intialized to an existing object.
=end
a = 'foo' # <- a initialized and assigned to a new object
b = a     # <- b initialized and assigned to an existing object
