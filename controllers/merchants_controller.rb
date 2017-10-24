require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')


get '/merchants' do
  erb( :index_merchants)
end
