class Die
	attr_reader :number

	def initialize
		@number
	end

	def roll
		@number = rand (1..6)
	end
end 