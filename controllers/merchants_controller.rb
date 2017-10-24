require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')


get '/merchants' do
  erb( :"merchants/index_merchants")
end

get '/merchants/all' do
  @merchants = Merchant.all()
  erb(:"merchants/all_merchants")
end

get '/merchants/new' do
  erb(:"merchants/new_merchant")
end

post '/merchants/all' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:"merchants/new_merchant_report")
end
