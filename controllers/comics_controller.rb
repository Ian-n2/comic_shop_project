require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/comic.rb')
require_relative('../models/supplier.rb')
also_reload('../models/*')


# This will bring at up the comic index
get '/comics' do
  @comics = Comic.all()
  @suppliers = Supplier.all()
  erb(:"comics/index")
end

get '/comics/supplier' do
  supplier_id = params[:supplier]
  @comics = Comic.sort(supplier_id)
  @suppliers = Supplier.all()
  erb(:"comics/index")
end

# this will let us make a new comic
get '/comics/new' do
  @suppliers = Supplier.all
  erb(:"comics/new")
end

# This will let us edit a comic we already have in our stock
get '/comics/:id/edit' do
  comic_id = params[:id]
  @comic = Comic.find(comic_id)
  erb(:"comics/edit")
end
# after we have the updated comic clicking the submit will run this
# post and redirect us to the comic index
post '/comics/:id' do
  @comic = Comic.new(params)
  @comic.update
redirect("/comics")
end


# post route needs to handle creating AND updating of comics
post '/comics' do
  @comics = Comic.new(params)
  @comics.save()
  redirect("/comics")
end
# this will delete the comic redirecting us to the comic page
post '/comics/:id/delete' do
  Comic.delete(params[:id])
  redirect("/comics")
end
