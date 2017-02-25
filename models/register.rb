require_relative('../db/sql_runner.rb')
require 'pg'
require 'pry'

class Register

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i
    @student_id = options['student_id'].to_i
  end

  def save
    sql ="INSERT INTO register (
    class_id, student_id
    ) VALUES (
    #{ @class_id }, #{ @student_id }
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE register SET
    name = '#{@name}',
    location = '#{@location}'
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def delete(id)
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