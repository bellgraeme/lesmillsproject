class Payment

attr_reader :id, :client_id, :bank_id, :amount, :time

def initialize(options)
  @id = options['id'].to_i if options['id']
  @client_id = options['client_id'].to_i
  @bank_id = options['bank_id'].to_i
  @amount = options['amount'].to_i
  @time = options['time']
end

def self.find( id )
  sql = "SELECT * FROM payments WHERE id= #{id};"
  student = SqlRunner.run( sql )
  result = Student.new( student.first )
  return result
end

def save
  sql ="INSERT INTO payments (client_id, bank_id, amount, time) VALUES 
  (#{ @client_id },#{@bank_id}, #{ @amount }, NOW()) RETURNING *"
  results = SqlRunner.run(sql)
  @id = results[0]['id'].to_i
end

def payment(amount)
  sql1 = 
  
end

def update
  sql = "UPDATE payments SET (client_id, bank_id, amount, time) =
   (#{ @client_id },#{@bank_id}, #{ @amount }, NOW())
  WHERE id = #{@id};"
  SqlRunner.run(sql) 
end

def delete
  sql = "DELETE FROM payments where id = #{id}"
  SqlRunner.run( sql )
end

def self.all
  sql = "SELECT * FROM payments;"
  self.get_many(sql)
end

def self.delete_all
  sql = "DELETE FROM payments;" 
  SqlRunner.run(sql) 
end

def self.get_many(sql)
  payments = SqlRunner.run(sql)
  result = payments.map{|student| Student.new(student)}
  return result   
end

end