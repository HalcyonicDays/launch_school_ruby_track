# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array. You may assume that
# the Array always contains at least one number.

def sum_of_sums(nums)
  sum = 0
  while nums.length > 0
    sum += nums.inject(:+)
    nums.pop
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Write a method that returns a list of all substrings of a string that start at the
# beginning of the original string. The return value should be arranged in order from
# shortest to longest substring.

def leading_substrings(str)
  substrings = []
  0.upto(str.length - 1) { |idx| substrings << str[0..idx] }
  substrings
end

puts "leading substrings tests:" 
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

def substrings(str)
  substrings = []
  0.upto(str.length - 1) do |starting_idx|
    substrings << leading_substrings(str[starting_idx..-1])
  end
  substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as it
# does backwards. The return value should be arranged in the same sequence as the
# substrings appear in the string. Duplicate palindromes should be included multiple times.

# For the purposes of this exercise, you should consider all characters and pay attention
# to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In
# addition, assume that single characters are not palindromes.

def palindromes()
end
=begin
- identify all substrings in the given string
  - create an outer loop through the string incrementing starting index
  - the inner loop will be incrementing slice (substring) size
- for each substring, determine if it is a palindrome
  - palindrome helper method testing if word is the same forwards & backwards
- add all palindromes to an array to return as final result
=end

def palindromes(str, letters_only=false)
  str = keep_alphanumerics(str.downcase) if letters_only
  substrings = find_substrings(str)
  substrings.select { |substring| is_palindrome?(substring) }
end

def find_substrings(str)
  substrings = []
  0.upto(str.length - 1) do |idx|
    2.upto(str.length) do |slice_size|
      slice = str.slice(idx, slice_size)
      break if slice.size < slice_size
      substrings << slice
    end
  end
  substrings
end

def is_palindrome?(str)
  return false if str.size <= 1
  str == str.reverse
end

def keep_alphanumerics(str)
  str.gsub(/[^a-z]/, '')
end

puts "palindrome tests:"
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo']
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']
p palindromes("madam I'm adam")
p palindromes("madam I'm adam", true)

# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers from the starting number
# to the ending number, except if a number is divisible by 3, print "Fizz", if a
# number is divisible by 5, print "Buzz", and finally if a number is divisible
# by 3 and 5, print "FizzBuzz".

FIZZBUZZ = {3 => 'Fizz', 5 => 'Buzz'}

def fizzbuzz(starting_num, ending_num)
  output = []
  starting_num.upto(ending_num) do |num|
    output << fizzbuzz_value(num)  
  end
  output
end

def fizzbuzz_value(num)
  output = ''
  FIZZBUZZ.each do |divisor, exclamation|
    output << exclamation if (num % divisor).zero?
  end
  output.empty? ? num.to_s : output
end

p fizzbuzz(1, 15) == %w(1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz)

# Write a method that takes a string, and returns a new string in which every
# character is doubled.

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

puts "repeater 1 tests:"
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation,
# and whitespace should not be doubled

CONSONANTS = 'cdfghjklmnpqrstvwxyz'

def double_consonants(str)
  str.split('').map do |char|
    CONSONANTS.include?(char.downcase) ? char * 2 : char
  end.join
end

puts "repeater 2 tests:"
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Write a method that takes one argument, a string, and returns a new
# string with the words in reverse order.

def reverse_sentence(str)
  reversed = []
  str.split.reverse_each { |word| reversed << word }
  reversed.join(' ')
end

puts "reverse sentence tests:"
p reverse_sentence('Hello World') == 'World Hello'
p reverse_sentence('Reverse these words') == 'words these Reverse'
p reverse_sentence('') == ''
p reverse_sentence('    ') == '' # Any number of spaces results in '

# Write a method that takes one argument, a string containing one or more
# words, and returns the given string with words that contain five or more
# characters reversed. Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.

def reverse_words(str)
  str.split.map do |word|
    word.length >= 5 ? word.reverse : word
  end.join(' ')
end

puts "reverse words tests:"
puts reverse_words('Professional')          == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')         == 'hcnuaL loohcS'


# Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array. The array will
# never be empty and the numbers will always be positive integers. Your
# result should also be an integer.

# Don't use the Array#sum method for your solution - see if you can solve
# this problem using iteration more directly.

def average(numbers)
  numbers.reduce(:+) / numbers.size
end

def float_int_average(numbers)
  (numbers.map(&:to_f).reduce(:+) / numbers.size).to_i
end

def no_method_average(numbers)
  average = 0
  numbers.each do |num|
    average += (num.to_f / numbers.size)
  end
  average.to_i
end

puts "average array tests:"
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
