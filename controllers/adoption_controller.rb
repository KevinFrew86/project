require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/adoption.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

# read

get '/adoptions' do
  @adoptions = Adoption.all()
  @animals = Animal.all()
  @owners = Owner.all()
  erb( :adoptions )
end


get '/adoptions/new_adoption' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb( :new_adoption )
end

# create

post '/adoptions' do
  @adoption = Adoption.new(params)
  @adoption.save()
  redirect('/adoptions')
end

post '/adoptions/:id/delete' do
  Adoption.destroy(params[:id])
  redirect to("/adoptions")
end
