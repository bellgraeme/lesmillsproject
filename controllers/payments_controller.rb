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
get '/payments' do
  @banks = Bank.all()
  @clients =Client.all()
  @payments = Payment.all()
  erb (:"payments/index")
end

# NEW -  CREATE - get form
get '/payments/new' do
  @banks = Bank.all()
  @clients =Client.all()
  @payments = Payment.all()
  erb(:"payments/new")
end

get '/payments/billing' do
  @banks = Bank.all()
  @clients =Client.all()
  @payments = Payment.all()
  erb(:"payments/billing")
end


post '/payments/billing' do
  @payment = Payment.new(params)
  @payment.save()
  @bank = Bank.find(params[:bank_id])
  @bank.billing(params[:amount])
  @bank.update()
  @client = Client.find(params[:client_id])
  @client.payment(params[:amount])
  @client.update()
  erb (:"payments/create")
end


# CREATE - CREATE - submit form
post '/payments' do
  @payment = Payment.new(params)
  @payment.save()
  @bank = Bank.find(params[:bank_id])
  @bank.payment(params[:amount])
  @bank.update()
  @client = Client.find(params[:client_id])
  @client.billing(params[:amount])
  @client.update()
  p @bank
  p @client
  erb(:"payments/create")
end

post '/payments/billing' do
  @payment = Payment.new(params)
  @bank = Bank.find(params[:bank_id])
  @bank.billing(params[:amount])
  @client = Client.find(params[:client_id])
  @client.payment(params[:amount])
  @bank.update
  @client.update
  @payment.save()
  erb(:"payments/billing")
end

# EDIT- UPDATE - Create form
# get '/payments/:id/edit' do
#   @banks = Bank.all()
#   @clients =Client.all()
#   @payment = Payment.find( params[:id] )
#   erb(:"payments/update")
# end

# UPDATE - UPDATE - submit form
# post '/payments/:id' do
#   @banks = Bank.all()
#   @clients =Client.all()
#   @payment = Payment.new(params)
#   @payment.update() 
#   erb(:"payments/update")
#   redirect to "/payments"
# end

# DESTROY - DELETE
post '/payments/:id/delete' do
  @banks = Bank.all()
  @clients =Client.all()
  @payment = Payment.find(params[:id]) 
  @payment.delete
  redirect to "/payments"
end

