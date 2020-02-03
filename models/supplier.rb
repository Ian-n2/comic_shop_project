require_relative('../db/sql_runner')

class Supplier

  attr_accessor( :name, :active, :location, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].to_s if options['name']
    @active = options['active']
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

  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run(sql)
    return results.map{ |supplier| Supplier.new(supplier)}
  end
  def self.find(id)
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end


  def self.delete(id)
    sql = "DELETE FROM suppliers
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values )
  end

  def update()
    sql = "UPDATE suppliers
    SET
    (

      name,
      active,
      location
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [ @name, @active, @location, @id]
      SqlRunner.run(sql, values)
    end
  end
