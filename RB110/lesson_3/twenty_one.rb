=begin
PEDAC Practice!

Problem: Create a Blackjack-like game

Requirements:
- Create and shuffle a standard deck of 52 cards
- The player is dealt 2 visible cards
- The dealer is dealt 2 cards, but only one is visible
- Player can choose to "hit" (get another card) or "stay" (end)
- Dealer must "hit" if their total is less than 17
- Player automatically loses (goes bust) if their score goes over 21
- Player automatically wins if their score is exactly 21
- Player also wins if their score is greater than the dealer's (without busting)
- Face cards ("J", "Q", "K") are worth 10 points
- An Ace "A" can be worth 11 points or 1 point
- All number cards (2..10) are worth points equal to their value
- An Ace should always be worth the maximum possible amount
  - i.e. 11 points if the total is <= 21, or 1 point if the total would be > 21

Algorithm:
1. Create the deck
2. Shuffle the deck
3. Deal 2 cards to the dealer
   - only one card is visible ("Dealer is showing X")
   - generate message to stylize card name
4. Deal 2 cards to the player and calculate current total
   - if the player has 21, the round ends
5. Give the player the option to hit or stay
6. on hit, deal another card and recalculate total
   - check for 21 or bust
7. Repeat until player chooses to "stay" (loop back to 5)
8. Dealer hits or stays per Dealer Rules (loop back to self)
9. Determine winner
   - highest score without exceeding 21
10. Ask if player would like to play another round (loop back to 1)
=end

TWENTY_ONE = 21
HIGH_ACE_VALUE = 11
LOW_ACE_VALUE = 1
FACE_CARD_VALUE = 10
SUITS = %w(Hearts Diamonds Clubs Spades)
TYPES = %w(2 3 4 5 6 7 8 9 Jack Queen King Ace)
STARTING_DECK = SUITS.product(TYPES)
VOWELS = %w(Ace 8)

VALUES = {
  "Ace" => HIGH_ACE_VALUE,
  "Jack" => FACE_CARD_VALUE,
  "Queen" => FACE_CARD_VALUE,
  "King" => FACE_CARD_VALUE
}

def determine_value(value)
  VALUES.fetch(value) { value.to_i }
end

def announce_hand(name, hand, limit=nil)
  visible_cards = limit ? hand.last(limit) : hand
  visible_cards.each do |card|
    article = VOWELS.include?(card[1]) ? 'an' : 'a'
    puts "#{name} is showing #{article} #{card[1]} of #{card[0]}"
  end
  # total = calculate_total(visible_cards)
end

def calculate_total(hand)
  total = 0

  hand.each { |card| total += determine_value(card[1]) }
  aces = hand.count { |card| card[1] == 'Ace' }

  while total > TWENTY_ONE && aces >= 1
    total -= (HIGH_ACE_VALUE - LOW_ACE_VALUE)
    aces -= 1
  end

  puts "Current total is: #{total}"
  total
end

def busted?(score)
  score > TWENTY_ONE
end

def hit(name, deck, hand, hidden_draw: false)
  hand << deck.pop
  announce_hand(name, hand, 1) unless hidden_draw
end

def determine_winner(player_total, dealer_total)
  return "It's a tie!  No one" if player_total == dealer_total
  scores = { "Player" => player_total, "Dealer" => dealer_total }
  max_score = scores.max_by { |_player, score| score }
  scores.key(max_score[1])
end

loop do
  # Reset the game
  deck = STARTING_DECK.shuffle
  players_hand = []
  dealers_hand = []
  winner = nil

  # Deal cards
  hit("Dealer", deck, dealers_hand, true)
  hit("Dealer", deck, dealers_hand)
  2.times { hit("Player", deck, players_hand) }

  player_total = calculate_total(players_hand)
  winner = "Player" if player_total == TWENTY_ONE

  # Player Hit or Stay loop
  until busted?(player_total) || winner
    puts "Will you (h)it or (s)tay?"
    response = gets.chomp.downcase

    if response.start_with?('h')
      puts "Player hits!"
      hit("Player", deck, players_hand)
      player_total = calculate_total(players_hand)
      winner = "Player" if player_total == TWENTY_ONE
    elsif response.start_with?('s')
      puts "player stays on #{player_total}"
      break
    else
      puts "I didn't understand that..."
    end
  end

  winner = "Dealer" if busted?(player_total)

  # Dealer Hit or Stay loop
  dealer_total = calculate_total(dealers_hand)
  while dealer_total < 17 && !winner
    puts "Dealer hits!"
    hit("Dealer", deck, dealers_hand)
    dealer_total = calculate_total(dealers_hand)
    winner = "Dealer" if dealer_total == TWENTY_ONE
  end
  winner = "Player" if busted?(dealer_total)

  # Determine winner
  winner ||= determine_winner(player_total, dealer_total)
  puts "#{winner} is the winner!"

  puts "Would you like to play again? (y)es to play, anything else to cancel."
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end
