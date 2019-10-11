# frozen_string_literal: true

# ./spec/tic_tac_toe_spec.rb

require './lib/tic_tac_toe'
require './lib/player'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'should init an instance of the TicTacToe class' do
      game = TicTacToe.new([Player.new(1, 'Eduardo'), Player.new(2, 'Tiago')])
      expect(game).to be_an_instance_of(TicTacToe)
    end
  end

  describe '#set' do
    it 'should set the choosen number into the board' do
      game = TicTacToe.new([Player.new(1, 'Eduardo'), Player.new(2, 'Tiago')])
      expect(game.set(5)).to change (game, @board).from(@board = (1..9).to_a).to(@board = [1,2,3,4,'X',6,7,8,9])
    end
  end
end
