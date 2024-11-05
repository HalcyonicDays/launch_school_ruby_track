[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# => [1, 2, 3] because each element evaluates as truthy because 
# that is what 'hi' is

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# >> returns a count of elements which evaluated as truthy
# >> so in this case, => 2

[1, 2, 3].reject do |num|
  puts num
end
# => [1, 2, 3] reject returns an array of all elements that evaluate as 
# falsey (since it rejects all elements that are truthy).  Since the puts
# method returns nil - a falsey value - no values are rejects and an array
# containing all the elements of original array is returned.

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# {}[value[0]] => ant[0] = 'a'
# {}['a'] = 'ant' (this is assigning a value to a key within a hash)
# => {'a' => 'ant', 'b' => 'bear', 'c', => 'cat'}

# >> Note: this is very close to: 
['ant', 'bear', 'cat'].group_by { |elm| elm[0] }
# => {'a' => ['ant'], 'b' => ['bear'], 'c', => ['cat']}
# Since group_by returns a "category" as a key, and then an array of 
# all elements which correspond to that category.

hash = { a: 'ant', b: 'bear' }
hash.shift
# >> https://ruby-doc.org/3.3.5/Hash.html#method-i-shift
# shift removes and returns the first "element" of an array.  In this case of a
# hash, hash.shift would return => [:a, 'ant'] and the hash variable itself
# would be mutated to {b: 'bear'} since Hash#shift is a destuctive method.

['ant', 'bear', 'caterpillar'].pop.size
# => 11  Array#pop returns the last element of an array, in this case 
# 'caterpillar' and String#size (or String#length) returns the length 
# of the String - in this case 11.  This is an example of method chaining.

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# => true because at least one element in the array evaluates as true when the
# block is fully evaluated.  Since the last line is num.odd? and 1 evaluates
# as true for that last line, true is returned by the block, and therefore
# true is returned by the method.

arr = [1, 2, 3, 4, 5]
arr.take(2)
# >> https://ruby-doc.org/3.3.5/Enumerable.html#method-i-take
# => [1, 2]
# Based on the documentation, it doesn't appear to be destructive.  It seems
# at first glace to be inferior to Enum#First, since it requires an argument
# and is slightly less explicit about what is happening.
# Based on the fact that this method exists, and isn't simply an alias for
# Enum#first, I wonder if perhaps it's a destructive method, but then it would
# just be an alias for Enum#shift.

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, 'bear']  Map returns an array of equal size to the original enum so
# the if expression evaluates as false for {a: 'ant'}, effectively returning
# nothing (nil), and true for {b: 'bear'}, returning the value, "bear"

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# => [1, nil, nil]
# for 1, the conditional evaluates as false, goes to the else clause, and returns
# the number itself - 1.  For 2 and 3, the conditional evaluates to true, so the
# number is output to the console and the puts method returns nil.