require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class.rb' )
require_relative( '../models/register.rb' )
require_relative( '../models/student.rb' )
require_relative( '../models/venue.rb' )

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



