get '/applications' do
	@applications = Application.all
	# @applications.sort_by {|application| application.date_applied}
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