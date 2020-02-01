require_relative( "../models/comic.rb" )
require_relative( "../models/supplier.rb")
require("pry-byebug")

comic.delete_all()
supplier.delete_all()

marvel = Supplier.new({
  "name" => "marvel",
  "active" => true,
  "location" => 'Pollok'
})

marvel.save()

dc = Supplier.new({
"name" => "DC",
"active" => true,
"location" => 'Castlemilk'
})

dc.save

darkhorse = Supplier.new ({
"name" => "Dark Horse",
"active" => true,
"location" => 'yoker'
})

darkhorse.save

spiderman = Comic.new({
  "name" => "spider-man",
  "type" => "action",
  "stock" => "5",
  "cost" => "3",
  "rrp" => "5",
  supplier_id => marvel.id
  })

binding.pry
nil
