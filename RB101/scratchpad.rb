def some_test_method_name
  puts "this is the #{__method__} method"
end
puts "test"
some_test_method_name()
puts "test over"


class Rock; end
class Paper; end
class Scissors; end

MOVES = [Rock, Paper, Scissors]
message = "Select"
MOVES.each_with_index do |move, idx| 
  message << " (#{idx+1}) #{move.to_s},"
end

puts "Select (1) Rock, (2) Paper, (3) Scissors:"
puts message.chop << ':'
