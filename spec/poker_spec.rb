ENV['RACK_ENV'] = 'test'

require_relative '../poker'
require 'spec_helper'

describe 'Poker' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/winner?Game=Black:%202H%203D%205S%209C%20KD%20White:%202C%203H%204S%208C%20AH'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('White - High Card')
  end
end
