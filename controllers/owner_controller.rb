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
  @animal = Animals.owners_pets()
  erb( :owners_pets)
end
#
# get '/owners/owners_pets/:id'
#
# end
