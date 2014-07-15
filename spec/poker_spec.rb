ENV['RACK_ENV'] = 'test'

require_relative '../poker'
require 'spec_helper'

describe 'Poker' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context '5-card game' do
    it "outputs winner" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH'.gsub(/\s/, c)
        get "/winner?Game=#{game}"
        expect(last_response).to be_ok
        expect(last_response.body).to include('White')
      end
    end

    it "error response when params any other than Game" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH'.gsub(/\s/, '%20')
        get "/winner?Find=#{game}"
        expect(last_response.status).to be(500)
      end
    end

    it "error response when more than one player" do
      ['%20', '-'].each do |c|
        game = 'Black: 2C JC 3H JD 3S JS 2D White: QH AS 10D JD 5D KD AD Red: AC 4C 4S 4D 4H 3D AD'
          .gsub(/\s/, '%20')
        get "/winner?Game=#{game}"
        expect(last_response.status).to be(500)
      end
    end

    it "error response when card count < 5" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C White: 2C 3H 4S 8C AH'.gsub(/\s/, '%20')
        get "/winner?Game=#{game}"
        expect(last_response.status).to be(500)
      end
    end

    it "error response when card count > 5" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH AD'.gsub(/\s/, '%20')
        get "/winner?Game=#{game}"
        expect(last_response.status).to be(500)
      end
    end
  end

  context '7-card game' do
    it "outputs winner" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C 9D KD KC White: AC 2C 3C 4C 5C 8C AH'.gsub(/\s/, c)
        get "/texas_hold_em?Game=#{game}"
        expect(last_response).to be_ok
        expect(last_response.body).to include('White')
      end
    end

    it "error response when card count < 7" do
      ['%20', '-'].each do |c|
        game = 'Black: 3D 5S 9C 9D KD KC White: AC 2C 3C 4C 5C 8C AH'.gsub(/\s/, c)
        get "/texas_hold_em?Game=#{game}"
        expect(last_response.status).to be(500)
      end
    end

    it "error response when card count > 7" do
      ['%20', '-'].each do |c|
        game = 'Black: 2H 3D 5S 9C 9D KD KC KH White: AC 2C 3C 4C 5C 8C AH'.gsub(/\s/, c)
        get "/texas_hold_em?Game=#{game}"
        expect(last_response.status).to be(500)
      end
    end
  end
end
