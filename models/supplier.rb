require_relative('../db/sql_runner')

class Supplier

  attr_accesor( :name, :active, :location, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @active = options['active'].to_i if options['active']
    @location = options['location']
  end

  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      active,
      location
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @active, @location]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM supplers"
    results = SqlRunner.run(sql)
    return result.map{ |supplier| Supplier.new(supplier)}
  end
  
end
