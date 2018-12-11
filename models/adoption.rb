require_relative( '../db/sql_runner' )

class Adoption

  attr_reader :animal_id, :owner_id

  def initialize(options)
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end




end
