#!/usr/bin/env ruby 

class Player
  attr_accessor :number
  attr_accessor :name

  def initialize(number, name)
    @number = number
    @name = name
  end
end

class TicTacToe
  @turn = 0
  @board = (0..8).to_a
  @players = []

  def initialize(player1, player2)
    @players[0] = player1
    @players[1] = player2
  end


  # 
  def end_game
    puts "We have a draw"
    puts "Congratulation #{players[turn % 2]} you win!"

    puts "Want to play again? [Y/n]"
    # anything other than n means Y
    again = gets.chomp
  end

  # check if the game is over
  def game_over?
    # minimum number of turns = 5
    # if row or colum or diagonal
    # maximum if turn == 9 
  end



end


def start_game
  puts "Welcome to Tic Tac Toe game.\n\n"

  players = []
  2.times do |i|
    print "Please tell us player #{i + 1} name: "
    name = gets.chomp
    # TODO: validate (min 3 letters)
    players[i] = Player.new(i, name)
    puts players[i]

  end

  game = TicTacToe.new(players[0], players[1])
  # game.print_board
end

start_game