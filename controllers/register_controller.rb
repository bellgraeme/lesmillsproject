require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )

# get '/classes' do
# 	@classes = GymClass.all
# 	erb (:"classes/index")
# end

# get '/classes/new' do
# 	@classes = GymClass.all
# 	erb(:"classes/new")
# end

# post '/classes' do 
# 	gymclass = GymClass.new(params)
# 	gymclass.save
# 	redirect to ("/classes")
# end

# post '/classes/:id/delete' do 
# 	gymclass = GymClass.new(params)
# 	gymclass.save
# 	redirect to ("/classes")
# end

# post 'classes/:id/update' do 
# 	gymclass = GymClass.new(params)
# 	gymclass.update
# 	redirect to ("/classes")
# end
