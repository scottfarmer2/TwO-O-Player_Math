# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './player'
require './question'



# newGame = MathGame::Game.new

# newGame.start_game


def start_game
      print "Player 1, enter badass name: "
      @player1 = MathGame::Player.new(gets.chomp)
      print "Player 2, try and keep up with naming scheme: "
      @player2 = MathGame::Player.new(gets.chomp)


      puts "Welcome #{@player1} and #{@player2}!"
    end

@game_on = true

@turn = 0

start_game


  while @game_on

      if @turn == 0
        print "#{@player1}: "
      elsif @turn == 1
        print "#{@player2}: "
      end


      question = MathGame::Question.new

      @answer_input = gets.chomp.to_i


      if @turn == 0 && question.check_answer(@answer_input)
        puts "Nice snipe Buddy!"
        @player1.player_score
        @turn += 1
      elsif @turn == 0 && !question.check_answer(@answer_input)
        puts "tough luck buddy.."
        @player1.lose_life
        @turn += 1
      elsif @turn == 1 && question.check_answer(@answer_input)
        puts "Good for you two.. you're my hero."
        @player2.player_score
        @turn -= 1
      elsif @turn == 1 && !question.check_answer(@answer_input)
        puts "We can't all be winners buddy..."
        @player2.lose_life
        @turn -= 1
      end

      puts "SCORE:
          #{@player1.name}: #{@player1.score} CORRECT ANSWERS #{@player1.life} REMAINING LIVES
          #{@player2.name}: #{@player2.score} CORRECT ANSWERS #{@player2.life} REMAINING LIVES"
      puts

      if @player1.life < 1 || @player2.life <1
        puts "Sorry bud! Game OVER."
        if @player1.life < 1
          puts "Way to go #{@player2.name} ya dun good!"

          @game_on = false
        elsif @player2.life < 1
          puts "The winner is #{@player1.name}, never doubted it!"

          @game_on = false
        end

        puts "The final score was:
            #{@player1.name}: #{@player1.score} CORRECT ANSWERS #{@player1.life} REMAINING LIVES
            #{@player2.name}: #{@player2.score} CORRECT ANSWERS #{@player2.life} REMAINING LIVES"
      end


end