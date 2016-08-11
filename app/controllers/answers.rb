
get '/questions/:question_id/answers/:answer_id/favorite' do
  @user = User.find(session[:user_id])
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(params[:question_id])

  @question.answers.each do |answer|
    answer.favorite = false
    answer.save
  end

  @answer.favorite = true
  @answer.save
  redirect "questions/#{@question.id}"
end
