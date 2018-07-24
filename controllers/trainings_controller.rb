require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/training')
also_reload('./models/*')


get '/trainings' do
  @trainings = Training.all
  erb :"trainings/index"
end

#new
get '/trainings/new' do
  @horse = Horse.find(params['horse_id'])
  @trainers = Trainer.all
  erb :"trainings/new"
end

post '/trainings' do
  @training = Training.new(params)
  @training.save
  erb :"trainings/create"
end
