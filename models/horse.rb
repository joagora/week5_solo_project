require_relative('../db/sql_runner')
class Horse

  attr_reader :id
  attr_accessor :name, :health_details
  def initialize options
    @id = options['id'].to_s if options['id']
    @name = options['name']
    @breed = options['breed']
    @health_details = options['health_details']
    @current_activity = options['current_activity']
  end

  def save()
    sql = "INSERT INTO horses
    (name, breed, health_details, current_activity)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values = [@name, @breed, @health_details, @current_activity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM horses;"
    results = SqlRunner.run(sql)
    return results.map {|horse| Horse.new(horse)}
  end

  def self.find(id)
    sql = "SELECT * FROM horses
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Horse.new(result)
  end

  def update()
    sql = "UPDATE horses
    SET (name, breed, health_details, current_activity) = ($1, $2, $3, $4)
    WHERE id = $5;"
    values = [@name, @breed, @health_details, @current_activity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM horses
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
