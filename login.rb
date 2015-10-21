require 'sinatra'

get '/login' do
	erb :username
end

def valid_login
	user_pass = File.open('public/usernames_passwords.csv',"r")
	
	user_pass.each do |row|
		combo = row.split(",")
		username = combo[0]
		password = combo[1].chomp
	if username == params[:name] && password == params[:password]
		@auth = 1
		end
	end
end	

post '/login' do
	valid_login
		if @auth == 1
			erb :correct, :locals => { :name => params[:name]}
	else
			erb :incorrect	
			
	end
end
