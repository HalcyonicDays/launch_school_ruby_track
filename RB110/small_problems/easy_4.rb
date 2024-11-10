# Write a method that takes two strings as arguments, determines the longest of the two strings,
# and then returns the result of concatenating the shorter string, the longer string, and the
# shorter string once again. You may assume that the strings are of different lengths.
def short_long_short(string_1, string_2)
  sorted = [string_1, string_2].sort! { |a, b| a.size <=> b.size}
  sorted.append(sorted.first).join
end
# This method is perhaps too clever for its own good and makes it hard to understand
# what this method is trying to do.  
# ◉ ͟ʖ ◉ 

def short_long_short(string_1, string_2)
  if string_1.length < string_2.length
    short, long = string_1, string_2
  else
    short, long = string_2, string_1
  end
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Write a method that takes a year as input and returns the century. The return value should be
# a string that begins with the century number, and ends with st, nd, rd, or th as appropriate
# for that number.  New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.
def century(year)
  century = ((year-1) / 100 + 1).to_s
  suffix =  if ('4'..'20').include?(century[-2..-1])
              'th'
            else
              case century[-1]
              when '1' then 'st'
              when '2' then 'nd'
              when '3' then 'rd'
              else          'th'
              end
            end
  "#{century}#{suffix}"
end
# well, there's no way this is the best approach, but at least the tests pass...
# Oh! Yes, "4" and "14" don't need to be treated separately if they evaluate to the same thing
puts "Century tests:"
p century(2000) == '20th'   # false
p century(2001) == '21st'   # false
p century(1965) == '20th'   # true 
p century(256) == '3rd'     # false
p century(5) == '1st'       # false
p century(10103) == '102nd' # false
p century(1052) == '11th'   # true 
p century(1127) == '12th'   # true
p century(11201) == '113th' # true

# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly
# divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by
# 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year
# greater than 0 as input, and returns true if the year is a leap year, or false if it is not a
# leap year.

def leap_year?(year)
  (year % 4   == 0) &&
  ((year % 100 != 0) ^ (year % 400 == 0))
end
puts "Leap year 1 tests:"
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

def leap_year?(year)
  return true if (year % 4 == 0) && (year <= 1752)
  (year % 4   == 0) && 
  ((year % 100 != 0) ^ (year % 400 == 0))
end
puts "Leap year 2 tests:"
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other
# number, and then computes the sum of those multiples. For instance, if the supplied number
# is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
def multisum(number)
  sum = 0
  1.upto(number) { |n| sum += n if (n % 3 == 0 || n % 5 == 0)}
  sum
end

def multisum(number)
  (1..number).to_a.select { |n| (n % 3 == 0 || n % 5 == 0) }.inject(:+)
end

puts "Multisum tests:"
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
# Note: this approach would be quite different if multisum accepted an additional argument -
# an array representing all divisors to be tested, e.g. multisum(3, [3,5]) in the above case.

# Write a method that takes an Array of numbers, and returns an Array with the same number of
# elements, and each element has the running total from the original Array.
def running_total(array)
  new_array = []
  array.each_with_index do |elm, idx|
    new_array[idx] = array[0..idx].sum
  end
  new_array
end

def running_total(array)
  sum = 0
  array.map { |elm| sum += elm }
end

def running_total(array)
  sum = 0
  new_array = array.each_with_object([]) do |elm, new_array|
    new_array << sum += elm
  end
end

puts "running total tests:"
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

def string_to_integer(str)
  num = 0
  magnitude = str.length - 1
  str.chars.each do |char| 
    num += (char.unpack('C').first-48) * (10**magnitude)
    magnitude -= 1
  end
  num
end
puts "str to int tests:"
p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570
# Wow.  The hash solution is certainly the better approach, but I'm clearly way too tired to
# be thinking clearly. The real lesson here is not to try to power through exhaustion.

STR_TO_NUM = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  num = 0
  magnitude = str.length - 1
  str.chars.each do |char|
    num += STR_TO_NUM[char] * (10**magnitude)
    magnitude -= 1
  end
  num
end
p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570


def string_to_signed_integer(str)
  unsigned_str = ['+', '-'].include?(str[0]) ? str[1..-1] : str       
  sign = str[0] == '-' ? -1 : 1
  string_to_integer(unsigned_str) * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


NUM_TO_STR = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

include Math


def complex_integer_to_string(int)
  length = log10(int).floor
  string = ''
  length.downto(0) do |len|
    digit = int / (10**len)
    int = int - (digit * (10**len))
    string << NUM_TO_STR[digit]
  end
  string
end

def integer_to_string(int)
  NUM_TO_STR.fetch(int) { complex_integer_to_string(int) }
end

puts "int to str tests:"
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# hexadecimal_to_integer('4D9f') == 19871

def signed_integer_to_string(int)
  return integer_to_string(int) if int == 0
  sign = int > 0 ? '+' : '-'
  integer_to_string(int.abs).prepend(sign)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
