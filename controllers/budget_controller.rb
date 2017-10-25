require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/budget.rb')


get '/budgets/budget_edit_form' do
  @budgets = Budget.all()
  erb(:"budgets/budget_edit_form")
end

post '/budgets/budget_edit_report' do

  @budget = Budget.new(params)
  @budget.update()
  redirect "/"
end
