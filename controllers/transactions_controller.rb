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

post '/transactions/all' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/new_transaction_report")
end
