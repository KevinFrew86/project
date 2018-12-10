require_relative( '../db/sql_runner' )

class Animal

  attr_reader :name, :type, :breed, :admission_date, :trained, :health, :adoptability, :owner, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @trained = options['trained']
    @health = options['health']
    @adoptability = is_adoptable()
    @owner = options['owner']
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
      adoptability,
      owner
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @type, @breed, @admission_date, @trained, @health, @adoptability, @owner]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end


  def self.all()

    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal_hash| Animal.new( animal_hash ) }

  end


  def self.find( id )

    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )

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

  def self.animal_adoptable()
    animals = Animal.all()
    result = []

    for animal in animals
      if animal.is_adoptable() == true
        result << animal
      end
    end

    return result

  end

  def self.animal_in_training()
    animals = Animal.all()
    result = []

    for animal in animals
      if animal.trained == "f"
        result << animal
      end
    end

    return result
  end

  def self.animal_in_care()
    animals = Animal.all()
    result = []

    for animal in animals
      if animal.health == "f"
        result << animal
      end
    end

    return result
  end

end
