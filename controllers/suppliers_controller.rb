require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all()
  erb (:"suppliers/index")
end

get '/suppliers/new' do
  erb(:"suppliers/new")
end

get '/suppliers/:id/edit' do
  supplier_id = params[:id]
  @supplier = Supplier.find(supplier_id)
  erb(:"suppliers/edit")
end

post '/suppliers/:id' do
  @supplier = Supplier.new(params)
  @supplier.update
  redirect("/suppliers")
end

post '/suppliers' do
  @suppliers = Supplier.new(params)
  @suppliers.save()
  redirect("/suppliers")
end

post '/suppliers/:id/delete' do
  Supplier.delete(params[:id])
  redirect("/suppliers")
end
