class RockPaperScissors
  def lizard; end
  def alien; end

  def lizard_wins
    "Lizard bites its way to victory!"
  end

  def alien_wins
    "Logically, the alien must triumph!"
  end
end

class Rock < RockPaperScissors
  def lizard
    rock_wins
  end

  def alien
    alien_wins
  end
end

class Paper < RockPaperScissors
  def lizard
    lizard_wins
  end

  def alien
    paper_wins
  end
end

class Scissors < RockPaperScissors
  def lizard
    scissors_wins
  end

  def alien
    alien_wins
  end
end

class Lizard < RockPaperScissors
  def rock
    rock_wins
  end

  def paper
    lizard_wins
  end

  def scissors
    scissors_wins
  end

  def lizard
    tie_result
  end

  def alien
    lizard_wins
  end
end

class Alien < RockPaperScissors
  def rock
    alien_wins
  end

  def paper
    paper_wins
  end

  def scissors
    alien_wins
  end

  def lizard
    lizard_wins
  end

  def alien
    tie_result
  end
end

MOVES.push(Lizard, Alien)