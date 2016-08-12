require 'pry'
post '/questions/:question_id/answer/:answer_id/comment/new' do
  answer = Answer.find(params[:answer_id])
  comment = Comment.new(content: params[:comment], commentable: answer, user_id: session[:user_id])
  if comment.save
    redirect to "/questions/#{params[:question_id]}"
  else
    nooo
  end

end


post '/questions/:question_id/comment/new' do
  question = Question.find(params[:question_id])
  @comment = Comment.new(content: params[:comment], commentable: question, user: current_user)
  if @comment.save
    if request.xhr?
      erb :'/comments/_question_comment', layout: false
    else
      redirect request.referrer
    end
  end
end
