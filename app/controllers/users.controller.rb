
enable :sessions

# User login
post '/users/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  elsif user.authenticate(params[:password]) != user.password
    redirect '/users/wrong_password'
  else
    redirect '/'
  end
end

# Wrong password enter
get '/users/wrong_password' do
  erb :"user/wrong_password"
end

# User logout
get '/users/logout' do
  session[:user_id] = nil
  erb :"user/thankyou"
end

# view new user form
get '/signup' do
  erb :"user/new"
end

# create new user
post '/users' do
	# Do something processing with user input
 	user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if user.save
   	redirect "/users/#{user.id}"
  else
    redirect "/error"
  end
end

get '/error' do
  erb :"user/error"
end

#edit user profile
get '/users/:id/edit' do
   @user = User.find(params[:id])
  erb :'user/edit'
end 

#update user profile
patch '/users/:id' do
  user = User.find(params[:id])
  user.update(name: params[:name], email: params[:email], password: params[:password])
  redirect "/users/#{user.id}" #It does not pass the variables if using @user
end

# Delete user
delete '/users/:id' do
  user = User.find(params[:id])
  user.destroy
  erb :'static/index'
end

#View user dashboard
get '/users/:id' do
  authorize
  @user = User.find(params[:id])
  owner_only(@user.id)
	erb :"user/dashboard"
end

# view login page
get '/users' do
  erb :"user/index"
end

# user authorization
def authorize
  if session['user_id']
    true
  else
    redirect '/'
  end
end

# only can view by user after login
def owner_only(user_id)
  if session['user_id'] == user_id
    true
  else
    redirect '/'
  end
end