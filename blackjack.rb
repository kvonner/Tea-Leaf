#Method definition

def calc_tot(cards)
	card_vals = cards.map{ |e| e[1]}

	total = 0
	card_vals.each do |value|
		if value == "A"
			total += 11
		elsif value.to_i == 0 #Jack, Queen, King
			total += 10
		else
			total += value.to_i
		end
	end

#Correct for Aces
card_vals.select{|e| e == "A"}.count.times do
	total -= 10 if total < 21
end

	total
end

#Starts game

puts "Whats your name player?"
name = gets.chomp
puts "Hope you're feeling lucking today"

#Create deck

suit = [ "Hearts", "Diamonds", "Clubs", "Spades" ]
value =[ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]

deck = suit.product(value)
deck.shuffle!

#Deal cards

playercards = []
dealercards = []

playercards << deck.pop
dealercards << deck.pop
playercards << deck.pop
dealercards << deck.pop

#Show cards

dealer_tot = calc_tot(dealercards)
player_tot = calc_tot(playercards)

puts "Dealer has #{dealercards[0]} and #{dealercards[1]} for a total of #{dealer_tot}"
puts "#{name} has #{playercards[0]} and #{playercards[1]} for a total of #{player_tot}"

if player_tot == 21
	puts "Blackjack! You win #{name}!"
	exit
elsif dealer_tot == 21
	puts "Dealer has Blackjack, sorry #{name}, you lose!"
	exit
end

if player_tot > 21
	puts "Sorry #{name} you bust sucka!"
	exit
elsif dealer_tot > 21
	puts "Dealer busts, and you win!"
	exit
end

#Hit or Stay

while player_tot < 21
	puts "Hit or Stay?"
	hit_stay = gets.chomp
	if hit_stay == "Hit"
		playercards << deck.pop
		player_tot = calc_tot(playercards)
		puts "#{name} now has #{player_tot} and dealer has #{dealer_tot}"
	elsif hit_stay == "Stay"
		puts "#{name} stays at #{player_tot}"
		break
	else
		puts "pick a valid choice (1 for hit, 2 for stay)"
	end

	if player_tot > 21
		puts "sorry #{name}, you busted and the dealer wins!"
		exit
	end
end

#Dealer's turn

while dealer_tot < 17
	dealercards << deck.pop
	dealer_tot = calc_tot(dealercards)
	puts "dealer now has #{dealer_tot} and player has #{player_tot}"
	if dealer_tot > 21
		puts "dealer busts and #{name} wins!"
		exit
	end
end
puts "dealer stays at #{dealer_tot}"

#Determining a winner
if dealer_tot > player_tot
	puts "Dealer wins! sorry #{name}!"
else
	puts "#{name} wins! you're a champion! don't forget to tip"
end