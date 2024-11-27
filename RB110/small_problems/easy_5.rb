def ascii_value(str)
  str.chars.map { |char| char.ord }.inject(:+) || 0
end

def ascii_value(str)
  sum = 0
  str.chars { |char| sum += char.ord }
  sum
end
# str.ord.char == str
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

MINUTES_IN_AN_HOUR = 60
HOURS_IN_A_DAY = 24

def time_of_day(minutes_offset)
  total_hours, minutes = minutes_offset.divmod(MINUTES_IN_AN_HOUR)
  hours = total_hours % HOURS_IN_A_DAY
  "#{sprintf('%.2d:%.2d', hours, minutes)}"
end

puts "Midnight 1 tests:"
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


def after_midnight(time)
  hours, minutes = time.split(':')
  hours_to_add = (hours.to_i % HOURS_IN_A_DAY) * MINUTES_IN_AN_HOUR
  hours_to_add + minutes.to_i
end

def before_midnight(time)
  return after_midnight(time) if after_midnight(time).zero?
  (HOURS_IN_A_DAY * MINUTES_IN_AN_HOUR) - after_midnight(time)
end

puts "Midnight 2 tests:"
p after_midnight('00:00') == 0
p after_midnight('00:01') == 1
p after_midnight('24:00') == 0
p after_midnight('12:34') == 754
p before_midnight('00:00') == 0
p before_midnight('24:00') == 0
p before_midnight('12:34') == 686

# Given a string of words separated by spaces, write a method that takes this string of words
# and returns a string in which the first and last letters of every word are swapped.
def swap(string)
  string.split.map do |word|
    switch_ends_around(word)
  end.join(' ')
end

def switch_ends_around(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

puts "letter swap test: "
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Given a string that consists of some words (all lowercased) and an assortment of
# non-alphabetic characters, write a method that returns that string with all of the
# non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters
# occur in a row, you should only have one space in the result (the result should never
# have consecutive spaces).

def cleanup(str)
  str.gsub(/\W/, " ").gsub(/\s+/, ' ')
end
puts "character cleanup test: "
p cleanup("---what's my +*& line?") == ' what s my line '

# Write a method that takes a string with one or more space separated words and returns
# a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space.

def word_sizes(sentence)
  words = sentence.split(' ')
  counts = words.group_by { |word| word.size }
  counts.map { |key, value| [key, value.size] }.to_h
end

puts "letter counter 1 test: "
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

def accurate_word_sizes(sentence)
  simple_sentence = cleanup(sentence.gsub("'", ''))
  word_sizes(simple_sentence)
end


puts "letter counter 2 test: "
p accurate_word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p accurate_word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p accurate_word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p accurate_word_sizes('') == {}

# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of
# those Integers sorted based on the English words for each number:

# alphabetic_number_sort((0..19).to_a) == 
[8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
=begin
The only way I can think to do this would be to create a hash with each number as a key and
each word-representation of the number as the value, and then perform a 
sort_by { |num| lookup[num] } or sort { |a, b| lookup[a] <=> lookup[b] }
I suppose the hash could be an array, since the keys would just be 0 - 19 and match perfectly
to the corresponding array indices.  Given this approach, I don't see any value in writing out
every number from 0 to 19 in plain english for the sake of this solution.
=end

# Write a method that takes a string argument and returns a new string that contains the
# value of the original string with all consecutive duplicate characters collapsed into a
# single character.

def crunch(str)
  crunched = ''
  str.each_char do |char|
    crunched << char unless crunched.end_with?(char)
  end
  crunched
end

puts "crunch test: "
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


# Write a method that takes one argument, a positive integer, and returns a list of
# the digits in the number.

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts "digit list test: "
p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true
