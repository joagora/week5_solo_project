require_relative('../models/horse')
require_relative('../models/trainer')

horse1 = Horse.new({'name' => 'Magnateria', 'breed' => 'Arabian'})
horse1.save

trainer1 = Trainer.new({'first_name' => 'Jack', 'last_name' => 'Johnson'})
trainer1.save
