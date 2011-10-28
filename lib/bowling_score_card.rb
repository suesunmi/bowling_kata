class Game
  def initialize
    @all_rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @all_rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    roll_index = 0
    10.times do

      if strike?(roll_index)
        score += 10 + @all_rolls[roll_index+1] + @all_rolls[roll_index+2]
        roll_index += 1
      elsif spare?(roll_index)
        score += 10 + @all_rolls[roll_index+2]
        roll_index += 2
      else
        score += @all_rolls[roll_index] + @all_rolls[roll_index + 1]
        roll_index += 2
      end

    end
    score 
  end

  def strike?(roll_index)
    @all_rolls[roll_index] == 10
  end

  def spare?(roll_index)
    @all_rolls[roll_index] + @all_rolls[roll_index+1] == 10
  end
end
