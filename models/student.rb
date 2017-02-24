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
      '#{ @name }', #{ @age }, '#{@geneder}'
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

def delete_all
  sql = "DELETE FROM students;" 
  SqlRunner.run(sql) 
end

end