require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )


get '/students' do
	@students = Student.all
	erb (:"students/index")
end

get '/students/new' do
	@students = Student.all
	erb(:"students/new")
end

post '/students' do 
	student = Student.new(params)
	student.save
	redirect to ("/students")
end

post '/students/:id/delete' do 
	student = Student.new(params)
	student.save
	redirect to ("/students")
end

post 'students/:id/update' do 
	student = Student.new(params)
	student.update
	redirect to ("/students")
end
