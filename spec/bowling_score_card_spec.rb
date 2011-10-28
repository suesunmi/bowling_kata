require 'bowling_score_card'

describe Game do

  before(:each) do
    @scoring_game = Game.new
  end

  def roll_many(roll_count, pin_count)
    roll_count.times { @scoring_game.roll(pin_count) }
  end

  def roll_spare
    @scoring_game.roll(5)
    @scoring_game.roll(5)
  end

  describe "#score" do

    it "test gutter game" do
      roll_many(20,0)
      @scoring_game.score.should == 0
    end

    it "test all ones" do
      roll_many(20,1)
      @scoring_game.score.should == 20
    end

    it "test one spare" do
      roll_spare
      @scoring_game.roll(3)
      roll_many(17,0)
      @scoring_game.score.should == 16
    end

    it "doesn't add to the score across calls to score" do
      @scoring_game.roll(1)

      @scoring_game.score
      @scoring_game.score.should == 1
    end

    it "test one strike" do
      @scoring_game.roll(10)
      @scoring_game.roll(3)
      @scoring_game.roll(4)
      roll_many(16,0)
      @scoring_game.score.should == 24 
    end

    it "test perfect game" do
      roll_many(12,10)
      @scoring_game.score.should == 300
    end

  end

end
