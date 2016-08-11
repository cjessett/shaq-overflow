helpers do
  def current_user
    User.find_by_id session[:user_id]
  end

  def user_vote_status(question)
    if current_user
      val = current_user.votes.find_or_initialize_by(votable: question).value
<<<<<<< HEAD
        case val
        when 1
          erb :'questions/_up'
        when -1
          erb :'questions/_down'
        else
          erb :'questions/_basic'
        end
=======
      case val
      when 1
        erb :'questions/_up'
      when -1
        erb :'questions/_down'
      else
        erb :'questions/_basic'
      end
>>>>>>> master
    else
        erb :'questions/_basic'
    end
  end
end

