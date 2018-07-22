require_relative('../db/sql_runner')
class Owner
  def initialize options
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

end
