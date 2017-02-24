require_relative('../db/sql_runner.rb')
require 'pg'
require 'pry'

class Student

  attr_reader :id, :name, :age, :gender

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @gender = options['gender']
  end

  def save
    sql ="INSERT INTO students (
    name, age, gender
    ) VALUES (
    '#{ @name }', #{ @age }, '#{@gender}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE students SET
    name = '#{@name}',
    age = '#{@age}'
    gender = '#{@gender}'
    WHERE id = '#{@id}';"
    SqlRunner.run(sql) 
  end

  def self.delete(id)
    sql = "DELETE FROM students where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM students;"
    self.get_many(sql)
  end

  def delete_all
    sql = "DELETE FROM students;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    students = SqlRunner.run(sql)
    result = students.map{|student| Student.new(student)}
    return result   
  end


end