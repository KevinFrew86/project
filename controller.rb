require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/animals_controller.rb')
require_relative('controllers/owner_controller.rb')


get'/' do
  erb( :home )
end
