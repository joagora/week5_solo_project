require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/training')
require_relative('../models/trainer')
also_reload('./models/*')



get '/trainings' do
  #sorting the array of objects by date
  @sorted_trainings = Training.sort_by_date
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

get '/trainings/:id/edit' do
  @types = ["dressage", "show jumping", "lunge", "walker"]
  @trainers = Trainer.all
  @training = Training.find(params['id'])
  @training.update
  erb :"trainings/edit"
end
