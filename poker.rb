require 'bundler/setup'
require 'sinatra'
require 'poker'

get '/winner' do
  game = params["Game"]
  return incorrect_params unless game

  split_hands = game.scan(/\w+:(?:\s(?:[0-9AJKQ]|10)[HDSC])*/)
  return incorrect_params if split_hands.count != 2

  card_counts = split_hands.map do |hand|
    hand.split(":").last.strip.split(" ").count
  end
  return incorrect_params if card_counts.any?{ |c| c != 5 }

  Poker.find_winner( game )
end

def incorrect_params
  status 500
end
