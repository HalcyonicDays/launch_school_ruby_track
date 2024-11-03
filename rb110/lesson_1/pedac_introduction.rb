# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes and 2 or 
# more characters long.  Consider palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
input  : String
output : Array of 0 or more Strings
rules:
  Explicit Reqs:
  - Palindromes are case sensitive (i.e. "dad" is a palindrome; "Dad" is not.)
  - Identify & return a list of palindromes 2 or more characters in length
  
  Implicit Reqs:
  - A string with no palindromes returns an empty array
  - An empty string returns an empty array
  - a smaller palindrome can be found within a larger palindrome, e.g.
    "madam" contains the 3-letter palindrome "ada" 
  - array should be ordered such that larger palindromes are listed first, 
    followed by shorter palindromes
=end

def palindrome_substrings(str)
  palindromes = []
  substrings_refactored(str).each do |substr|
    palindromes << substr if is_palindrome?(substr)
  end
  palindromes
end

def is_palindrome?(substr)
  substr == substr.reverse
end

def substrings(str)
  substrings = []
  starting_index = 0
  length = 2
  loop do
    break if length >= str.size

    substr = str.slice(starting_index, length)
    if substr.size == length
      substrings << substr 
      starting_index += 1
      next
    elsif substr.size < length
      length += 1
      next
    end
  end
  substrings.sort { |a, b| b.size <=> a.size }
end

def substrings_refactored(str)
  substrings = []
  length = 2
  loop do
    break if length >= str.size
    
    starting_index = 0
    substr = str.slice(starting_index, length)
    
    while substr.size == length
      substrings << substr 
      starting_index += 1
      substr = str.slice(starting_index, length)
    end
    length += 1
  end
  substrings.sort { |a, b| b.size <=> a.size }
end
# Note: this isn't much of a refactor, but replacing an if/else with a while
# loop still feels like progress (although it's really not much since a while
# loop requires a conditional to check whether or not to continue.
puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []