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

post '/trainers/:id/delete' do
  @trainer_to_remove = Trainer.find(params['id'])
  @trainer_to_remove.delete
  redirect to "trainers"
end

get '/trainers/:id/edit' do
  @trainer = Trainer.find(params['id'])
  erb :"trainers/edit"
end


###edited
post '/trainers/:id' do
  trainer = Trainer.new(params)
  trainer.update
  redirect to "trainers"
end
