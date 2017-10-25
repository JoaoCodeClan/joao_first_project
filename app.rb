require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('models/budget.rb')

get '/' do
@amount_spent = Transaction.total_spent().to_i
@amount_left = 100
# @budget = Budget.budget().to_i
  erb(:index)

end
