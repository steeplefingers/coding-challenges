Feature: Clearent Coding Challenge

# Visa gets 10%
# MC gets 5% interest
# Discover gets 1% interest

# 1 person has 1 wallet and 3 cards (1 Visa, 1 MC 1 Discover) – Each Card has a balance of $100 –
# calculate the total interest (simple interest) for this person and per card. 

#  1 person has 2 wallets  Wallet 1 has a Visa and Discover , wallet 2 a MC -  each card has $100 balance - 
# calculate the total interest(simple interest) for this person and interest per wallet

#  2 people have 1 wallet each,  person 1 has 1 wallet , with 2 cards MC and visa, person 2 has 1 wallet – 1 visa and 1 MC -  each card has $100 balance - 
# calculate the total interest(simple interest) for each person and interest per wallet

@test1
Scenario: Person with 1 Wallet and 1 of Each Card--Interest for Person and Each Card
	Given a person has a wallet
	 When the wallet has a Visa card with a balance of $100
	 Then the interest for the card should be $10
	 When the wallet has a MasterCard card with a balance of $100
	 Then the interest for the card should be $5
	 When the wallet has a Discover card with a balance of $100
	 Then the interest for the card should be $1
	  And the interest for the person should be $16


@test2
Scenario: Person with 2 Wallets--Interest on Both Wallets and for Person
	Given a person has a wallet
	 When the wallet has a Visa card with a balance of $100
	 Then the interest for the card should be $10
	 When the wallet has a Discover card with a balance of $100
	 Then the interest for the card should be $1
	  And the interest for this wallet should be $11
	Given the person has another wallet
	 When the wallet has a MasterCard card with a balance of $100
	 Then the interest for the card should be $5
	  And the interest for this wallet should be $5
	  And the interest for the person should be $16


@test3
Scenario: 2 People with 1 Wallet Each--Interest for Each Person and Each Wallet
	Given a person has a wallet
	 When the wallet has a MasterCard card with a balance of $100
	  And it has a Visa card with a balance of $100
	 Then the interest for this wallet should be $15
	  And the interest for this person should be $15
	Given another person has a wallet 
	  And the wallet has a Visa card with a balance of $100
	  And it has a MasterCard card with a balance of $100
	 Then the interest for this wallet should be $15
	  And the interest for this person should be $15