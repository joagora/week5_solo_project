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
  erb :"trainings/new"
end
