#Method definition: Card total

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
		total -= 10 if total > 21
	end

	total
end

#Method definition: Winner

def winning (name, player_tot, dealer_tot)
	if dealer_tot == 21
		puts "Dealer has black jack. #{name} - you lose."
		winner = "Dealer"
	elsif dealer_tot >21
		puts "Dealer busts. #{name} - you win"
		winner = "Player"
	elsif dealer_tot > player_tot
		puts "Dealer has a higher total. #{name} - you lose"
		winner = "Dealer"
	elsif dealer_tot < player_tot
		puts "#{name} you're the winner!"
		winner = "Player"
	else
		puts "Player and dealer have equal total. #{name} - it's a push."
		winner = "Push"
	end
	return winner
end

#Starts game

puts "Whats your name player?"
name = gets.chomp
puts "Hope you're feeling lucking today #{name}"
puts "------------------------------------------"
sleep(1)


#Create deck

suit = [ "Hearts", "Diamonds", "Clubs", "Spades" ]
value =[ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]

deck = suit.product(value)
deck.shuffle!

wants_to_play = true

while wants_to_play == true

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

	puts
	puts "Dealer has #{dealercards[0]} and #{dealercards[1]} for a total of #{dealer_tot}"
	puts "#{name} has #{playercards[0]} and #{playercards[1]} for a total of #{player_tot}"
	puts
	puts "------------------------------------------"
	puts


#Instant wins
	if player_tot == 21
		puts "Blackjack! You win #{name}!"
		winner = "Player"
	elsif dealer_tot == 21
		puts "Dealer has Blackjack, sorry #{name}, you lose!"
		winner = "Dealer"
	end

#Player's turn

	while winner == nil
		puts

		if player_tot == 21
			puts "Blackjack! #{name} wins!"
			winner = "Player"
		elsif player_tot > 21
			puts "sorry #{name}, you busted and the dealer wins!"
			winner = "Dealer"
		else
			puts "Do you want to hit or stay"
			hit_stay = gets.chomp

			if hit_stay.downcase == "hit"
				playercards << deck.pop
				player_tot = calc_tot(playercards)
				puts "You're dealt a #{playercards.last}. #{name} now has #{player_tot} and dealer has #{dealer_tot}"
				sleep(1)
			elsif hit_stay.downcase == "stay"
				puts "#{name} stays at #{player_tot}"
				sleep(1)
				break
			else
				puts "pick a valid choice: either 'Hit' or 'Stay'"
			end
		end
	end

#Dealer's turn

	if winner == nil

		while dealer_tot < 17
			dealercards << deck.pop
			dealer_tot = calc_tot(dealercards)
			puts "Dealer is dealt a #{dealercards.last}."
			puts "dealer now has #{dealer_tot} and player has #{player_tot}"
			sleep(1)

			if dealer_tot > 21
				puts "dealer busts and #{name} wins!"
				winner = "Player"-
			end

			if dealer_tot == 21
				puts "Blackjack! Dealer wins!"
				winner = "Dealer"
			end
		end
		puts "dealer stays at #{dealer_tot}"

#Determining a winner

winner = winning(name, player_tot, dealer_tot)
end 
#		if winner == "Dealer"
#			puts "Dealer wins! sorry #{name}!"
#		elsif winner == "Push"
#				puts "Push! you keep your bet #{name}"
#		else
#			puts "good game #{name}."
#		end

#Play again?

	puts "Good game #{name}. Would you like to play again? (yes/no)"
	if gets.chomp.downcase != "yes"
		puts "Come back soon!"
		wants_to_play = false
	else
		puts
		puts "Re-dealing cards"
		puts "------------------------------------------"
		puts
		winner = nil
	end
	
end