require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )
require_relative( '../models/bank.rb' )
require_relative( '../models/client.rb' )
require_relative( '../models/payment.rb' )

# INDEX - READ for ALL
get '/register' do
  @register =Register.all()
  @classes = GymClass.all()
  @students = Student.all()
 erb (:'register/index')
end

# NEW -  CREATE - get form
get '/register/new' do
  @students = Student.all
  @gymclass = GymClass.new(params)
  erb(:"register/new")
end

# SHOW - READ for ID
get '/register/:id' do 
  @gymclass = GymClass.find( params[:id] )
  @students = Student.all()
  erb (:"register/show")
end 

# CREATE - CREATE - submit form
post '/register' do
  @register = Register.new(params)
  @register.save()
  redirect to '/classes'
end



# EDIT- UPDATE - Create form
get '/register/:id/edit' do
  @register = Register.find( params[:id] )
  erb(:"register/update")
end

# UPDATE - UPDATE - submit form
post '/register/:id' do
  @register = Register.new(params)
  @register.update()
  erb(:"register/update")
  redirect to "/register/#{@register.id}"
end

# DESTROY - DELETE
post '/register/:id/delete' do
  @register = Register.find_by_student(params[:id])
  @register.delete
  redirect to "/classes"
end

