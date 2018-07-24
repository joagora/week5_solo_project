require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/training')
require_relative('../models/horse')
require_relative('../models/trainer')
require_relative('../models/owner')
also_reload('./models/*')


get '/admin' do
  erb :"admin/index"
end
