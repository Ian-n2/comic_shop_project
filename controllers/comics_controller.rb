require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/comic.rb')
require_relative('../models/supplier.rb')
also_reload('../models/*')

get '/comics' do
  @comics = Comic.all()
  erb(:"comics/index")
end
#
# get '/comics/:id' do
#   @comics = Comic.find(params['id'].to_i)
#   erb(:"comics/")
# end
