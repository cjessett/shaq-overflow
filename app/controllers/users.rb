get '/users/:id' do
  if current_user.nil?
    redirect '/login'
  else
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers
    erb :'/users/home'
  end
end
