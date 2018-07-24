require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/training')
also_reload('./models/*')

get '/trainings/new' do
  @horse = Horse.find(params['horse_id'])
  erb :"trainings/new"
end
