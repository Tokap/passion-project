get '/' do
  if logged_in?
    @applications = Application.where(user_id: current_user.id)
    @applications = @applications.sort {|previous, current| current.date_applied <=> previous.date_applied} #newest on top
    # @applications = @applications.sort_by {|application| application.date_applied} #oldest on top
  	erb :'index'
  else
    erb :'index'
  end
end
