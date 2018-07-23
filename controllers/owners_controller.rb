require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('./models/*')


get '/owners' do
  @owners = Owner.all
  erb :"owners/index"
end
#new
get '/owners/new' do
  erb :"owners/new"
end
#create
post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  erb :"owners/create"
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb :"owners/show"
end

get '/owners/:id/horses_list' do
  owner = Owner.find(params['id'])
  @horses_by_owner = owner.horses
  erb :"owners/horses_index"
end
