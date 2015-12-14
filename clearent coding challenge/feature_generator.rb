card_types = ["Visa", "MasterCard", "Discover"]
max_number_people = 3
max_number_wallets = 3
max_number_cards = 3
max_number_tests = 10

def get_random_card_type
	return card_types.sample
end

def get_interest_rate_for_card_type(type)
	case type
	when "Visa"
		return 0.10
	when "MasterCard"
		return 0.05
	when "Discover"
		return 0.01
	else 
		fail "Unrecognized card of type #{type}. Aborting..."
	end
end

def get_calculated_interest(card_type, balance)
	return "%0.2f" % (get_interest_rate_for_card_type(card_type) * balance)
end


# generate a great big feature file
File.open('features/fuzz.feature', 'w') { |file| 
	file.write("Feature: Fuzz Testing with Generated Feature File\n")
	file.write("\n")

	for i in 1..max_number_tests # create 100 fuzz tests

		file.write("@test#{i}\n")
		file.write("Scenario: Generated Test\n")
		for p in 1..(1 + max_number_people) # random number of people
			$person_interest = 0.0
			for w in 1..(1 + max_number_wallets) # random number of wallets for this person
				$wallet_interest = 0.0
				file.write("Given a person has a wallet\n")	if w == 1
				file.write("Given the person has another wallet\n") if w != 1
				for c in 1..(1 + max_number_cards) # random number of cards for this person
					card_type = card_types.sample
					balance = rand(1000)
					calculated_interest = get_calculated_interest(card_type, balance)
					file.write("And the wallet has a #{card_types.sample} card with a balance of $#{balance}\n")
					file.write("Then the interest for the card should be $#{calculated_interest}\n")
					# add the interest for this card to the wallet and to the person
					$person_interest += calculated_interest.to_f
					$wallet_interest += calculated_interest.to_f
				end
				file.write("And the interest for this wallet should be $#{'%.2f' % $wallet_interest}\n")
			end
		    file.write("And the interest for this person should be $#{'%.2f' % $person_interest}\n")

		end
		file.write("\n")
	end
}