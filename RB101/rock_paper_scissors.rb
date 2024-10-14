class RockPaperScissors
  def rock;     end
  def paper;    end
  def scissors; end

  def tie_result
    "it's a tie!"
  end

  def rock_wins
    "rock crushes scissors"
  end

  def paper_wins
    "paper covers rock"
  end

  def scissors_wins
    "scissors cut paper"
  end
end

class Rock < RockPaperScissors
  def rock
    tie_result
  end

  def paper
    paper_wins
  end

  def scissors
    rock_wins
  end
end

class Paper < RockPaperScissors
  def rock
    paper_wins
  end

  def paper
    tie_result
  end

  def scissors
    scissors_wins
  end
end

class Scissors < RockPaperScissors
  def rock
    rock_wins
  end

  def paper
    scissors_wins
  end

  def scissors
    tie_result
  end
end

MOVES = [Rock, Paper, Scissors]

def get_choice
  puts "Select (1) Rock, (2) Paper, or (3) Scissors:"
  return gets.chomp.downcase[0]  # redundant return included for clarity
end

puts "Let's play Rock-Paper-Scissors!"

loop do
  choice = case get_choice
           when '1' || 'r' then :rock
           when '2' || 'p' then :paper
           when '3' || 's' then :scissors
           else puts "I didn't understand that, please try again" and get_choice
           end

  puts MOVES.sample.new().send(choice)

  puts "would you like to play again? y/n"
  continue = gets.chomp.downcase
  break unless continue.starts_with?('y')
  puts "Let's play again!"
end

puts "Thank you for playing. Goodbye."
