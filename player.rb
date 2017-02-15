# A player has a name
# a player has 3 lives
# player loses life after each incorrect answer

module MathGame
  class Player

    attr_accessor :name, :life, :score

    def initialize(name)
      @name = name
      @life = 3
      @score = 0
    end

    def to_s
     @name
    end

    def lose_life
      @life -= 1
    end

    def player_score
      @score += 1
    end

  end

end

