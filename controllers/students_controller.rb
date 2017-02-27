require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )


# INDEX - READ for ALL
get '/students' do
 @students = Student.all()
  erb (:'students/index')
end

# NEW -  CREATE - get form
get '/students/new' do
  erb(:"students/new")
end

# SHOW - READ for ID
  get '/students/:id' do 
  @student = Student.find( params[:id] )
  erb (:"students/show")
 end 

# CREATE - CREATE - submit form
 post '/students' do
    @student = Student.new(params)
    @student.save()
    erb(:"students/create")
end

# EDIT- UPDATE - Create form
get '/students/:id/edit' do
 @student = Student.find( params[:id] )
 erb(:"students/update")
end

# UPDATE - UPDATE - submit form
post '/students/:id' do
  @student = Student.new(params)
  @student.update()
  erb(:"students/update")
  redirect to "/students/#{@student.id}"
end

# DESTROY - DELETE
post '/students/:id/delete' do
 @student = Student.find(params[:id]) 
 @student.delete
redirect to '/students'
end

