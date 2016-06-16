get '/applications' do
	@applications = Application.where(user_id: current_user.id)
	# @applications = @applications.sort_by {|application| application.date_applied} #oldest on top
	@applications = @applications.sort {|previous, current| current.date_applied <=> previous.date_applied} #newest on top
	erb :'applications/index'
end

get '/applications/new' do
	erb :'applications/new'
end

post '/applications' do
	@application = Application.new(params[:application])
	if @application.valid?
		@application.save
		redirect '/' #REDIRECT TO SHOW PAGE
	else
		@error = "Error: Missing information!"
		status 422
		erb :'applications/new'
	end	
end

get 'applications/:id' do
	#add everything
	"Coming Soon"
end