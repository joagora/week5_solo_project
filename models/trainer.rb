class Trainer
  def initialize options
    @id = options['id'].to_s if options['id']
    @name = options['name']
  end
end
