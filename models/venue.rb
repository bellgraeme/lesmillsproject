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
  WHERE id = '#{@id}';"
  SqlRunner.run(sql) 
end

def self.delete(id)
  sql = "DELETE FROM venues where id = #{id}"
  SqlRunner.run( sql )
end

def self.all
  sql = "SELECT * FROM venues;"
  self.get_many(sql)
end

def delete_all
  sql = "DELETE FROM venues;" 
  SqlRunner.run(sql) 
end

def self.get_many(sql)
  venues = SqlRunner.run(sql)
  result = venues.map{ |x| Venue.new(x) }
  return result   
end




end