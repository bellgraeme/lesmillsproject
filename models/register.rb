class Register


def initialize(options)
  @id = options['id'].to_i if options['id']
  @venue_id = options['venue_id'].to_i
  @student_id = options['stdent_id'].to_i
end

end