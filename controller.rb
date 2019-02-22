require('sinatra')
require_relative('controllers/animals_controller.rb')
require_relative('controllers/owner_controller.rb')
require_relative('controllers/adoption_controller.rb')


get'/' do
  erb( :home )
end
