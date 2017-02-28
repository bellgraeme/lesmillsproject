require_relative('../models/gym_class.rb')
require_relative('../models/register.rb')
require_relative('../models/student.rb')
require_relative('../models/venue.rb')
require_relative('../models/bank.rb')
require_relative('../models/client.rb')
require_relative('../models/payment.rb')
require 'pg'
require 'pry'
require 'pry-byebug'

Payment.delete_all
Client.delete_all
Bank.delete_all
Register.delete_all
GymClass.delete_all
Student.delete_all
Venue.delete_all


venue1 = Venue.new( 
  'name' => 'Gym1',
  'location' => 'Edinburgh'
      )
venue1.save()

venue2 = Venue.new(
  'name' => 'Gym2',
  'location' => 'Glasgow'
  )
venue2.save()

student1 = Student.new(
  'first_name' => 'Sarah',
  'last_name' => 'Connor',
  'age' => 24,
  'gender' => 'female'
  )
student1.save()

student2 = Student.new(
  'first_name' => 'Karl',
  'last_name' => 'sBerg',
  'age' => 21,
  'gender' => 'male'
  )
student2.save()



class1 = GymClass.new(
  'type' => 'body_attack',
  'time' => '18:00',
  'venue_id' => venue1.id
  )
class1.save()

class2 = GymClass.new(
  'type' => 'body_pump',
  'time' => '19:00',
  'venue_id' => venue2.id
  )
class2.save()


register1 = Register.new(
  'class_id' =>  class1.id ,
  'student_id' => student1.id
  )
register1.save()

register2 = Register.new(
  'class_id' =>  class2.id ,
  'student_id' => student2.id
  )
register2.save()

client1 = Client.new(
  'name' => 'Barbra Streisand',
  'balance' => 800,
  )
client1.save()

client2 = Client.new(
  'name' => 'Sylvester Stalone',
  'balance' => 43,
  )
client2.save

bank1 = Bank.new(
  'balance' => 200,
  'type'=> 'current',
  'holder' => 'Myself'
  )
bank1.save

payment1 = Payment.new(
  'bank_id' => bank1.id,
  'client_id' => client1.id,
  'amount' => 200
  )
payment1.save

payment2 = Payment.new(
  'bank_id' => bank1.id,
  'client_id' => client2.id,
  'amount' => 12
  )
payment2.save



binding.pry
nil
