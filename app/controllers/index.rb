get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :index
end


get '/users/:id' do
  @user = User.find(params[:id])
  @questions = @user.questions
  @answers = @user.answers
  erb :'/users/home'

post '/questions' do
  # handle new questions from homepage
end
