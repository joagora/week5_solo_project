require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/horses_controller.rb')
require_relative('controllers/trainings_controller.rb')
require_relative('controllers/trainers_controller.rb')
require_relative('controllers/owners_controller.rb')
require_relative('controllers/admin_controller.rb')

get '/' do
  erb :index
end
