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

PLAYER_1 = { id: 1, token: 'X' }
PLAYER_2 = { id: 2, token: 'O' }

WINSTATES = {
  horizontals: [[0, 1, 2], [3, 4, 5], [6, 7, 8]],
  verticals: [[0, 3, 6], [1, 4, 7], [2, 5, 8]],
  diagonals: [[0, 4, 8], [2, 4, 6]]
}

def winner_exists?(board, player)
  spaces = []
  board.each_with_index do |cell, index|
    spaces << index if cell == player[:token]
  end

  WINSTATES.values.each do |win_set|
    win_set.each do |set|
      summary = set.map { |position| spaces.include?(position) }
      if summary.all? true
        puts "Player #{player[:id]} is the winner!"
        return true
      end
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

def player_plays(board)
  selection = nil
  loop do
    puts "Please select an available square: #{get_available_squares(board)}"
    selection = gets.chomp.to_i

    break if board.include?(selection)
    puts "Invalid selection"
  end

  board[selection - 1] = PLAYER_1[:token]
end

def opponent_plays(board)
  move = get_available_squares(board).sample
  board[move - 1] = PLAYER_2[:token]
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

loop do
  board = reset_board

  loop do
    system 'cls'
    display_board(board)

    player_plays(board)
    break if winner_exists?(board, PLAYER_1) || no_available_plays?(board)

    opponent_plays(board)
    break if winner_exists?(board, PLAYER_2) || no_available_plays?(board)
  end

  display_board(board)

  puts "Would you like to play again? (y)es to play, anything else to cancel."
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

puts "Good-bye!"