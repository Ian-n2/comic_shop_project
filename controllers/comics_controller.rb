require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/comic.rb')
require_relative('../models/supplier.rb')
also_reload('../models/*')



get '/comics' do
  @comics = Comic.all()
  erb(:"comics/index")
end

get '/comics/new' do
  @suppliers = Supplier.all
  erb(:"comics/new")
end


get '/comics/:id/edit' do
  comic_id = params[:id]
  @comic = Comic.find(comic_id)
  erb(:"comics/edit")
end

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

post '/comics/:id/delete' do
  Comic.delete(params[:id])
  redirect("/comics")
end
