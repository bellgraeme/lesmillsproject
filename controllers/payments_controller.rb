require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bank.rb' )
require_relative( '../models/client.rb' )
require_relative( '../models/payment.rb' )


# INDEX - READ for ALL
get '/payments' do
 @payments = Payment.all()
  erb (:'payments/index')
end

# NEW -  CREATE - get form
get '/payments/new' do
  @payments = Payment.all()
  erb(:"payments/new")
end

# SHOW - READ for ID
get '/payments/:id' do 
  @payment = Payment.find( params[:id] )
  erb (:"payments/show")
 end 

# CREATE - CREATE - submit form
 post '/payments' do
    @payment = Payment.new(params)
    @payment.save()
    erb(:"payments/create")
end

# EDIT- UPDATE - Create form
get '/payments/:id/edit' do
 @payment = Payment.find( params[:id] )
 erb(:"payments/update")
end

# UPDATE - UPDATE - submit form
post '/payments/:id' do
  @payment = Payment.new(params)
  @payment.update() 
  erb(:"payments/update")
  redirect to "/payments"
end

# DESTROY - DELETE
post '/payments/:id/delete' do
 @payment = Payment.find(params[:id]) 
 @payment.delete
redirect to "/payments"
end

