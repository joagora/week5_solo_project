require_relative('../db/sql_runner')
class Owner
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize options
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name'].capitalize
    @last_name = options['last_name'].capitalize
    @username = options['username']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name, last_name, username
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @username]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Owner.new(result)
  end

  def update()
    sql = "UPDATE owners
    SET (first_name, last_name, username) = ($1, $2, $3)
    WHERE id = $4;"
    values = [@first_name, @last_name, @username, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def horses()
    sql = "SELECT * FROM horses WHERE owner_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    horses = result.map{|horse| Horse.new(horse)}
    return horses
  end

  def self.filter_by_username(username)
    sql = "SELECT * FROM owners WHERE owners.username = $1;"
    values = [username]
    results = SqlRunner.run(sql, values)
    owner = Owner.new(results.first)
    return owner
  end

  def self.check_if_exists?(username)
    sql = "SELECT * FROM owners WHERE owners.username = $1;"
    values = [username]
    results = SqlRunner.run(sql, values)
    owners = results.map {|owner| Owner.new(owner)}
    if owners.length > 0
      return true
    else
      return false
    end
  end
end
