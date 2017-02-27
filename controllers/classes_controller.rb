require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )

# INDEX - READ for ALL
get '/classes' do
 @gymclasses = GymClass.all()
 @venues = Venue.all()
  erb (:'classes/index')
end

# NEW -  CREATE - get form
get '/classes/new' do
  @venues = Venue.all()
  erb(:"classes/new")
end

# SHOW - READ for ID
  get '/classes/:id' do 
  @gymclass = GymClass.find( params[:id] )
  @venues = Venue.all()
  erb (:"classes/show")
 end 

# CREATE - CREATE - submit form
 post '/classes' do
    @venues = Venue.all()
    @gymclass = GymClass.new(params)
    @gymclass.save()
    erb(:"classes/create")
end

# EDIT- UPDATE - Create form
get '/classes/:id/edit' do
 @gymclass = GymClass.find( params[:id] )
 @venues = Venue.all
 erb(:"classes/update")
end

# UPDATE - UPDATE - submit form
post '/classes/:id' do
  @venues = Venue.all
  @gymclass = GymClass.new(params)
  @gymclass.update() 
  erb(:"classes/update")
  redirect to "/classes"
end

# DESTROY - DELETE
post '/classes/:id/delete' do
 @gymclass = GymClass.find(params[:id]) 
 @gymclass.delete
redirect to '/classes'
end

