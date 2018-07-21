require_relative('../db/sql_runner')
class Trainer
  attr_reader :id
  attr_accessor :first_name, :last_name
  def initialize options
    @id = options['id'].to_s if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO trainers
    (
      first_name, last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM trainers"
    results = SqlRunner.run(sql)
    return results.map {|trainer| Trainer.new(trainer)}
  end

  def self.find(id)
    sql = "SELECT * FROM trainers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Trainer.new(result)
  end

  def update()
    sql = "UPDATE trainers
    SET (first_name, last_name) = ($1, $2)
    WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM trainers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
