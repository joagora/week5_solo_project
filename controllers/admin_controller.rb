require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/training')
require_relative('../models/horse')
require_relative('../models/trainer')
require_relative('../models/owner')



get '/admin' do
  erb :"admin/index"
end
