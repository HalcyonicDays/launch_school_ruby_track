=begin
Numerical palindrome
A palindrome is a word, phrase, number, or other sequence of
characters which reads the same backward as forward. Examples of
numerical palindromes are:

2332 
110011 
54322345
You'll be given 2 numbers as arguments: (num, s). Write a function
which returns an array of s number of numerical palindromes that come
after num. If num is a palindrome itself, it should be included in
the count. 

Single digit numbers will NOT be considered numerical palindromes. 

P - restate the problem
Find the next n number of palindromes given some number (that number inclusive).

E - List of requirements
Requirements: 
- input  : starting number, and length of the output array
- output : an array of length, n
- must be able to identify what a palindrome is
- all considered values will be integers
- a palindrome must be at least 2 digits in length
- if the starting number is a palindrome, it is part of the output array
- the minimum number of entities to return can be zero
- test cases appear to consider only positive values

D - the output asks for an array, and that seems sufficient

Algorithm:
- start with an empty "palindromes" array to contain all found palindromes
- starting with either the provided initial value or 10 (to skip evaluating
  single-digit numbers), begin to count upwards
- for each number, determine whether or not it is a palindrome
  - palindrome check: 
    - convert number to a string
    - compare string number to reversed-string number
- add palindromes into the "palindromes" array to be used for final output
- increment the number being evaluated by 1
- return early/break once the array's length is equal to the required value
=end


def palindrome(starting_num, target_length)
  palindromes = []
  number = [starting_num, 10].max
  while palindromes.length < target_length
    palindromes.push(number) if is_palindrome?(number)
    number += 1
  end
  palindromes
end

def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

puts palindrome(6,4) == [11,22,33,44] # true
puts palindrome(75,1) == [77] # true
puts palindrome(101,2) == [101,111] # true
puts palindrome(0,4) == [11,22,33,44] # true