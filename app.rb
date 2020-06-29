# メインの処理を記述する
# 今回はコントローラの役割

enable :sessions

helpers do
    def login_required
        redirect '/login' if session[:user_id].nil?
    end
end


get '/login' do
    slim :login
end

post '/login' do
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/create_article'
    else
        slim :login
    end
end

get '/signup' do
    if logined_in?
        redirect '/'
    else
        slim :signup
    end
end

post '/signup' do
    pass = params[:user][:password]
    ck_pass = params[:password][:confirmation]
    if pass == ck_pass
        @user = User.create({:name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password]})
    else
        redirect '/signup'
    end

    if @user.save
        session["user_id"] = @user.id
        redirect '/'
    else
        redirect '/signup'
    end
end

get '/create_article' do
    login_required

    csrf_token_generate

    @articles = Article.all
    slim :create_article
end

post '/atricle_post' do
    login_required

    redirect '/create_article' unless params[:csrf_token] == session[:csrf_token]

    file = params[:file]
    thumbnail_name = file ? file[:filename] : params[:thumbnail]

    @post = Post.new(
        article_id: params[:id],
        title: params[:content],

    )

end