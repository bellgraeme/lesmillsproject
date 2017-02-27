require_relative('../db/sql_runner.rb')
require 'pg'
require 'pry'

class Register

  attr_reader :id, :class_id, :student_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i
    @student_id = options['student_id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM register WHERE id=#{id};"
    register = SqlRunner.run( sql )
    result = Register.new( register.first )
    return result
  end

  def save
    sql ="INSERT INTO register (class_id, student_id) VALUES (#{ @class_id }, #{ @student_id }) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE register SET(class_id, student_id) = (#{@class_id}, #{@student_id})
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def self.find_by_student(id)
    sql = "SELECT  * FROM register where student_id = #{id}"
    register = SqlRunner.run( sql )
    result = Register.new( register.first )
    return result
  end

  def delete
    sql = "DELETE FROM register where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM register;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM register;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    register = SqlRunner.run(sql)
    result = register.map{ |x| Venue.new(x) }
    return result   
  end
end