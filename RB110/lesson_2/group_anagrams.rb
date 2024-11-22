=begin
Group Anagrams

Write a function group_anagrams(words) that takes an array of words 
as input and groups the anagrams together. Anagrams are words that 
have the same characters but in a different order.

Your function should return an array of arrays, where each inner 
array represents a group of anagrams. For words that do not have 
anagrams, they should be grouped into an array together.

The order of the groups and the order of words within each group 
does not matter.
=end

# puts group_anagrams(['listen', 'silent', 'enlist', 'hello', 'olhel'])
# Output: [['listen', 'silent', 'enlist'], ['hello', 'olhel']]

# puts group_anagrams(['abc', 'bca', 'cab', 'def', 'fed'])
# Output: [['abc', 'bca', 'cab'], ['def', 'fed']]

# puts group_anagrams(['cat', 'dig', 'tac', 'god', 'act'])
# Output: [['cat', 'tac', 'act'], ['dig', 'god']]

=begin
input: an array of strings
intermediate: a hash containing the sorted (common) word as a key, and the orignal word as a value
output: an array of arrays which themselves are a group of words

requirements/notes:
- method group_anagrams(array) which returns an array
- identify if a word is an anagram
  - anagrams are words with all the same letters, but different order
- sub-divide anagram groups and non-anagram groups
- compare a word to a list of words without comparing it to itself

algorithm:
- create placeholder method group_anagrams(array) which returns an array
- loop through each word in the array
- the key can be the "sorted" word; the value will be either the word or its index in the original array
- using a new method: 
  - identify all keys with more than one value and push (<<) into the output array (find_anagrams)
  - for all keys with a single value, push all together into a "leftover" array (find_loners)
    - Update: "find_loners" needs to return the value to be added to the "anagrams" array, which
      means it needs to return *an array* containing the array of "loner" values, but also needs to
      return an empty array if there are no values.  Otherwise the final result will have a trailing "[]"
- combine arrays into final output

=end

def group_anagrams(words)
  sorted_words = {}
  words.each do |word|
    sorted = word.chars.sort.join
    # puts "#{word} -> #{sorted}"
    sorted_words[sorted] ||= []
    sorted_words[sorted] << word
  end
  # p sorted_words
  anagrams = find_anagrams(sorted_words)
  loners = find_loners(sorted_words)
  p anagrams + loners
  anagrams + loners
end

def find_anagrams(sorted_words)
  anagrams = sorted_words.select { |_, words| words.size > 1 }.values
  # p anagrams
end

def find_loners(sorted_words)
  loners = sorted_words.select { |_, words| words.size == 1 }.values.flatten
  # p loners
  loners.any? ? [loners] : []
end

group_anagrams(['listen', 'silent', 'enlist', 'hello', 'olhel'])

# Test cases:
puts group_anagrams(['listen', 'silent', 'enlist', 'hello', 'olhel']) == [['listen', 'silent', 'enlist'], ['hello', 'olhel']]
puts group_anagrams(['abc', 'bca', 'cab', 'def', 'fed']) == [['abc', 'bca', 'cab'], ['def', 'fed']]
puts group_anagrams(['cat', 'dig', 'tac', 'god', 'act']) == [['cat', 'tac', 'act'], ['dig', 'god']]