require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/budget_controller.rb')


get '/' do
# @amount_spent = Transaction.total_spent().to_i
# @amount_left = 100
# @budget = @transaction.budget.to_i
  @budget = Budget.all().first().budget().to_f
  @transaction = Transaction.total_spent().to_f()
  @amount_left = (@budget -@transaction).to_f

  erb(:index)

end
