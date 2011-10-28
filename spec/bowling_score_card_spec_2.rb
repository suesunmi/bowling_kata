require 'game'

describe Game do
  describe #score do
    it "test gutter game" do
      my_game = Game.new
      20.times { my_game.roll(0) }
      my_game.score.should == 0
    end
  end
end
