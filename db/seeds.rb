require_relative('../models/horse')
require_relative('../models/trainer')
require_relative('../models/training')

horse1 = Horse.new({'name' => 'Magnateria', 'breed' => 'Arabian'})
horse1.save
horse2 = Horse.new({'name' => 'Paris', 'breed' => 'Malopolski'})
horse2.save
trainer1 = Trainer.new({'first_name' => 'Jack', 'last_name' => 'Johnson'})
trainer1.save
trainer2 = Trainer.new({'first_name' => 'Paula', 'last_name' => 'Smith'})
trainer2.save
training1 = Training.new({'horse_id' => horse1.id, 'type' => 'Dressage', 'date' => '25/04/18', 'trainer_id' => trainer1.id, 'day_of_week' => 'Monday', 'duration' => 1})
training1.save
training2 = Training.new({'horse_id' => horse1.id, 'type' => 'Show jumping', 'date' => '25/04/18', 'trainer_id' => trainer2.id, 'day_of_week' => 'Tuesday', 'duration' => 1})

horse1.name = "Murat"
horse1.update
trainer1.first_name = "John"
trainer1.update
