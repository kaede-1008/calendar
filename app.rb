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

    if user&.authenticate(param[:password])
        session[:user_id] = user.id
        redirect '/create_article'
    else
        slim :login
    end
end

end

get '/signup' do

end

get '/create_article' do
    login_required

    csrtf_token_generate

    @categories = Category.all
    slim :create_article
end

post '/atricle_post' do
    login_required

    redirect '/create_article' unless params[:csrf_token] == session[:csrf_token]

    file = params[:file]
    thumbnail_name = file ? file[:filename] : params[:thumbnail]

    @post = Post.new(
        category_id: params[:category_id],
        title: params[:content],
        
    )

end