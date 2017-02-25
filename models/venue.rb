require_relative('../db/sql_runner.rb')
require 'pg'
require 'pry'

class Venue

  attr_reader :id, :name, :location

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def self.find( id )
    sql = "SELECT * FROM venues WHERE id = #{id};"
    venue = SqlRunner.run( sql )
    result = Venue.new( venue.first )
    return result
  end

  def save
    sql ="INSERT INTO venues (
    name, location
    ) VALUES (
    '#{ @name }', '#{ @location }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE venues SET
    name = '#{@name}',
    location = '#{@location}'
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def delete
    sql = "DELETE FROM venues where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM venues;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM venues;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    venues = SqlRunner.run(sql)
    result = venues.map{ |x| Venue.new(x) }
    return result   
  end

  def classes
    sql = "SELECT classes.* FROM classes
    INNER JOIN venues ON classes.venue_id = venues.id
    WHERE classes.venue_id = #{@id}"
    result = GymClass.get_many(sql)
    return result
  end

  def students
    sql = "SELECT students.* FROM students
    INNER JOIN register ON register.student_id = students.id
    INNER JOIN classes ON classes.id = register.class_id
    INNER JOIN venues ON venues.id = classes.venue_id
    WHERE classes.venue_id = #{@id};"
    result = Student.get_many(sql)
    return result
  end


end