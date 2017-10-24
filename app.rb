require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')

get '/' do
@amount_spent = Transaction.total_spent()
  erb(:index)

end
