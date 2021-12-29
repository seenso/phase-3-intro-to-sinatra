require 'sinatra'

class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/' do
    '<h1>HOME PAGE</h1>'
  end

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    sum = num1 + num2
    { num1:num1, num2:num2, result: sum }.to_json
  end

  get '/games/:id' do
    # We could set this route to return a speciic Game fom the games table in JSON format.
    # But this won't work since we don't have a Game class setup, but we'll see how to get this code working
    
    game = Game.find(params[:id])
    game.to_json
  end
  
end

run App
