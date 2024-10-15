class RockPaperScissors
  @@wins = 0
  @@losses = 0

  def self.wins
    @@wins
  end

  def self.losses
    @@losses
  end

  def player_wins
    puts "player wins!"
    @@wins += 1
  end

  def player_loses
    puts "player loses!"
    @@losses += 1
  end

  def self.game_over?
    @@wins >= MATCH_SIZE || @@losses >= MATCH_SIZE
  end

  def rock;     end
  def paper;    end
  def scissors; end

  def tie_result
    "it's a tie!"
  end

  def rock_wins
    "Rock crushes the opposition!"
  end

  def paper_wins
    "Paper wins elegantly!"
  end

  def scissors_wins
    "Scissors slash through the competition!"
  end
end

class Rock < RockPaperScissors
  def rock
    tie_result
  end

  def paper
    player_wins
    paper_wins
  end

  def scissors
    player_loses
    rock_wins
  end
end

class Paper < RockPaperScissors
  def rock
    player_wins
    paper_wins
  end

  def paper
    tie_result
  end

  def scissors
    player_loses
    scissors_wins
  end
end

class Scissors < RockPaperScissors
  def rock
    player_wins
    rock_wins
  end

  def paper
    player_loses
    scissors_wins
  end

  def scissors
    tie_result
  end
end

MOVES = [Rock, Paper, Scissors]
MATCH_SIZE = 3

def implement_advanced_rules
  require_relative 'rps_lizard_spock'
end

def get_choice
  message = "Select"
  MOVES.each_with_index { |move, idx| message << " (#{idx + 1}) #{move}," }
  puts message.chop << ':'
  return gets.chomp.downcase[0] # redundant return included for clarity
end

def throw_hands
  choice = get_choice
  hand = case
         when (1..MOVES.size).include?(choice.to_i)
           MOVES[choice.to_i - 1]
         when MOVES.map { |move| move.to_s.downcase[0] }.include?(choice)
           MOVES.select { |move| move.to_s.downcase[0].include?(choice) }.first
         else
           puts "I didn't understand that; please try again"
           return throw_hands
         end
  hand.to_s.downcase.to_sym
end

=begin
def throw_hands
  choice = get_choice
  if (1..MOVES.size).include?(choice.to_i)
    MOVES[choice.to_i - 1]
  elsif MOVES.map { |move| move.to_s.downcase[0] }.include?(choice)
    MOVES.select { |move| move.to_s.downcase[0].include?(choice) }.first
  else
    puts "I didn't understand that; please try again" and throw_hands
  end
=end

puts "Let's play Rock-Paper-Scissors!"

rounds = 0
loop do
  puts MOVES.sample.new().send(throw_hands)
  # puts MOVES.sample.new().send(throw_hands.to_s.downcase.to_sym)
  rounds += 1

  break if RockPaperScissors.game_over?

  puts "would you like to play again? y/n"
  continue = gets.chomp.downcase
  break unless continue.start_with?('y')

  if rounds == 2
    puts "would you like to play with advanced rules? y/n"
    if gets.chomp.downcase.start_with?('y')
      implement_advanced_rules
      puts "Let's play Rock-Paper-Scissors-Lizard-Sp...Alien!"
    else
      puts "Let's play again!"
    end
  end

  puts "Let's play again!" unless rounds == 2
end

if RockPaperScissors.wins >= MATCH_SIZE
  puts "You are the Grand Champion!"
elsif RockPaperScissors.losses >= MATCH_SIZE
  puts "You are the Grand Loser! (but we love you anyway)"
else
  puts "The match remains undecided!"
end

puts "Thank you for playing. Goodbye."
