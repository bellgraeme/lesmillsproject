require_relative('../db/sql_runner.rb')
# require_relative('venue.rb')
# require_relative('gym_class.rb')
require 'pg'
require 'pry'

class Student

  attr_reader :id, :name, :age, :gender

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @gender = options['gender']
  end

  def save
    sql ="INSERT INTO students (
    first_name, last_name, age, gender
    ) VALUES (
    '#{ @first_name }','#{@last_name}', #{ @age }, '#{@gender}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE students SET
    first_name = '#{@first_name}',
    last_name = '#{@last_name}',
    age = #{@age}
    gender = '#{@gender}'
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def delete(id)
    sql = "DELETE FROM students where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM students;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM students;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    students = SqlRunner.run(sql)
    result = students.map{|student| Student.new(student)}
    return result   
  end

  def classes
    sql= "SELECT classes.* FROM classes 
    INNER JOIN register ON register.class_id = classes.id
    where register.class_id = #{@id};"
    result = GymClass.get_many(sql)
    return result
  end

  def venue
    sql = "SELECT venues.* FROM venues
    INNER JOIN classes ON classes.venue_id = venues.id
    INNER JOIN register on classes.id = register.class_id
    WHERE register.student_id = #{@id};"
    result = Venue.get_many(sql)
    return result
  end

end