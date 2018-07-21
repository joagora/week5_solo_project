class Horse
  def initialize options
    @id = options['id'].to_s if options['id']
    @breed = options['breed']
    @health_details = options['health_details']
    @current_activity = options['current_activity']
  end

end
