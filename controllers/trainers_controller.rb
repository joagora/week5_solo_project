require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/trainer')
also_reload('./models/*')

get '/trainers' do
  @trainers = Trainer.all
  erb :"trainers/index"
end

get '/trainers/new' do
  erb :"trainers/new"
end

post '/trainers' do
  @trainer = Trainer.new(params)
  @trainer.save
  erb :"trainers/create"
end
