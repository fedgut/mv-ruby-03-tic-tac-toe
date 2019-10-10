# frozen_string_literal: true

# ./lib/TicTacToe.rb

class TicTacToe
  attr_reader :board
  attr_reader :players
  attr_reader :turn
  attr_reader :status
  attr_reader :enum_status

  def initialize(players)
    @players = []
    @players[0] = players[0]
    @players[1] = players[1]
    @board = (1..9).to_a
    @turn = 0

    @enum_status = { in_progress: 0, win: 1, draw: 2 } # enum
    @player_char = %w[O X]

    @status = @enum_status[:in_progress]
  end

  # set the choosen number into the board
  def set(num)
    player_id = @players[@turn % 2].id
    @board[num - 1] = @player_char[player_id]
    @turn += 1
  end

  def game_over?
    %w[012 345 678 036 147 258 048 246].each do |l|
      if @board[l[0].to_i] == @board[l[1].to_i] &&
         @board[l[1].to_i] == @board[l[2].to_i]
        @status = @enum_status[:win]
        @turn -= 1
        return true
      end
    end

    # TODO: Improve to check if there is a draw before turn 9
    if turn.eql?(9)
      @status = @enum_status[:draw]
      return true
    end

    false
  end

  def current_player
    @players[@turn % 2]
  end
end
