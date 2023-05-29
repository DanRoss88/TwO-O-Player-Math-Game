class Turn
  attr_accessor :current_player, :other_player

  def initialize(player1, player2)
    @current_player = player1
    @other_player = player2
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def display_current_player
    puts "It's #{current_player.name}'s turn!"
  end
end
