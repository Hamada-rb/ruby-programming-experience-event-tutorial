require 'sinatra'
require 'sinatra/reloader'

comments = []

get '/' do
    @comments = comments
    erb :index
end 

post '/new' do
    comments.push(params[:body])
    redirect '/'
end