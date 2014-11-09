

# black jack game
# 1. create card deck hash with loops
#     store value, suit, name_of_card
# 2. deal cards to user and computer
# 3. store cards each player has into 2 hands
# 4. remove cards from deck that were delt to 2 hands
# 5. play: user player receives 2 hits removing cards from deck and adding to the players score
#  6. player can stop or continue taking hits until his total 21 or more (game over) - store users total score
#  7. computer continues making plays until he hits at least 17 to 21- store computer total
#  8. If he goes over 21 game is over.



master_deck = []

for i in 2..9 do
    master_deck << ['spades','face', i]
    master_deck << ['clubs','face', i]
    master_deck << ['diamonds','face', i]
    master_deck << ['hearts','face', i]
end
master_deck.push(['spades','jack', 10], ['spades','queen', 10], ['spades','king', 10], ['spades','ace', 11])
master_deck.push(['clubs','jack', 10], ['clubs','queen', 10], ['clubs','king', 10], ['clubs','ace', 11])
master_deck.push(['diamonds','jack', 10], ['diamonds','queen', 10], ['diamonds','king', 10], ['diamonds','ace', 11])
master_deck.push(['hearts','jack', 10], ['hearts','queen', 10], ['hearts','king', 10], ['hearts','ace', 11])


def shuffle_cards(master_deck)
  master_deck.shuffle!
end

def deal_cards(master_deck, count)
  master_deck.first(count)
end

def remove_cards(master_deck, count)
  master_deck.drop(count)
end

def player_say(msg)
  if msg[1] != 'face'
    puts "You have a #{msg[1]} of #{msg[0]}"
  else
    puts "You have a #{msg[2]} of #{msg[0]}"
  end
end

def dealer_say(msg)
  if msg[1] != 'face'
    puts "The dealer has a #{msg[1]} of #{msg[0]}"
  else
    puts "The dealer has a #{msg[2]} of #{msg[0]}"
  end
end



def evaluate_game
  puts "You win" if players_total == 21
  puts "Dealer wins" if dealers_total == 21
end

system "clear"


players_total = 0
dealers_total = 0
shuffle_cards(master_deck)
player_deck = deal_cards(master_deck, 2)
master_deck = remove_cards(master_deck, 2)
dealer_deck = deal_cards(master_deck, 2)
master_deck = remove_cards(master_deck, 2)

puts "Dealing..."
player_deck.each { |card|  player_say card }

player_deck.each { |card| players_total += card[2] }

puts players_total

if players_total == 21
  puts "You win!"
  exit
end

dealer_deck.each { |card|  dealer_say card }

dealer_deck.each { |card| dealers_total += card[2] }

puts dealers_total

#p player_deck

begin
# system "clear"
if players_total == 21
  puts "You win!"
  exit
end

if dealers_total == 21
  puts "Dealer wins!"
  exit
end

if players_total > 21
  puts "You're Busted, dealer wins!"
end

puts "Hit? Y / N"
choice = gets.chomp.downcase
if choice == 'y'
player_deck += deal_cards(master_deck, 1)
master_deck = remove_cards(master_deck, 1)

#p player_deck
system "clear"

players_total = 0
dealers_total = 0
puts "Dealing..."
player_deck.each { |card|  player_say card }
player_deck.each { |card| players_total += card[2] }
end
puts "Score:  #{players_total}" #if players_total <= 21

player_deck.each do |card|
  if players_total > 21 && card[1] == 'ace'
   players_total -= 10
  # puts players_total
 end
end

dealer_deck.each { |card|  dealer_say card }
dealer_deck.each { |card| dealers_total += card[2] }
puts dealers_total


end until players_total >= 21 || choice == "n"












players_total = 0
dealers_total = 0

begin

if players_total > 21
  puts "You're busted!"
  exit
end


if players_total > 21
  puts "You're busted!"
  exit
end

if players_total == 21
  puts "You win!"
  exit
end

if players_total < dealers_total
  puts "You lose, dealers wins!"
  exit
end

players_total = 0
dealers_total = 0
system "clear"

choice = 'Y'
if choice == 'Y'
    dealer_deck += deal_cards(master_deck, 1)
    master_deck = remove_cards(master_deck, 1)



    player_deck.each { |card|  player_say card }
    player_deck.each { |card| players_total += card[2] }
    puts players_total

    if players_total == 21
      puts "You win!"
      exit
    end

    if players_total > 21
      puts "You're busted, dealer wins!"
      exit
    end


    puts "Dealing..."
    dealer_deck.each { |card|  dealer_say card }
    dealers_total = 0
    dealer_deck.each { |card| dealers_total += card[2] }
end
puts dealers_total if dealers_total <= 21

dealer_deck.each do |card|
  if dealers_total > 21 && card[1] == 'ace'
   dealers_total -= 10
   puts dealers_total
 end
end



puts dealers_total if dealers_total > 21
puts "Dealer busted, you win!" if dealers_total > 21
puts "Dealer wins!" if (dealers_total >= players_total) && (dealers_total <= 21) && dealers_total >= 17

end until (dealers_total >= 17 && dealers_total <= 21 && dealers_total > players_total) || (dealers_total > 21) || (choice == "N")
#puts dealers_total
