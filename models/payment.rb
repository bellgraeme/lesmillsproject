class Payment

attr_reader :id, :client_id, :bank_id, :amount, :time

def initialize(options)
  @id = options['id'].to_i if options['id']
  @client_id = options['client_id'].to_i
  @bank_id = options['bank_id'].to_i
  @amount = options['amount'].to_i
  @time = options['time']
end

end