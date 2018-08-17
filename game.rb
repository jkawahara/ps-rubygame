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

	def play(rounds)
		puts "There are #{@players.size} players in #{@title.capitalize}:"

		@players.each do |player|	
			puts player
		end
		
		1.upto(rounds) do |round|
			puts"\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end

	def print_stats
		puts "\n#{title.capitalize} Statistics:"
			
		strong_players, wimpy_players = @players.partition { |player| player.strong? }

		puts "\n#{strong_players.size} strong player(s):"
		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{wimpy_players.size} wimpy player(s):"
		wimpy_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{title.capitalize} High Scores:"
		@players.sort.each do |player|
			formatted_name = player.name.ljust(20, '.')
			puts "#{formatted_name} #{player.score}"
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