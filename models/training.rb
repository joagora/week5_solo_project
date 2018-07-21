require_relative('../db/sql_runner')
class Training
  def initialize options
    @id = options['id'].to_s if options['id']
    @type = options['type']
    @scheduled_time = options['scheduled_time']
    @scheduled_date = options['scheduled_date']
    @duration = options['duration'].to_s if options['duration']
    @day_of_week = options['day_of_week']
    @horse_id = options['horse_id'].to_s if options['horse_id']
    @trainer_id = options['trainer_id'].to_s if options['trainer_id']
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
end
