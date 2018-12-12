require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

# read

get '/adoptions' do
  @adoptions = Adoption.all()
  @animals = Animal.all()
  erb( :adoptions )
end


get '/adoptions/new_adoption' do
  erb( :new_adoption )
end

# create

post '/adoptions' do
  @adoptions = Adoption.new(params)
  @adoption.save()
  redirect('/adoptions')
end
