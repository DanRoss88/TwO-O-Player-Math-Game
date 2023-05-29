class Question
  attr_accessor :prompt, :answer, :input

  def initialize(prompt, answer)
    @prompt = prompt
    @answer = answer
    @input = nil
  end

  def ask_question(player)
    puts "#{player.name}: #{prompt}"
    get_user_input
    check_answer
  end

  def get_user_input
    @input = gets.chomp.to_i
  end

  def check_answer
    if @input == @answer
      puts "Correct!"
      return true
    else
      puts "Wrong!"
      return false
    end
  end
end
