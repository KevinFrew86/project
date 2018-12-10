require_relative( '../db/sql_runner' )

class Animal

  attr_reader :name, :type, :breed, :admission_date, :trained, :health, :adoptability, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @trained = options['trained']
    @health = options['health']
    @adoptability = is_adoptable()
  end


  def save()

    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      admission_date,
      trained,
      health,
      adoptability
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @type, @breed, @admission_date, @trained, @health, @adoptability]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end


  def self.all()

    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal_hash| Animal.new( animal_hash ) }

  end

  # def self.all()
  #     sql = "SELECT * FROM pizza_orders"
  #     pizzas = SqlRunner.run( sql )
  #     result = pizzas.map { |pizza| PizzaOrder.new( pizza ) }
  #     return result
  #   end


  def self.find( id )

    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )

  end


  def self.delete_all

    sql = "DELETE FROM animals"
    SqlRunner.run( sql )

  end

  def is_adoptable()
    if @trained && @health == "t"
      return true
    else
      return false
    end
  end

end
