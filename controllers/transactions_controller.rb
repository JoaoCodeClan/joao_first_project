require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')


get '/transactions' do
  erb( :"transactions/index_transactions")
end

get '/transactions/all_transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/all_transactions")
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @budgets = Budget.all()
  erb(:"transactions/new_transaction")
end

post '/transactions/new_transaction_report' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/new_transaction_report")
end

post '/transactions/:id/delete_transaction' do
@transaction = Transaction.find(params[:id])
@transaction.delete

  redirect "/transactions/all_transactions"
end

get '/transactions/:id/transaction_edit_form' do
  @transaction = Transaction.find(params[:id])
  @merchants = Merchant.all()
  @tags = Tag.all()
  @budgets = Budget.all()
erb(:"transactions/transaction_edit_form")
end

post '/transactions/:id/transaction_edit_report' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect "/transactions/all_transactions"
end

get '/transactions/spendings_by_month' do

  erb(:"/transactions/spendings_by_month")
end

post '/transactions/month_expenses_report' do
@month= params['month']
@year= params['year']
@total_month = Transaction.month_expenses(@month,@year)
erb(:"/transactions/month_expenses_report")
end
