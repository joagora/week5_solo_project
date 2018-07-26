require_relative('../db/sql_runner')
require_relative('owner')
class Horse

  attr_reader :id, :breed
  attr_accessor :name, :health_details, :current_activity, :hair_coat, :approved
  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name'].capitalize if options['name']
    @breed = options['breed'].capitalize if options['breed']
    @health_details = options['health_details']
    @current_activity = options['current_activity']
    @owner_id = options['owner_id'].to_i if options['id']
    @hair_coat = options['hair_coat']
    @approved ||= false

  end

  def save()
    sql = "INSERT INTO horses
    (name, breed, health_details, current_activity, owner_id, approved, hair_coat)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id;"
    values = [@name, @breed, @health_details, @current_activity, @owner_id, @approved, @hair_coat]
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
    SET (name, breed, health_details, current_activity, owner_id, approved, hair_coat) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8;"
    values = [@name, @breed, @health_details, @current_activity, @owner_id, @approved, @hair_coat, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM horses
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def trainings()
    sql = "SELECT trainings.* FROM trainings WHERE trainings.horse_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    trainings = results.map {|training| Training.new(training)}
    return trainings
  end

  def owner()
    return Owner.find(@owner_id)
  end

  def self.find_by_name(name)
    horses = Horse.all
    horses_array = []
    for horse in horses
      if horse.name == name
        horses_array.push(horse)
      end
    end
    return horses_array
  end
  def self.show_pending_approval
    sql = "SELECT * FROM horses WHERE approved = FALSE;"
    results = SqlRunner.run(sql)
    horses = results.map {|horse| Horse.new(horse)}
    return horses
  end

  def self.show_approved
    sql = "SELECT * FROM horses WHERE approved = TRUE;"
    results = SqlRunner.run(sql)
    horses = results.map {|horse| Horse.new(horse)}
    return horses
  end

  def approve
    @approved = true
  end
end
