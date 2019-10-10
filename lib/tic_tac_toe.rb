# frozen_string_literal: true

# ./lib/TicTacToe.rb

class TicTacToe
  enum status: { in_progress: 0, win: 1, draw: 2 }
  enum player_char: %w[O X]

  attr_reader :board
  attr_reader :players
  attr_accessor :turn

  def initialize(players)
    @players = []
    @players[0] = players[0]
    @players[1] = players[1]
    @board = (1..9).to_a
    @turn = 0
    @status = status.in_progress
  end

  # set the choosen number into the board
  def set(num)
    player_id = @players[@turn % 2].id
    @board[num - 1] = player_char[player_id]
  end

  def game_over?
    %w[012 345 678 036 147 258 048 246].each do |l|
      return true if @board[l[0].to_i] == @board[l[1].to_i] &&
                     @board[l[1].to_i] == @board[l[2].to_i]
    end
    false
  end
end
