require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )


#read

get '/owners' do
  @owners = Owner.all()
  erb( :owners )
end

get '/owners/owners_pets' do
  @pets_by_owner = Animal.owners_pet()
  erb( :owners_pets)
end
