require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )


#read

get '/owners' do
  @owners = Owner.all()
  erb( :owners )
end

get '/owners/owners_pets/:id' do
  # find the owner
  @owner = Owner.find(params[:id])
  # find the animals of the owner using an owner method
  @animals = @owner.animals()
  # populate the erb with the owners animals
  erb( :owners_pets)
end
