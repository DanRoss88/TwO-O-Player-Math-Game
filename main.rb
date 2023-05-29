require_relative 'turn.rb'
require_relative 'player.rb'
require_relative 'question.rb'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @turn = Turn.new(@player1, @player2)
    @questions = generate_questions
  end

  def start_game
    puts "Welcome to the Math Game!"
    set_player_name(@player1)
    set_player_name(@player2)
    puts "Let's begin!"
    play_rounds
    end_game
  end

  def set_player_name(player)
    puts "#{player.name}, please enter your name:"
    player.name = gets.chomp
  end

  def play_rounds
    @turn.display_current_player
    @questions.shuffle.each do |question|
      question.ask_question(@turn.current_player)
      update_score(question.check_answer)
      display_scores
      switch_turn
      puts "----- NEW TURN -----"
    end
  end

  def generate_questions
    questions = []
    questions << Question.new("What is 2 + 2?", 4)
    questions << Question.new("What is 3 + 3?", 6)
    questions << Question.new("What is 4 + 4?", 8)
    questions << Question.new("What is 5 + 5?", 10)
    questions << Question.new("What is 6 + 6?", 12)
    questions << Question.new("What is 7 + 7?", 14)
    questions << Question.new("What is 8 + 8?", 16)
    questions << Question.new("What is 9 + 9?", 18)
    questions << Question.new("What is 10 + 10?", 20)
    questions << Question.new("What is 11 + 11?", 22)
    questions << Question.new("What is 12 + 12?", 24)
    questions << Question.new("What is 13 + 13?", 26)
    questions
  end

  def update_score(correct)
    if correct
      @turn.current_player.score += 1
    end
  end

  def display_scores
    puts "#{@player1.name}: #{@player1.score}"
    puts "#{@player2.name}: #{@player2.score}"
  end

  def switch_turn
    @turn.switch_players
  end

  def end_game
    if @player1.score == 3
      winner = @player1
    else
      winner = @player2
    end

    puts "#{winner.name} wins with a score of #{winner.score}/3"
    puts "Game over"
    puts "Goodbye!"
  end
end

game = Game.new
game.start_game