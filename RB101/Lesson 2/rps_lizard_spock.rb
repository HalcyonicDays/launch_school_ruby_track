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
    player_loses
    rock_wins
  end

  def alien
    player_wins
    alien_wins
  end
end

class Paper < RockPaperScissors
  def lizard
    player_wins
    lizard_wins
  end

  def alien
    player_loses
    paper_wins
  end
end

class Scissors < RockPaperScissors
  def lizard
    player_loses
    scissors_wins
  end

  def alien
    player_wins
    alien_wins
  end
end

class Lizard < RockPaperScissors
  def rock
    player_wins
    rock_wins
  end

  def paper
    player_loses
    lizard_wins
  end

  def scissors
    player_wins
    scissors_wins
  end

  def lizard
    tie_result
  end

  def alien
    player_loses
    lizard_wins
  end
end

class Alien < RockPaperScissors
  def rock
    player_loses
    alien_wins
  end

  def paper
    player_wins
    paper_wins
  end

  def scissors
    player_loses
    alien_wins
  end

  def lizard
    player_wins
    lizard_wins
  end

  def alien
    tie_result
  end
end

MOVES.push(Lizard, Alien)
