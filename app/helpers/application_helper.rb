module ApplicationHelper

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def us_states
    ['AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']
  end

  def is_current_user?(player)
    current_user == player
  end

  def is_captain?(team)
    team.captain == current_user
  end
end
