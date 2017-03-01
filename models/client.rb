class Client

  attr_reader :id, :name, :balance

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @balance = options['balance'].to_i 
  end

  def self.find( id )
    sql = "SELECT * FROM clients WHERE id= #{id};"
    client = SqlRunner.run( sql )
    result = Client.new( client.first )
    return result
  end

  def billing(amount)
    @balance = @balance - amount.to_i
    # sql= "UPDATE clients SET (balance) = (balance - #{amount}) WHERE id = #{id};"
    # SqlRunner.run(sql) 
  end

  def payment(amount)
    @balance = @balance - amount.to_i
    # sql= "UPDATE clients SET (balance) = (balance + #{amount}) WHERE id = #{id};"
    # SqlRunner.run(sql) 
  end

  def save
    sql ="INSERT INTO clients (name, balance) VALUES 
    ('#{ @name }', #{ @balance }) RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE clients SET (name, balance) =
    ('#{ @name }', #{ @balance })
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def delete
    sql = "DELETE FROM clients where id = #{id};"
    SqlRunner.run( sql )
  end

  def self.all_actors
    sql1 = "SELECT * From students"
    students = SqlRunner.run(sql1)
    clients = students.map{|student| "#{student['first_name']} #{student['last_name']}"}
    sql2 = "SELECT venues.name FROM venues"
    venues = SqlRunner.run(sql2)
    clients.concat venues.map {|venue| venue["name"] }
    return clients
  end

  def self.all
    sql = "SELECT * FROM clients;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM clients;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    clients = SqlRunner.run(sql)
    result = clients.map{|client| Client.new(client)}
    return result   
  end

  def bank
    sql= "SELECT bank.* FROM bank 
    INNER JOIN payments ON payments.client_id = client.id
    WHERE payments.bank_id = #{@id};"
    result = Client.get_many(sql)
    return result
  end

end