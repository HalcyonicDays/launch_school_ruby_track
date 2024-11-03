str = 'The grass is green'
puts str.slice(4, 5) # equivalent to str[4, 5]
puts str.slice(4..8) # equivalent to str[4..8]

puts str.object_id  # => some value
str[2] = 'aaaa'
puts str.object_id  # => same value as line 5 above
# the object id is unchanged, which is collection-like behavior

puts str[2].object_id # => value 1
puts str[2].object_id # => value 2
puts str[2].object_id # => value 3
# the object ids are changing, so any giving individual element of a string
# is a new object each time, and not the same object.
# This is NOT collection-like behavior.
# This is because String#[] is syntactic sugar for the #slice method, rather
# than index-based accessing that is performed on an Array.
# >> Note: Array#slice returns the same object each time because it return a 
# >> new Array containing one or more elements of the original Array, rather
# >> than a new String representation one or more characters, the way
# >> String#slice does. This is because Array elements are individual objects,
# >> and Array#slice returns a new Array, while String#slice returns a a new 
# >> String object.

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
# => ['c', 'd', 'e'] (#slice method, starting at element 2 and 3 elements in length)
arr[2, 3][0]
# => 'c' - the first element of ['c', 'd', 'e']
# hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
#p hsh # value of 'apple' is overwritten with 'pear'

str = "joe's favorite color is blue"
str[0] = 'J'
puts str
char = 0
loop do 
  str[char] = str[char].upcase
  char += 1
  break if char == str.length
end
puts str
# >> Whoops. I thought the question was about replacing every letter with its
# >> uppercase version.  This is just a longer way to write str.upcase!

arr = [1, 2, 3, 4, 5]
arr.map! { |n| n += 1 }

def mutate_str(str)
  new_str = str.gsub('', '')
  print new_str, new_str.object_id
  print str, str.object_id
end
# A crude way to "safely" reassign a String object to a new temporary variable
# in a way where they contain the same value, but no longer reference the same
# original String object.
my_str = 'moo'
mutate_str(my_str)
