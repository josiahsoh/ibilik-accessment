# create new propertyform
get '/properties/new' do 
	 erb :"property/new"
end

post '/properties' do
	property = Property.create(description: params[:description], user_id: params[:user_id])
	redirect "/properties/#{property.id}"
end


get '/properties/:id' do 
  @property = Property.find(params[:id])
  @user = @property.user 
  erb :"property/dashboard"  
end

# #view all properties
# get 'properties/:id' do
# 	erb :"property/dashboard"
# end
# view question
