require_relative( '../db/sql_runner' )

class Animal

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = ['admission_date']
    @trained = options['trained']
    @health = options['health']
    @adoptability = options['adoptability']
  end


end
