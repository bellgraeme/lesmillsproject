class Bank

  attr_reader :id, :balance, :type, :holder

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @balance = options['balance'].to_i
    @type = options['type']
    @holder = options['holder']  
  end

  def self.find( id )
    sql = "SELECT * FROM bank WHERE id= #{id};"
    bank = SqlRunner.run( sql )
    result = Bank.new( bank.first )
    return result
  end

  def save
    sql ="INSERT INTO bank (balance, type, holder) VALUES 
    (#{ @balance },'#{@type}','#{@holder}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end
  
  def billing(amount)
    @balance = @balance - amount.to_i
    # sql= "UPDATE bank SET (balance) = (balance - #{amount}) WHERE id = #{@id};"
    # SqlRunner.run(sql) 
  end

  def payment(amount)
    @balance = @balance + amount.to_i
    # sql= "UPDATE bank SET (balance) = (balance + #{amount}) WHERE id = #{@id};"
    # SqlRunner.run(sql) 
  end

  def update
    sql = "UPDATE bank SET (balance, type, holder) =
    (#{ @balance },'#{@type}','#{@holder}')
    WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def delete
    sql = "DELETE FROM bank where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM bank;"
    self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM bank;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    banks = SqlRunner.run(sql)
    result = banks.map{|bank| Bank.new(bank)}
    return result   
  end

  def clients
    sql= "SELECT clients.* FROM clients 
    INNER JOIN payments ON payments.bank_id = bank.id
    where payments.client_id = #{@id};"
    result = Bank.get_many(sql)
    return result
  end
end