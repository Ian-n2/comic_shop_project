require_relative('../db/sql_runner')

class Comic

  attr_accesor( :name, :type, :stock, :cost, :RRP, :supplier_id, :id)

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @type = options['type']
  @stock = options['stock'].to_i if options['stock']
  @cost = options['cost'].to_i if options['cost']
  @rrp = options['rrp'].to_i if options['rrp']
  @supplier_id = options['supplier_id'].to_i if options['supplier_id']
end

def save()
sql = "INSERT INTO comics
(
 name,
 type,
 stock,
 cost,
 rrp,
 supplier_id
)
VALUES
(
  $1, $2, $3, $4, $5, $6
)
RETURNING id"
values = [@name, @type, @stock, @cost, @rrp, @supplier_id]
results = SqlRunner.run(sql,values)
@id = result.first()['id'].to_i
end


def self.delete_all
sql = "DELETE FROM comics"
SqlRunner.run(sql)
end


def self.find(id)
  sql = "SELECT * FROM comics
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Comic.new( results.first)
end

def self.all()
  sql = "SELECT * FROM comics
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Comic.new(sql)
end 

end
