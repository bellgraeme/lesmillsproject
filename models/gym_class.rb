require_relative('../db/sql_runner.rb')
# require_relative('student.rb')
# require_relative('venue.rb')
require 'pg'
require 'pry'

class GymClass

  attr_reader :id, :type, :time, :venue_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @time = options['time']
    @venue_id = options['venue_id'].to_i if options['venue_id']
  end

  def self.find( id )
    sql = "SELECT * FROM classes WHERE id=#{id};"
    gymclass = SqlRunner.run( sql )
    result = GymClass.new( gymclass.first )
    return result
  end

  def save
    sql ="INSERT INTO classes (type, time, venue_id) VALUES ('#{ @type }', '#{ @time }',#{ @venue_id }) RETURNING id;"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE classes SET (type, time, venue_id)=('#{@type}', '#{@time}', #{@venue_id}) WHERE id = #{id};"
    SqlRunner.run(sql) 
  end

  def delete
    sql = "DELETE FROM classes WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM classes;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM classes;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    classes = SqlRunner.run(sql)
    result = classes.map{ |x| GymClass.new(x) }
    return result   
  end

  def students
    sql = "SELECT students.* FROM students
    INNER JOIN register ON register.student_id = students.id
    WHERE register.student_id = #{@id};"
    result = Student.get_many(sql)
    return result 
  end

  def venue
    sql = "SELECT venues.* FROM venues
    INNER JOIN classes ON classes.venue_id = venues.id
    where classes.venue_id = #{@id};"
    return Venue.get_many(sql)
  end


end