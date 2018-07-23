require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/horse')
also_reload('./models/*')

get '/horses' do
  @horses = Horse.all
  erb :"horses/index"
end
