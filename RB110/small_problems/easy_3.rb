# Write a program that solicits 6 numbers from the user, then prints a
# message that describes whether or not the 6th number appears amongst the
# first 5 numbers.
first_five = [1,2,3,4,6]
sixth_number = 6

def among_the_five(set_of_five, sixth_number)
  case set_of_five.include?(sixth_number)
  when true
    puts "The number #{sixth_number} appears in #{set_of_five.inspect}"
  when false
    puts "The number #{sixth_number} does not appear in #{set_of_five.inspect}"
  end
end

def among_the_five(set_of_five, sixth_number)
  message = "The number #{sixth_number} appears in #{set_of_five.inspect}"    
  message.gsub!('appears', 'does not appear') unless set_of_five.include?(sixth_number)
  puts message
end
# among_the_five(first_five, sixth_number)

def count_nonwhitespace_characters(str)
  str.split.join.size
end
test_case = "walk, don't run"
p count_nonwhitespace_characters(test_case) == 13

def multiply_or_square(a, b=nil)
  b ||= a  # Never actually do this.
  a * b
end
p multiply_or_square(5,3) == 15
p multiply_or_square(5) == 25
p multiply_or_square(-8) == 64

def xor?(val_1, val_2)
  not (!!val_1 == !!val_2)  # "not" used instead of "!" for readability
end
# weirdly, since !!val_1 == !!val_2 is equivalent to !val_1 == !val_2, the
# latter can also be used.  My guess would be that such an implementation 
# would both be *very slightly* more efficient, and also more confusing.

puts "XOR tests:"
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?('abc', nil) == true
p xor?(nil, 'abc') == true
p xor?('abc', 'abc') == false
p xor?(nil, nil) == false

def palindrome?(str)
  str == str.reverse
end
puts "Palindrome 1 tests:"
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def real_palindrome?(str)
  str = str.downcase.gsub(/(\W)/) { |non_word| non_word.replace('') }
  str == str.reverse
end
puts "Palindrome 2 tests:"
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

def palindromic_number?(num)
  palindrome?(num.to_s)
end
puts "Palindrome 3 tests:"
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(005) == true
p palindromic_number?('005') == false
p palindromic_number?(00500) == false
p palindromic_number?('00500') == true
# Leading zeroes essentially don't exist because the argument being passed to the method is an
# Intger, so 005 is equivalent to 5 if the value isn't a String to begin with.
# Even something like (005).to_s is just "5"

# Write a method that takes a string argument, and returns true if all of the alphabetic
# characters inside the string are uppercase, false otherwise. Characters that are not
# alphabetic should be ignored.
def uppercase?(str)
  str == str.upcase
end
puts "Uppercase 3 tests:"
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
