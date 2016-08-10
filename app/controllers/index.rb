get '/' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  @answers = @question.answers

  erb :question
end

post '/questions/:question_id/answers' do
  # raise params.inspect
  if !current_user
    redirect '/login'
  end
  q_id = params[:question_id]
  Answer.create(content: params[:answer], user_id: session[:user_id], question_id: q_id )

  redirect "/questions/#{q_id}"
end

get "/questions/:id>/votes/up" do

end

get "/questions/:id>/votes/down" do

end
