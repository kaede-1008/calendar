require "sinatra"
require "sinatra/reloader"

get '/' do
    erb :index
end

get '/sasaki' do
    "sasaki is good"
end

get '/login' do
    if logged_in?
        flash[:message] = "You are already logged in."
        redirect '/'
    else
        erb :'session/login'
    end
end

post '/login' do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:oassword])
        sessiin[:user_id] = @user.id
        redirect '/'
    else
        flash[:message] = "invalid username or/and password. Please try again."
        redirect '/login'
    end
end

post '/logout' do
    session.clear
    redirect '/'
end
