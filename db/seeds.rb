require_relative( "../models/comic.rb" )
require_relative( "../models/supplier.rb")
require("pry-byebug")

Comic.delete_all()
Supplier.delete_all()

marvel = Supplier.new({
  "name" => "Marvel",
  "active" => true,
  "location" => 'Pollok'
})

marvel.save()

dc = Supplier.new({
"name" => "DC",
"active" => true,
"location" => 'Castlemilk'
})

dc.save()

darkhorse = Supplier.new ({
"name" => "Dark Horse",
"active" => true,
"location" => 'Yoker'
})

darkhorse.save()

spiderman = Comic.new({
  "name" => "Spider-man",
  "type" => "Action",
  "stock" => "5",
  "cost" => "3",
  "rrp" => "5",
  "supplier_id" => marvel.id
  })

  spiderman.save()

goon = Comic.new({
  "name" => "The Goon",
  "type" => "Humour",
  "stock" => "5",
  "cost" => "3",
  "rrp" => "5",
  "supplier_id" => darkhorse.id
  })

goon.save()

batman = Comic.new({
  "name" => "Batman",
  "type" => "Action",
  "stock" => "5",
  "cost" => "3",
  "rrp" => "5",
  "supplier_id" => dc.id
  })
  batman.save( )

superman = Comic.new({
  "name" => "Superman",
  "type" => "Action",
  "stock" => "5",
  "cost" => "3",
 "rrp" => "5",
 "supplier_id" => dc.id
  })
  superman.save()

  xmen = Comic.new({
    "name" => "X-Men",
  "type" => "Action",
"stock" => "5",
"cost" => "3",
"rrp" => "5",
"supplier_id" => marvel.id
 })
xmen.save

binding.pry
nil
