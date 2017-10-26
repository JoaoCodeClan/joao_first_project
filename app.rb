require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/budget_controller.rb')

get '/' do
  @budget = Budget.all().first().budget().to_f
  @transaction = Transaction.total_spent().to_f()
  @amount_left = (@budget -@transaction).to_f
  erb(:index)
end
