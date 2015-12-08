# View new property form
get '/properties/new' do 
	 erb :"property/new"
end

# Create new properties
post '/properties' do
	property = Property.create(description: params[:description], user_id: params[:user_id])
	redirect "/properties/#{property.id}"
end


get '/properties/:id' do 
  @property = Property.find(params[:id])
  @user = @property.user
  erb :"property/dashboard"  
end

# update existing user
patch '/properties/:id' do
	property = Property.find(params[:id])
	property.update(description: params[:description])
	@user = property.user
 	redirect "/properties/#{property.id}"
end

# delete specific property
delete '/properties/:id' do
	property = Property.find(params[:id])
	property.destroy
	#@user = property.user
	# erb :"user/dashboard"
	redirect "/users/#{session[:user_id]}"
end

#edit
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :"property/edit"
end
