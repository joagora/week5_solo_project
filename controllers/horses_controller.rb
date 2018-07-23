require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/horse')
also_reload('./models/*')

get '/horses' do
  @horses = Horse.all
  erb :"horses/index"
end

get '/horses/new' do
  p params
  @owner = Owner.find(params['owner_id'])
  erb :"horses/new"
end

# post 'horses/:owner_id'
