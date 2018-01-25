# Battleship

Welcome to Battleship is a war ruby game played on ocean by two players. Each player gets the same number of battleships of a particular type placed on the battle area. Note: One player cannot see the other player’s battleship locations.

It take input from text file and display output on ruby console.

Requirement :

* Ruby version (>= 2.1.0)

* Bundler version (>= 1.14.6)
    
Steps :

* Unzip battleship folder
    
    Unzip battleship

    cd battleship/

* Resolve Dependencies
    
    run -> bundle install
    
* Run Application
    
    ruby application.rb


Sample Input : 

	Enter area boundaries: 5 E
	Type for battleship 1: Q
	Dimension for battleship 1: 1 1
	Location of battleship 1 for player A: A1
	Location of battleship 1 for player B: B2
	Type for battleship 2: P
	Dimension for battleship 2: 2 1
	Location of battleship 2 for player A: D4
	Location of battleship 2 for player B: C3
	Missile targets for player A: A1 B2 B2 B3
	Missile targets for player B: A1 B2 B3 A1 D1 E1 D4 D4 D5 D5


Sample Output: 

	Player 1 fires a missile with target A1 which missed
	Player 2 fires a missile with target A1 which hit
	Player 2 fires a missile with target B2 which missed
	Player 1 fires a missile with target B2 which hit
	Player 1 fires a missile with target B2 which missed
	Player 2 fires a missile with target B3 which missed
	Player 1 fires a missile with target B3 which missed
	Player 2 fires a missile with target A1 which missed
	Player 1 has no more missiles left
	Player 2 fires a missile with target D1 which missed
	Player 1 has no more missiles left
	Player 2 fires a missile with target E1 which missed
	Player 1 has no more missiles left
	Player 2 fires a missile with target D4 which hit
	Player 2 fires a missile with target D4 which missed
	Player 1 has no more missiles left
	Player 2 fires a missile with target D5 which hit
	Player 2 won the battle


Thanks!
Piyush Awasthi
