helpers do
    def csrf_token_generate
        str = SecureRandom.base64(64)
        @csrf_token = BCrypt::Password.create(str)
        session[:scrt_token] = @csrf_token
    end
end