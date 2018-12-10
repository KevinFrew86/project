require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )


# get '/animals' do
#   # @pets = Animal.all()
#   erb( :animals)
# end

get '/animals' do

  erb( :animals )
end

# get '/animals/in_care' do
#
# end
#
#
# get '/animals/in_training' do
#
# end
#
# get '/animals/ready' do
#
# end
