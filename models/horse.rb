require_relative('../db/sql_runner')
class Horse

  attr_reader :id
  def initialize options
    @id = options['id'].to_s if options['id']
    @name = options['name']
    @breed = options['breed']
    @health_details = options['health_details']
    @current_activity = options['current_activity']
  end

  def save()
    sql = "INSERT INTO horses
    (
      name, breed, health_details, current_activity
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @breed, @health_details, @current_activity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM horses"
    results = SqlRunner.run( sql )
    return results.map { |horse| Horse.new( horse ) }
  end

end
