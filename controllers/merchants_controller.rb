require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')


get '/merchants' do
  erb( :"merchants/index_merchants")
end


get '/merchants/spent_by_merchant' do
  @merchants = Merchant.all
  erb(:"merchants/spent_by_merchant")
end

get '/merchants/merchant_total' do
  @merchant = Merchant.find(params['merchant_id'])

  @amount = @merchant.spent()

  erb(:"merchants/merchant_total")

end

get '/merchants/all_merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/all_merchants")
end

get '/merchants/new_merchant' do

  erb(:"merchants/new_merchant")
end

post '/merchants/new_merchant_report' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:"merchants/new_merchant_report")
end

post '/merchants/:id/delete_merchant' do
@merchant = Merchant.find(params[:id])
@merchant.delete

  redirect "/merchants/all_merchants"
end

get '/merchants/:id/merchant_edit_form' do
  @merchant = Merchant.find(params[:id])
  @merchants = Merchant.all()
erb(:"merchants/merchant_edit_form")
end

post '/merchants/:id/merchant_edit_report' do
  @merchants = Merchant.all()
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect "/merchants/all_merchants"
end
