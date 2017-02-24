class Class

  attr_reader :id, :type, :time, :venue_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @time = options['time']
    @venue_id = options['venue_id'].to_i
  end

end