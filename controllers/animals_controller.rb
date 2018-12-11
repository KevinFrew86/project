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

get '/animals/new_animal' do
  erb( :new_animal )
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

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  redirect('/animals')
end


#delete

post '/animals/:id/delete' do
  @animal = Animal.find(params[:id].to_i())
  @animal.delete()
  redirect('/animals')
end


#edit

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id].to_i())
  @trained = ["true", "false"]
  @health = ["true", "false"]
  erb(:edit_animal)
end


#update

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update()
  redirect('/animals')
end
