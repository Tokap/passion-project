get '/applications' do
	@applications = Application.where(user_id: current_user.id)
	@applications = @applications.sort {|previous, current| previous.company <=> current.company} #newest on top
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

get '/applications/:id' do
	@application = Application.find(params[:id])
	erb :'applications/show'
end

get '/applications/:id/edit' do
	@application = Application.find(params[:id])
	erb :'applications/edit'
end

patch '/applications/:id' do
	@application = Application.find(params[:id])
	@application.update(params[:application])
	redirect "/applications/#{@application.id}"
end

delete '/applications/:id' do
	@application = Application.find(params[:id])
	@application.destroy
	redirect '/'
end
