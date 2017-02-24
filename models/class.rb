class Class

  attr_reader :id, :type, :time, :venue_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @time = options['time']
    @venue_id = options['venue_id'].to_i
  end

  def save
    sql ="INSERT INTO classes (
    type, time, venue_id
    ) VALUES (
    '#{ @type }', '#{ @time }', #{ @venue_id }
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE classes SET
    name = '#{@name}',
    time = '#{@time}'
    venue_id = '#{@venue_id}'
    WHERE id = '#{@id}';"
    SqlRunner.run(sql) 
  end
  
  def self.delete(id)
    sql = "DELETE FROM classes where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM classes;"
    self.get_many(sql)
  end

  def delete_all
    sql = "DELETE FROM classes;" 
    SqlRunner.run(sql) 
  end

  def self.get_many(sql)
    classes = SqlRunner.run(sql)
    result = classes.map{ |x| Class.new(x) }
    return result   
  end


end