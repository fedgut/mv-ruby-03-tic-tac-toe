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
   attr_accessor :board

  def initialize(players)
    @players = []
    @players[0] = players[0]
    @players[1] = players[1]
    @board = (1..9).to_a
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

  game = TicTacToe.new(players)
  # game.print_board

  # Print the keyboard with numbers from 1 to 9
end

def print_board(grid)
  puts "#{grid[0..2].join(" ")}"
  puts "#{grid[3..5].join(" ")}"
  puts "#{grid[6..8].join(" ")}" 
end

game = start_game
print_board(game.board)
