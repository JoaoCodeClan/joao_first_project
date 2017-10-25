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
  # erb(:"transactions/delete_transaction")
  redirect "/transactions/all_transactions"
end
