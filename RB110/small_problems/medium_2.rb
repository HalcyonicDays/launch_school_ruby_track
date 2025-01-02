INPUT = 'pg84.txt'
input = File.readlines(INPUT, chomp: false)

def longest_sentence(input)
  # sentences = input.join(' ').gsub(/[\.!\?]/, "@@@@").split('@@@@')
  sentences = input.join(' ').split(/[\.!\?]/)
  longest = sentences.max_by { |sentence| sentence.split.size }
  puts longest
  longest.split(' ').size
end

p longest_sentence(input) == 157

=begin
To study:
- deep & shallow copy differencesa. 
- each_with_object
- partition

Whether the method takes a block
How it handles the block's return value
What the method itself returns
=end
