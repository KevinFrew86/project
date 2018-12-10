require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


#read

get '/owners' do
  # @owners = Owner.all()
  erb( :owners )
end
