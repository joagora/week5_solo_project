require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/horse')
also_reload('./models/*')

get '/horses' do
  @horses = Horse.all
  erb :"horses/index"
end

get '/horses/new' do
  @owner = Owner.find(params['owner_id'])
  erb :"horses/new"
end

get '/horses/:id' do
  @horse = Horse.find(params['id'])
  erb :"horses/show"
end

#create
post '/horses' do
  @horse = Horse.new(params)
  @horse.save()
  @owner = @horse.owner()
  erb :"horses/create"
end

get '/horses/:id/edit' do
  @horse = Horse.find(params['id'])
  erb :"horses/edit"
end

post '/horses/:id' do
  horse = Horse.new(params)
  horse.update()
  redurect to "horses/#{params['id']}"
end
