require_relative( '../db/sql_runner' )

class Adoption

  attr_accessor :animal_id, :owner_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save()

    sql = "INSERT INTO adoptions
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end


  def self.all()

    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoption_hash| Adoption.new( adoption_hash ) }

  end

  def update()
    sql = "UPDATE adoptions
    SET
    (
      animal_id,
      owner_id
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@animal_id, @owner_id ,@id]
    SqlRunner.run( sql, values )
  end


  def self.find( id )

    sql = "SELECT * FROM adoptions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Adoption.new( results.first )

  end


  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def delete()
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def self.delete_all

    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )

  end


end
