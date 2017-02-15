# a question is rendered with two randomlly generated numbers

module MathGame

  class Question

    def initialize
      @first_number = Random.rand(1..20)
      @second_number = Random.rand(1..20)
      @answer = @first_number + @second_number
      puts "What does #{@first_number} + #{@second_number} equal?"
    end

    def question

    end

    def check_answer(answer_input)
      if answer_input == @answer
        return true
      else
        return false
      end
    end

  end
end


