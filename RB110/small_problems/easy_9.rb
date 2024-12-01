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

# Write a method that takes a string as an argument, and returns an Array
# that contains every word from the string, to which you have appended a
# space and the word length.
# You may assume that words in the string are separated by exactly one space,
# and that any substring of non-space characters is a word.

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.length}" }
end

puts "word length tests:"
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []

# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.

def swap_name(name)
  first, last = name.split
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
# create. The method should return an Array that contains the same number of
# elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater,
# while the starting number can be any integer value. If the count is 0, an empty
# list should be returned.

def sequence(total, start)
  (1..total).map { |num| start * num }
end

puts "sequence tests (again):"
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

def get_grade(*nums)
  average = nums.inject(:+) / nums.length
  case average
  when 101..   then 'A+'
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when  0...60 then 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 100, 110) == "A+"

# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit_flat(grocery_list)
  grocery_list.map { |fruit, amount| [fruit] * amount }.flatten
end

def buy_fruit_long(grocery_list)
  list = []
  grocery_list.each do |entry|
   fruit = entry[0]
   amount = entry[1]
   amount.times { list << fruit }
 end
 list
end

puts "grocery list tests:"
p buy_fruit_flat([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
p buy_fruit_long([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in
# a different order. Your output should look something like this:
# => ["demo", "dome", "mode"]
# => ["neon", "none"]
# => (etc)

def find_anagrams(words)
  sorted_words = group_words(words)
  sorted_words.values.each { |grouping| p grouping }
end

def group_words(words)
  sorted_words = {}
  words.each do |word|
    sorted = word.split('').sort.join
    sorted_words[sorted] ||= []
    sorted_words[sorted] << word
  end
  sorted_words
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


find_anagrams(words)
# ["demo", "dome", "mode"]
# ["none", "neon"]
# ["tied", "diet", "edit", "tide"]
# ["evil", "live", "veil", "vile"]
# ["fowl", "wolf", "flow"]

# Write a method that takes one argument, a positive integer, and
# returns the sum of its digits.

def sum(int)
  int.to_s.split('').map(&:to_i).inject(:+)
end

# The below method was created because a few problem sets ago, one of my
# solutions was used an example of being "too clever for its own good" and
# I took this to heart, and added a more readable implementation because
# "code is read many more times that it is written" and not about the number
# of lines, but about how easy it is for someone in the future to return to it.
def readable_sum(int)
  digits = int.to_s.split('')
  digits.map! { |digit| digit.to_i }
  digits.sum
end

p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45
p readable_sum(23) == 5
p readable_sum(496) == 19
p readable_sum(123_456_789) == 45

# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of
# the argument Array.

def oddities(arr)
  alternate_elements = []
  arr.each_with_index do |element, idx|
    alternate_elements << element if idx.even?
  end
  alternate_elements
end
# This method was interesting.  Originally my new array was called "odds" but then
# I ended up with "odd << element if idx.even?" and that raised an eyebrow.  Even
# though the method is called "oddities" (which may be worth a refactor) and I can't
# change it, I can at least make the intent more clear in the implementation by
# calling the new array "alternate_elements" instead of "odds"

puts "oddities tests:"
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
