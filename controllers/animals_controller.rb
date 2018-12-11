require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )


#read

get '/animals' do
  @animals = Animal.all()
  erb( :animals )
end

get '/animals/ready' do
  @adoptable_animals = Animal.animal_adoptable()
  erb( :animals_ready )
end


get '/animals/in_training' do
  @in_training_animals = Animal.animal_in_training()
  erb( :animals_in_training )
end


get '/animals/in_care' do
  # get all the animals
  # loop through the animals and create an array of in care animals
  @in_care_animals = Animal.animal_in_care()
  erb( :animals_in_care )
end

get '/animals/:id' do
  @animal = Animal.find(params[:id].to_i())
  erb( :pet )
end




#create


#delete


#edit



#update
