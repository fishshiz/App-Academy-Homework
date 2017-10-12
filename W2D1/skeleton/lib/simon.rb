class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Repeat the sequence."

    i = 0
    while i < @sequence_length
    input = gets.chomp
      if input != @seq[i]
        @game_over == true
        game_over_message
        reset_game
    end
      i += 1
    end
  end

  def add_random_color
    puts @seq += COLORS.sample(1)
    sleep 0.75
    system("clear")
  end

  def round_success_message
    puts "Nice one!"
  end

  def game_over_message
    puts "Game Over. You got through #{sequence_length - 1} rounds!"
  end

  def reset_game
    puts "Would you like to play again? (y/n)"
    input = gets.chomp
    if input == "y"
      @sequence_length = 1
      @game_over = false
      @seq = []
    else
      puts "okie dokes"
    end

  end
end

game = Simon.new
game.play
