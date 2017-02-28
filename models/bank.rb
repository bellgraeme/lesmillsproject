class Bank

attr_reader :id, :balance, :type, :holder

def initialize(options)
  @id = options['id'].to_i if options['id']
  @balance = options['balance'].to_i
  @type = options['type']
  @holder = options['holder']  
end

end