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
