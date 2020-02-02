require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/comics_controller')
require_relative('controllers/suppliers_controller')

get '/' do
  erb( :index )
end
