require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')


get '/tags' do
  erb( :"tags/index_tags")
end

get '/tags/spent_by_tag' do
  @tags = Tag.all

  erb(:"tags/spent_by_tag")
end

get '/tags/tag_total' do
  @tag = Tag.find(params['tag_id'])
  @amount = @tag.spent()

  erb(:"tags/tag_total")

end

get '/tags/all_tags' do
  @tags = Tag.all()
  erb(:"tags/all_tags")
end

get '/tags/new_tag' do

  erb(:"tags/new_tag")
end

post '/tags/new_tag_report' do
  @tag = Tag.new(params)
  @tag.save()
  erb(:"tags/new_tag_report")
end

post '/tags/:id/delete_tag' do
  @tag = Tag.find(params[:id])
  @tag.delete

  redirect "/tags/all_tags"
end

get '/tags/:id/tag_edit_form' do
  @tag = Tag.find(params[:id])
  @tags = Tag.all()
  erb(:"tags/tag_edit_form")
end

post '/tags/:id/tag_edit_report' do
  @tags = Tag.all()
  @tag = Tag.new(params)
  @tag.update()
  redirect "/tags/all_tags"
end
