require_relative('../models/class.rb')
require_relative('../models/register.rb')
require_relative('../models/student.rb')
require_relative('../models/venue.rb')
require 'pg'
require 'pry'


Class.delete_all
Register.delete_all
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
  'name' => 'Sarah',
  'age' => 24,
  'gender' => 'female'
  )
student1.save()

student2 = Student.new(
  'name' => 'Karl',
  'age' => 21,
  'gender' => 'male'
  )
student2.save()



class1 = Class.new(
  'type' => 'body_attack',
  'time' => '18:00',
  'venue_id' => venue1.id
  )
class1.save()

class2 = Class.new(
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
