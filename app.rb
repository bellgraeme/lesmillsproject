require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/classes_controller')
require_relative('controllers/students_controller')
require_relative('controllers/venues_controller')
require_relative('controllers/register_controller')
require_relative('controllers/payments_controller')
require_relative('controllers/accounts_controller')

get '/' do
  erb( :index )
end





