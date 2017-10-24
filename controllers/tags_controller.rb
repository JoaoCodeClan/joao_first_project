require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')


get '/tags' do
  erb( :"tags/index_tags")
end

get '/tags/all' do
  @tags = Tag.all()
  erb(:"tags/all_tags")
end

get '/tags/new' do
  erb(:"tags/new_tag")
end

post '/tag/all' do
  @tag = Tag.new(params)
  @tag.save()
  erb(:"tags/new_tag_report")
end
