require_relative( '../db/sql_runner' )

class Owner

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @pets = options['pets']
  end



end
