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
      board_ = (1..9).to_a
      board_[4] = 'O'
      expect { game.set(5) }.to(change { game.board }.from((1..9).to_a).to(board_))
    end
  end

  describe '#game_over' do
    it 'should return false if the game is not over' do
      game = TicTacToe.new([Player.new(1, 'Eduardo'), Player.new(2, 'Tiago')])
      expect(game.game_over?).to be_falsy
    end

    it 'should return true if the game is over' do
      game = TicTacToe.new([Player.new(1, 'Eduardo'), Player.new(2, 'Tiago')])
      game.set(1)
      game.set(9)
      game.set(2)
      game.set(8)
      game.set(3)
      expect(game.game_over?).to be_truthy
    end

    it 'should return true if there is no more possible moves' do
      game = TicTacToe.new([Player.new(1, 'Eduardo'), Player.new(2, 'Tiago')])
      9.times { |i| game.set(i + 1) }
      expect(game.game_over?).to be_truthy
    end
  end

  describe '#current_player' do
    it 'should return the current player' do
      player1 = Player.new(1, 'Eduardo')
      player2 = Player.new(2, 'Tiago')
      game = TicTacToe.new([player1, player2])
      game.set(1)
      expect(game.current_player).to eql(player2)
    end
  end
end
