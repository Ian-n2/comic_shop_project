require_relative('../db/sql_runner')
require('pry')

class Comic

  attr_accessor( :name, :type, :stock, :cost, :rrp, :supplier, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @stock = options['stock'].to_i if options['stock']
    @cost = options['cost'].to_i if options['cost']
    @rrp = options['rrp'].to_i if options['rrp']
    @supplier = options['supplier'].to_i if options['supplier']
  end
  def save()
    sql = "INSERT INTO comics
    (
      name,
      type,
      stock,
      cost,
      rrp,
      supplier
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @stock, @cost, @rrp, @supplier]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM comics"
    results = SqlRunner.run(sql)
    return results.map { |comic| Comic.new(comic)}
  end

  def self.find(id)
    sql = "SELECT * FROM comics
    WHERE id = $1"
    value = [id]
    results = SqlRunner.run(sql, value)
    return Comic.new( results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM comics
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def supplier ()
    sql = "SELECT * FROM suppliers where id = $1 "
    values = [@supplier]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end

  def update()
    sql = "UPDATE comics
    SET
    (
      stock,
      cost,
      rrp
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [ @stock, @cost, @rrp, @id]
      SqlRunner.run(sql, values)
    end

  end
