# frozen_string_literal: true

# ./spec/player_spec.rb

require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'should initialize a new instance of the class PLayer' do
      player = Player.new(1, 'Eduardo')
      expect(player).to be_an_instance_of(Player)
    end

    it 'should set the id instance variables' do
      player = Player.new(1, 'Eduardo')
      expect(player.id).to eql(1)
    end

    it 'should set the name instance variables' do
      player = Player.new(1, 'Eduardo')
      expect(player.name).to eql('Eduardo')
    end
  end
end
