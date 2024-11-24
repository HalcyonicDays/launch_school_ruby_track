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
SUITS = %w(Hearts Diamonds Clubs Spades)
TYPES = %w(2 3 4 5 6 7 8 9 Jack Queen King Ace)
STARTING_DECK = SUITS.product(TYPES)
VOWELS = %w(Ace 8)

VALUES = {"Ace" => 11, "Jack" => 10, "Queen" => 10, "King" => 10 }

def determine_value(value)
  VALUES.fetch(value) { value.to_i }
end

def announce_hand(hand, limit=nil)
  visible_cards = limit ? hand.first(limit) : hand
  visible_cards.each do |card|
    article = VOWELS.include?(card[1]) ? 'an' : 'a'
    puts "<name> is showing #{article} #{card[1]} of #{card[0]}"
  end
  calculate_total(visible_cards)
end

def calculate_total(hand)
  total = 0
  
  hand.each do |card|
    total += determine_value(card[1])
  end
  
  aces = hand.count { |card| card[1] == 'Ace' }
  
  
  puts "total is #{total}"
end

# Reset the game
deck = STARTING_DECK.shuffle
dealers_hand = []
players_hand = []

2.times { dealers_hand <<  deck.pop }
announce_hand(dealers_hand, 1)

2.times { players_hand << deck.pop }
announce_hand(players_hand)
