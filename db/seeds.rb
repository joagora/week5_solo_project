require_relative('../models/horse')
require_relative('../models/trainer')
require_relative('../models/training')
require_relative('../models/owner')


owner1 = Owner.new({'first_name' => 'Joanna', 'last_name' => 'Gora', 'username' => 'joagora'})
owner1.save

owner1.first_name = "Maria"
owner1.update

horse1 = Horse.new({'name' => 'Magnateria', 'breed' => 'Arabian', 'owner_id' => owner1.id})
horse1.save
horse2 = Horse.new({'name' => 'Paris', 'breed' => 'Malopolski', 'owner_id' => owner1.id})
horse2.save
horse1.name = "Murat"
horse1.update


trainer1 = Trainer.new({'first_name' => 'Jack', 'last_name' => 'Johnson'})
trainer1.save
trainer2 = Trainer.new({'first_name' => 'Paula', 'last_name' => 'Smith'})
trainer2.save
training1 = Training.new({'horse_id' => horse1.id, 'type' => 'Dressage', 'date' => '25/04/18', 'trainer_id' => trainer1.id, 'day_of_week' => 'Monday', 'duration' => 1})
training1.save
training2 = Training.new({'horse_id' => horse1.id, 'type' => 'Show jumping', 'date' => '25/04/18', 'trainer_id' => trainer2.id, 'day_of_week' => 'Tuesday', 'duration' => 1})
training2.save


trainer1.first_name = "John"
trainer1.update
training1.type = "Show jumping"
training1.update

training3 = Training.new({'horse_id' => horse2.id, 'type' => 'Show jumping', 'date' => '25/04/18', 'trainer_id' => trainer2.id, 'day_of_week' => 'Tuesday', 'duration' => 1})
training3.save
training3 = Training.new({'horse_id' => horse2.id, 'type' => 'Dressage', 'date' => '25/04/18', 'trainer_id' => trainer1.id, 'day_of_week' => 'Wednesday', 'duration' => 1})
training3.save

p training1.trainer
