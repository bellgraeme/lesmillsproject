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
get '/accounts' do
  @banks = Bank.all()
  @clients =Client.all()
  @payments = Payment.all()
  erb (:"accounts/index")
end

# NEW -  CREATE - get form
get '/accounts/new' do
  @clients = Client.all_actors()
  erb(:"accounts/new")
end

# SHOW - READ for ID
get '/accounts/:id' do
  @banks = Bank.all()
  @clients =Client.all() 
  @payment = Payment.find( params[:id] )
  erb (:"accounts/show")
end 

# CREATE - CREATE - submit form
post '/accounts' do
  @client = Client.new(params)
  @client.save()
  redirect to '/accounts'
end

# EDIT- UPDATE - Create form
get '/payments/:id/edit' do
  @banks = Bank.all()
  @clients =Client.all()
  @payment = Payment.find( params[:id] )
  @payment.update
  erb(:"payments/update")
end

# UPDATE - UPDATE - submit form
post '/payments/:id' do
  @banks = Bank.all()
  @clients =Client.all()
  @payment = Payment.new(params)
  @payment.update() 
  redirect to "/payments"
end

# DESTROY - DELETE
post '/payments/:id/delete' do
  @banks = Bank.all()
  @clients =Client.all()
  @payment = Payment.find(params[:id]) 
  @payment.delete
  redirect to "/payments"
end

