require_relative( '../db/sql_runner' )

class Animal

  attr_accessor :name, :type, :breed, :admission_date, :trained, :health, :id

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

  def owners()

    sql = "SELECT o.* FROM owners o INNER JOIN adoptions a ON adoptions.owner_id = o.id WHERE a.animal_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |owner| Owner.new(owner) }

  end

  def self.all()

    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal_hash| Animal.new( animal_hash ) }

  end


  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      type,
      breed,
      admission_date,
      trained,
      health
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@name, @type, @breed, @admission_date, @trained, @health, @id]
      SqlRunner.run( sql, values )
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


    def delete()
      sql = "DELETE FROM animals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end


    def is_adoptable()
      if @trained == "t" && @health == "t"
        return "true"
      else
        return "false"
      end
    end

    def self.animal_adoptable()
      animals = Animal.all()
      result = []

      for animal in animals
        # binding.pry

        if animal.is_adoptable() == "true"
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
