# ======================= Easy 1 ======================= 

# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# output is unchanged because Array#uniq does not mutate the caller

# Question 2
# Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:

# '!' is used to mean "Not" or added to a method name to imply mutation,
# although this is convention and not syntax.
# '?' is the ternary operations <test condition> ? <do if true> : <do if false>
# or added to a method name to imply a returned boolean value, although this
# is convention and not syntax.

=begin
what is != and where should you use it?
>> signifies "not equal to" and used as part of a conditional/test

put ! before something, like !user_name
>> this is a negation. "!user_name" seems like it would be involved in an
>> operation that determines if a visitor to a site needs create a new account

put ! after something, like words.uniq!
>> suggests that the method is probably destructive, i.e. it mutates 
>> the caller (or an argument?)

put ? before something
put ? after something
>> ternary operator or just a string character that's part of a name
>> e.g. "meth?d_name" is a valid method name with no special properties
>> "method_name?" implied a boolean output

put !! before something, like !!user_name
>> turns something into its boolean equivalent, e.g. a truthy value becomes true
>> and a falsey value (false or nil) becomes false.
=end

# Question 3
# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

# Question 4
# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to 
# the original array between method calls)?

numbers.delete_at(1)    # [1, 3, 4, 5] element at index 1 is removed
numbers.delete(1)       # [2, 3, 4, 5] element(s) with value '1' is/are removed

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

(10..100).include?(42)
42 in 10..100

(10..100).cover?(42)    # I didn't know about this method!

# Question 6
# Starting with the string:
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.
"Four score and " + famous_words
"Four score and " << famous_words
famous_words.prepend("Four score and ")
"Four score and ".contac(famous_words)


# Question 7
# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.

flintstones.flatten!

# Question 8
# Given the hash below, create an array containing only two elements: 
# Barney's name and Barney's number.

flintstones = { 
    "Fred" => 0, 
    "Wilma" => 1, 
    "Barney" => 2, 
    "Betty" => 3, 
    "BamBam" => 4, 
    "Pebbles" => 5 }

flintstones.select { |k, v| k == 'Barney'}.flatten
flintstones.assoc("Barney")     # I didn't know about this method, either!

# ======================= Easy 2 ======================= 

# Question 1
# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.  Bonus: What are two other hash methods 
# that would work just as well for this solution?
ages["Spot"]
!!ages["Spot"]
ages.key?("Spot")
ages.fetch("Spot") {"No Spot"}

#Question 2
# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be 
# executed on original munsters_description above):

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase
"The munsters are creepy in a good way."
munsters_description.capitalize
"the munsters are creepy in a good way."
munsters_description.downcase
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase

# Question 3
# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

# Question 4
# See if the name "dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?('dino')
advice =~ /dino/
advice.match(/dino/)

# Question 5
# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
flintstones.push('Dino')
flintstones += ['Dino']
flintstones += %w(Dino)

# Question 7
# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.
# How can we add multiple items to our array? (Dino and Hoppy)
flintstones << 'Dino' << 'Hoppy'
flintstones.push('Dino', 'Hoppy')
flintstones += ['Dino', 'Hoppy']
flintstones += %w(Dino Hoppy)


# Question 8
# Shorten the following sentence:
advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make 
# the return value "Few things in life are as important as "
# But leave the advice variable as "house training your pet dinosaur."
slice = advice.slice!(0, advice =~ /house/)

# As a bonus, what happens if you use the String#slice method instead?
# >> the way I wrote it above, the return value is the same, but the
# >> value stored in 'advice' is not mutated.

# Question 9
# Write a one-liner to count the number of lower-case 't' characters 
# in the following string:
statement = "The Flintstones Rock!"
statement.count('t')

# Question 10
# Back in the stone age (before CSS) we used spaces to align things
# on the screen. If we had a table of Flintstone family members that
# was forty characters in width, how could we easily center that title
# above the table with spaces?

title = "Flintstone Family Members"
title.ljust( (40 + title.size)/2 ).rjust(40)
title.rjust( (40 + title.size)/2 ).ljust(40)
title.center(40)
