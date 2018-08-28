require 'studio_game/clumsy_player'

module StudioGame
  describe ClumsyPlayer do
    before do
      @player = StudioGame::ClumsyPlayer.new("klutz")
      $stdout = StringIO.new
    end
    
    it "only gets half the point value for each treasure" do
      expect(@player.points).to eq(0)

      hammer = StudioGame::Treasure.new(:hammer, 50)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)

      expect(@player.points).to eq(75)

      crowbar = StudioGame::Treasure.new(:crowbar, 400)
      @player.found_treasure(crowbar)
      
      expect(@player.points).to eq(275)
      
      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq([StudioGame::Treasure.new(:hammer, 75), StudioGame::Treasure.new(:crowbar, 200)])
    end
  end
end