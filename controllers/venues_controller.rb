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
get '/venues' do
 @venues = Venue.all()
  erb (:'venues/index')
end

# NEW -  CREATE - get form
get '/venues/new' do
  erb(:"venues/new")
end

# SHOW - READ for ID
  get '/venues/:id' do 
  @venue = Venue.find( params[:id] )
  erb (:"venues/show")
 end 

 get '/venues/:id/classes' do
  @venue = Venue.find(params[:id])
  @classes = @venue.classes
  @students = @venue.students
  erb(:"venues/classes")
 end

# CREATE - CREATE - submit form
 post '/venues' do
    @venue = Venue.new(params)
    @venue.save()
    erb(:"venues/create")
end

# EDIT- UPDATE - Create form
get '/venues/:id/edit' do
 @venue = Venue.find( params[:id] )
 erb(:"venues/update")
end

# UPDATE - UPDATE - submit form
post '/venues/:id' do
  @venue = Venue.new(params)
  @venue.update()
  erb(:"venues/update")
  redirect to "/venues/#{@venue.id}"
end

# DESTROY - DELETE
post '/venues/:id/delete' do
 @venue = Venue.find(params[:id]) 
 @venue.delete
redirect to '/venues'
end



