require 'pry'

def some_test_method_name
  puts "this is the #{__method__} method"
end
puts "test"
some_test_method_name()
puts "test over"

def rock_wins
  __method__.to_s.split('_').join(' ').capitalize << '!'
end
puts rock_wins

class Game
  @@score = 0

  def self.score
    @@score
  end

  def self.score=(value)
    @@score = value
  end
end

class Rock < Game; end
class Paper < Game; end
class Scissors < Game; end

MOVES = [Rock, Paper, Scissors]

binding.pry
=begin
r = Rock.new
puts Game.score
r.score += 1
puts r.score

p = Paper.new
puts p.score
=end
