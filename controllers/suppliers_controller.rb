require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

get '/supplier' do
  @supplier = Supplier.all()
  erb (:"supplers/index")
end

get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb( :"suppliers/show")
end 
