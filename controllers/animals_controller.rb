require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )


#read

get '/animals' do
  @animals = Animal.all()
  erb( :animals )
end

get '/animals/in_care' do
  # @animal = Animal.find(params[:health])
  erb( :animals_in_care )
end

get '/animals/:id' do
  @animal = Animal.find(params[:id].to_i())
  erb( :pet )
end




# get '/animals/in_training' do
#
# end

# get '/animals/ready' do
#
# end

#create


#delete


#edit



#update
