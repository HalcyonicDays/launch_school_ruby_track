=begin
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
and marks a square on the board. First player to reach 3 squares in a row,
including diagonals, wins. If all 9 squares are marked and no player has 3
squares in a row, then the game is a tie.

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end

PLAYERS = { player_1: {id: 1, token: 'X' },
            player_2: {id: 2, token: 'O' } }

WINSTATES = [[0, 1, 2], [3, 4, 5], [6, 7, 8]] +
            [[0, 3, 6], [1, 4, 7], [2, 5, 8]] +
            [[0, 4, 8], [2, 4, 6]]

def winner_exists?(board, player, score)
  WINSTATES.each do |set|
    summary = board.values_at(*set)

    if summary.all? PLAYERS[player][:token]
      score[PLAYERS[player][:id]] += 1
      puts "Player #{PLAYERS[player][:id]} is the winner!"
      return true
    end
  end

  false
end

def display_board(board)
  puts "
  #{board[0]}|#{board[1]}|#{board[2]}
  -+-+-
  #{board[3]}|#{board[4]}|#{board[5]}
  -+-+-
  #{board[6]}|#{board[7]}|#{board[8]}
  "
end

def get_available_squares(board)
  board.select { |value| value == value.to_s.to_i }
end

def joinor(arr, delimiter=', ', conjunction='or')
  case arr.size
  when 0..1 then arr.join(delimiter)
  when 2    then arr.join(" #{conjunction} ")
  else
    arr[-1] = arr.last.to_s.prepend("#{conjunction} ")
    arr.join(delimiter)
  end
end

def player_plays(board)
  selection = nil
  loop do
    puts "Please select an available square: #{joinor(get_available_squares(board))}"
    selection = gets.chomp.to_i

    break if board.include?(selection)
    puts "Invalid selection"
  end

  board[selection - 1] = PLAYERS[:player_1][:token]
end

def opponent_plays(board)
  move = (play_offensively(board)  or 
          play_defensively(board)  or 
          secure_the_middle(board) or
          play_carelessly(board))
  board[move - 1] = PLAYERS[:player_2][:token]
end

def play_offensively(board)
  find_at_risk_position(board, PLAYERS[:player_2])
end

def play_defensively(board)
  find_at_risk_position(board, PLAYERS[:player_1])
end

def secure_the_middle(board)
  5 if get_available_squares(board).include?(5)
end

def play_carelessly(board)
  get_available_squares(board).sample
end

def find_at_risk_position(board, player)
  WINSTATES.each do |set|
    summary = board.values_at(*set)
    if summary.count(player[:token]) == 2
      potential_move = (summary - [player[:token]]).first 
      return potential_move if get_available_squares(board).include?(potential_move)
    end
  end
  nil
end

def no_available_plays?(board)
  if get_available_squares(board).none?
    puts "It's a draw!"
    true
  else
    false
  end
end

def reset_board
  (1..9).to_a
end

def determine_starting_player(prompt = true)
  return [:player_1, :player_2].sample unless prompt
  puts "Would you like to go first? (y)es to go first, or anything else to go second."
  opening_move = gets.chomp.downcase
  opening_move.start_with?('y') ? :player_1 : :player_2
end

def alternate_player(current_player)
  current_player == :player_1 ? :player_2 : :player_1
end

def active_player_action(current_player, board)
  case current_player
  when :player_1 then player_plays(board)
  when :player_2 then opponent_plays(board)
  end
end

score = {1 => 0, 2 => 0}

loop do
  board = reset_board
  current_player = :player_1

  alternate_player(current_player) if determine_starting_player == :player_2

  loop do
    system 'cls'
    display_board(board)

    active_player_action(current_player, board)
    break if winner_exists?(board, current_player, score) || no_available_plays?(board)
    current_player = alternate_player(current_player)
  end

  display_board(board)
  break if score.values.any?(5)

  puts "Would you like to play again? (y)es to play, anything else to cancel."
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

puts "Player #{score.key(5)} is the champion!" if score.values.any?(5)
puts "Good-bye!"
