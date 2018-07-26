require_relative('../db/sql_runner')
require_relative('trainer')
require_relative('date_time')
class Training
  attr_reader :id
  attr_accessor :type, :scheduled_date, :scheduled_time, :duration, :day_of_week, :horse_id, :trainer_id
  def initialize options
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @scheduled_time = options['scheduled_time']
    @scheduled_date = options['scheduled_date']
    @duration = options['duration'].to_i if options['duration']
    @day_of_week = options['day_of_week']
    @horse_id = options['horse_id'].to_i if options['horse_id']
    @trainer_id = options['trainer_id'].to_i if options['trainer_id']
    assign_day_of_week
  end

  def save()
    sql = "INSERT INTO trainings
    (
      type, scheduled_time, scheduled_date, duration, day_of_week, horse_id, trainer_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@type, @scheduled_time, @scheduled_date, @duration, @day_of_week, @horse_id, @trainer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM trainings"
    results = SqlRunner.run(sql)
    return results.map {|training| Training.new(training)}
  end

  def self.find(id)
    sql = "SELECT * FROM trainings WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    training = Training.new(result.first)
    return training
  end

  def update()
    sql = "UPDATE trainings
    SET (type, scheduled_time, scheduled_date, duration, day_of_week, horse_id, trainer_id) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8;"
    values = [@type, @scheduled_time, @scheduled_date, @duration, @day_of_week, @horse_id, @trainer_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM trainings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def trainer()
    sql = "SELECT * FROM trainers WHERE trainers.id = $1;"
    values = [@trainer_id]
    result = SqlRunner.run(sql, values)
    return Trainer.new(result.first)
  end

  def horse()
    sql = "SELECT * FROM horses WHERE horses.id = $1;"
    values = [@horse_id]
    result = SqlRunner.run(sql, values).first
    horse = Horse.new(result)
    return horse
  end

  def format_time(time)
    time.chomp[0...-3]
  end

  def self.sort_by_date
    trainings = Training.all
    sorted_trainings = trainings.sort{|training_1, training_2| DateTime.parse(training_1.scheduled_date) <=> DateTime.parse(training_2.scheduled_date)}
    return sorted_trainings
  end

  def assign_day_of_week
    @day_of_week = FindDate.day_of_week(@scheduled_date)
    update
  end
end
