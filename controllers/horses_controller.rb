require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/horse')
require_relative('../models/owner')
require('pry-byebug')


also_reload('./models/*')

get '/horses' do
  @horses = Horse.all
  @horses_pending = Horse.show_pending_approval
  @approved_horses = Horse.show_approved
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
  @horse.save
  @owner = @horse.owner
  erb :"horses/create"
end

#edit
get '/horses/:id/edit' do
  @horse = Horse.find(params['id'])
  erb :"horses/edit"
end

get '/horses/:id/change_status' do
    @horse = Horse.find(params['id'])
  erb :"horses/change_status"
end










#new edited version update:

post '/horses/:id/change_status' do
 p "-------------------------"
p params
  @horse = Horse.new(params)
  p "-------------------------"
  p @horse
  @horse.update
  redirect to "horses"
end










#approve
post '/horses/:id/approve' do
  @horse = Horse.find(params['id'])
  @horse.approve
  @horse.update
  redirect to "horses"
end

post '/horses/:id/delete' do
  @horse_to_remove = Horse.find(params['id'])
  @horse_to_remove.delete
  redirect to "horses"
end

get '/horses/:id/trainings' do
  @horse = Horse.find(params['id'])
  @trainings = @horse.trainings
  erb :"horses/trainings_index"
end

#update
post '/horses/:id' do

  horse = Horse.new(params)
  horse.update
  redirect to "horses/#{params['id']}"
end
