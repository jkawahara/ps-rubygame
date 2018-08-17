require_relative 'player'
require_relative 'game_turn'

class Game

	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player (a_player)
		@players << a_player
	end

	def play
		puts "There are #{@players.size} players in #{@title.capitalize}:"
		
		@players.each do |player|	
			puts player
		end
		
		@players.each do |player|
			GameTurn.take_turn(player)
		end
	end
end

if __FILE__ == $0
	player = Player.new("larry")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end