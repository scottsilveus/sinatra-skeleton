# GETS=====================================

get '/' do 

	erb :index
end

get '/logout' do 
	session.clear

	redirect '/'
end

# POSTS====================================

post '/login' do 
	user = User.authenticate(name: params[:name], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/' #CHANGE TO SOMETHING LIKE DASHBOARD
  else
    @errors = "Username or Password is incorrect"
    redirect '/'
  end
end

post '/create' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])

	redirect '/'
end

post '/update' do 
	# put user_id in route USE HASH IN UPDATE
	current_user.update

	redirect '/' #CHANGE TO SOMETHING LIKE EDIT PAGE
end

delete '/delete' do 
	User.destroy(current_user.id)
	session.clear
# put :user_id in route
	redirect '/'
end