# How would you order this array of number strings by descending numeric value?
=begin
arr = ['10', '11', '9', '7', '8']
p arr.sort { |a, b| b.to_i <=> a.to_i }


# How would you order this array of hashes based on the year of publication of each book,
# from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

puts books.sort_by { |hsh| hsh[:published].to_i }


# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1.last.last.last
p arr1[-1][-1][-1]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2.last[:third].first

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3.last[:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][-1]

hsh2 = {
  first: {'d' => 3}, 
  second: {'e' => 2, 'f' => 1}, 
  third: {'g' => 0}}
p hsh2[:third].keys[0]


# For each of these collection objects where the value 3 occurs, demonstrate how you
# would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first].last[0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
puts hsh2
# Wow, I can't believe that Array#first and Array#last are getter methods with no 
# corresponding setter methods.  Granted, I've never needed to "manually" specify/assign a
# value to an array like that, but even so, I can't believe I hadn't known that until now
=end

# Determine the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
=begin
input:  hash
output: integer
problem: sum up the total age of all the male munsters
test-case: expected value is 32 + 402 + 10 = 444
algorithm: 
- identify & filter down to just male munsters
- collect & sum up the male ages
=end

def munster_ages(munsters)
  munsters.select { |_, properties| properties["gender"] == "male" }
          .map { |_, properties| properties["age"] }.inject(:+)
end

p munster_ages(munsters) == 444


# Given this previously seen family hash, print out the name, age and gender of each
# family member: (Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, details|
  puts "#{munster} is a #{details['age']}-year-old #{details['gender']}"
end

# Given this code, what would be the final values of a and b? Try to work this out
# without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
p arr == [4, [3, 8]]
p a == 2
p b == [3, 8]


# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}
hsh.each_value do |strings|
  strings.each do |word|
    word.scan(/[aeiou]/) { |letter| puts letter }
  end
end

# Given this data structure, return a new array of the same structure but with the
# sub arrays being ordered (alphabetically or numerically as appropriate) in
# descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
p arr.map { |sub_arr| sub_arr.sort.reverse }
p arr.map { |sub_arr| sub_arr.sort { |a, b| b <=> a} }
# Reverse is used simply because I wanted to keep it all in one line and I knew the
# one-line varient that used sort with a block would be messy to look at.
# For this specific practice problem (in which we're practicing map & sort),
# the best approach would have just been a multi-line do..end block.

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

=begin
Problem
- use the map method to increment the values of the hashes within the original array by 1
- input : array
- output: new array
Requirements:
- original array is unchanged
- output is an array of hashes

Test Cases:
  arr2 == [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
  arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

Algorithm:
- An outer loop which iterates through each element of the original array
- an inner loop which interates through each key-value pair of the hash and adds 1
  to each value
- map is used for the outer array, since that can transform an array into a modified array
  while leaving the original array unmodified
- the inner iteration through the hashes need to also return a hash.  Hash#map returns an
  array, so this might not be viable.  Calling to_h on the array will convert it back to
  a hash, but I'm worried it will also be in [] brackets.  Calling .to_h[0] should strip
  away the outer brackets leaving just the first element of the array (the hash)
- update, since [].to_h is of the form [[key:value]].to_h, I didn't end up with an extra
  set of [] brackets around the updated hashes, and didn't need to call [].first or [][0]
=end

arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr1.map do |hsh|
  hsh.map { |key, value| [key, value + 1] }.to_h
end

p arr2 == [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
p arr1 == [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


# Given the following data structure use a combination of methods, including either
# the select or reject method, to return a new array identical in structure to the
# original but containing only the integers that are multiples of 3.
=begin
Problem
- Create a new array containing only the mutiples of 3 in the original array while
  preserving the structure of the original array
- input : array
- output: new array
Test Case
- arr == [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
- new_arr arr = [[], [3, 12], [9], [15]]
Structure: Array
Algorithm:
- an outer loop which ensures each element is handled individually to preserve structure
- an inner loop which evaluates each element of each sub-array to determine whether or not
  it is a multiple of 3 
=end


arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select { |int| int % 3 == 0 }
end

p new_arr == [[], [3, 12], [9], [15]]
p arr == [[2], [3, 5, 7, 12], [9], [11, 13, 15]]