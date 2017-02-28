class Client

  attr_reader :id, :name, :balance

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @balance = options['balance'].to_i 
  end


end