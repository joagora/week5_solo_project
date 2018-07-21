class Training
  def initialize
    @id = options['id'].to_s if options['id']
    @type = options['type']
    @date = options['date']
    @duration = options['duration']
    @day_of_week = options['day_of_week']
    @horse_id = options['horse_id']
    @trainer_id = options['trainer_id']

  end
end
