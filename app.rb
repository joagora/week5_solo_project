require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/horses_controller.rb')
require_relative('controllers/trainings_controller.rb')
require_relative('controllers/trainers_controller.rb')
require_relative('controllers/owners_controller.rb')
get '/' do
  erb :index
end
