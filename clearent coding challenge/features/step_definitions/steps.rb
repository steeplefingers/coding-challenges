# people is an array of persons. 
# person is an array of wallets.
# wallet is an array of cards.
# card is a hash of names/balances.

$people = []

Given(/^(a|the|another) person has (?:a|another) wallet$/) do |article|
	# this step implies a new person with a wallet
	if article == "a" or article == "another"
		add_new_person
	end
	add_new_wallet
end

Given(/^(?:it has |the wallet has |)a (Visa|MasterCard|Discover) card with a balance of \$(\d+)$/) do |card, balance|
	add_new_card(card, balance)	
end

Then(/^debug$/) do 
	print_people
end

Then(/^the interest for (?:the|this) person (?:is|should be) \$(.*)$/) do |interest|
	calculated_interest = get_interest_for_person($people[-1]).to_s
	fail "Interest was calculated to be #{calculated_interest}, was expected to be #{interest}" if calculated_interest != interest
end

Then(/^the interest for (?:the|this) wallet (?:is|should be) \$(.*)$/) do |interest|
	calculated_interest = get_interest_for_wallet($people[-1][-1]).to_s
	fail "Interest was calculated to be #{calculated_interest}, was expected to be #{interest}" if calculated_interest != interest
end

Then(/^the interest for (?:the card|it) (?:is|should be) \$(.*)$/) do |interest|
	calculated_interest = get_interest_for_card($people[-1][-1][-1]).to_s
	fail "Interest was calculated to be #{calculated_interest}, was expected to be #{interest}" if calculated_interest != interest
end

Before do |scenario|
	$people = []
end

def add_new_person
	person = []
	$people.push(person)
end

def add_new_wallet
	wallet = []
	# put the new wallet on the last person in the $people array
	$people[-1].push(wallet)
end

def add_new_card(card, balance)
	new_card = {"type" => "#{card}", "balance" => balance}
	$people[-1][-1].push(new_card)
end

def get_interest_for_wallet(wallet)
	interest = 0
	wallet.each do |card|
		interest += get_interest_for_card(card)
	end
	return interest
end

def get_interest_for_person(person)
	interest = 0
	person.each do |wallet|
		interest += get_interest_for_wallet(wallet)
	end
	return interest
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

def get_interest_for_card(card)
	balance = card["balance"]
	type = card["type"]
	rate = get_interest_rate_for_card_type(type)
	return (balance.to_f * rate.to_f).to_i
end


def print_people
	$people.each do |person|
		puts "person"
		person.each do |wallet|
			puts "   wallet"
			wallet.each do |card|
				puts "      card"
				card.each do |key, value|
					puts "         #{key}: #{value}"
				end
			end
		end
	end
end