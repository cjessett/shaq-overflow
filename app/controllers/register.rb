get '/register' do
      erb :register
end

post '/register' do
      user = User.create(username: params[:username], password: params[:password])
            if user.save
                  session[:user_id] = user.id
            else
                  redirect '/register'
            end
end
