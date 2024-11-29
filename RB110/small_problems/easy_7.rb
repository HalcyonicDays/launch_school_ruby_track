# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that are
# lowercase letters, one represents the number of characters that are uppercase
# letters, and one represents the number of characters that are neither

def letter_case_count(str)
  case_count = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    case char
    when ('a'..'z') then case_count[:lowercase] += 1
    when ('A'..'Z') then case_count[:uppercase] += 1
    else                 case_count[:neither] += 1
    end
  end
  case_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Write a method that takes a single String argument and returns a new string that
# contains the original value of the argument with the first character of every word
# capitalized and all other letters lowercase.

def word_cap(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

def word_cap(str)
  str.split.map do |word| 
    new_word = word.downcase
    new_word[0] = new_word[0].upcase
    new_word
  end.join(' ')
end

def word_cap(str)
  str.split.map { |word| capitalize(word) }.join(' ')
end

def capitalize(str)
  str[0].upcase + str[1..-1].downcase
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version, and
# every lowercase letter by its uppercase version. All other characters should be unchanged.

SWAPCASE = {}
('a'..'z').to_a.each { |letter| SWAPCASE[letter] = letter.upcase}
('A'..'Z').to_a.each { |letter| SWAPCASE[letter] = letter.downcase}

def swapcase(str)
  str.chars.map { |letter| SWAPCASE.fetch(letter) {letter} }.join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

def staggered_case(str, downcase_first=false)
  staggered = ''
  case_switcher = downcase_first ? 1 : 0
  str.downcase.chars.each_with_index do |char, idx|
    staggered << (idx % 2 == case_switcher ? char.upcase : char)
  end
  staggered
end

# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.

puts "staggered cups 1 tests:"
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case(str, upcase_first=true, letters_only=true)
  staggered = ''
  next_method = upcase_first ? :upcase : :downcase 
  str.downcase.chars.each_with_index do |char, idx|
    staggered << char.send(next_method)
    next unless char =~ /[a-z]/i || !letters_only
    next_method = swap_mode(next_method)
  end
  staggered
end

def swap_mode(current_mode)
  current_mode == :upcase ? :downcase : :upcase
end

puts "staggered cups 2 tests:"
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts "staggered cups 1 tests (again):"
p staggered_case('I Love Launch School!', true, false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', true, false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 NuMbErS'

# Write a method that takes an Array of integers as input, multiplies all the numbers
# together, divides the result by the number of entries in the Array, and then prints the
# result rounded to 3 decimal places. Assume the array is non-empty

def show_multiplicative_average(nums)
  product = nums.inject(:*)
  avg = product.to_f / nums.length
  "The result is #{sprintf("%.3f", avg.round(3))}"
end

puts "multiplicative average tests:"
p show_multiplicative_average([3, 5])                == "The result is 7.500"
p show_multiplicative_average([6])                   == "The result is 6.000"
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "The result is 28361.667"


# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |nums| nums.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# every pair of numbers that can be formed between the elements of the two
# Arrays. The results should be sorted by increasing value.

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |nums| nums.reduce(:*) }.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Write a method that returns the middle word of a phrase or sentence. It should handle all
# of the edge cases you thought of.

def find_middle_words(str)
  return str if str.empty?
  words = str.split
  words.size / 2
  offset = words.size % 2 == 0 ? 1 : 0
  start_idx = (words.size / 2.0).ceil - 1
  words[start_idx..start_idx + offset].join(' ')
end

puts "middle word(s) tests:"
p find_middle_words('') == ''
p find_middle_words('honk') == 'honk'
p find_middle_words('last word') == 'last word'
p find_middle_words('Launch School is very good!') == 'is'

# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each
# element alongside the number of occurrences.

def count_occurrences(arr)
  arr.map(&:downcase).tally.each { |thing, amount| puts "#{thing} => #{amount}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles) 
