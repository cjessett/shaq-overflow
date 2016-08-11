helpers do
  def current_user
    User.find_by_id session[:user_id]
  end

  def user_vote_status(question)
    if current_user
      val = current_user.votes.find_or_initialize_by(votable: question).value
      case val
      when 1
        erb :'questions/_up'
      when -1
        erb :'questions/_down'
      when 0
        erb :'questions/_basic'
      end
    else
        erb :'questions/_basic'
    end
  end
end

