module ApplicationHelper
  def to_minutes(seconds)
    (seconds/60).to_i
  end

  def user_count
    Visit.online.has_user.count
  end

  def stranger_count
    Visit.online.stranger.count
  end

end
