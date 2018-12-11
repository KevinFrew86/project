require_relative( '../db/sql_runner' )

class Adoption

  attr_reader :animal_id, :owner_id

  def initialize(options)
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
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end


  def self.all()

    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoption_hash| Adoption.new( adoption_hash ) }

  end


  def self.find( id )

    sql = "SELECT * FROM adoptions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Adoption.new( results.first )

  end


  def self.delete_all

    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )

  end


end
