class Venue

attr_reader :id, :name, :location

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @location = options['location']
end

end