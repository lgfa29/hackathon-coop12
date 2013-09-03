class FriendsController < ApplicationController
	def index
		@graph = Koala::Facebook::API.new(@oauth_token)
		
		start_date = Date.today
		end_date = start_date+4.weeks

		query="
				SELECT name, birthday_date, pic_big 
				FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me()) 
				AND strlen(birthday_date) != 0 
				AND ((substr(birthday_date, 0, 2) = '%s' AND substr(birthday_date, 3, 5) >= '%s')
				OR (substr(birthday_date, 0, 2) = '%s' AND substr(birthday_date, 3, 5) < '%s'))
				ORDER BY birthday_date" % [start_date.month, start_date.day, end_date.month, end_date.day]
				
		@aniversarios = @graph.fql_query(query) 
	end
	
	def send_message
		m = Message.create
				
		m.message = params[:message_text]
		m.facebook_id = params[:destination]
		m.token = @oauth_token
		m.hour_send = params[:hour]
		m.min_send = params[:min]
		m.month_bday = params[:month_bday]
		m.day_bday = params[:day_bday]
		
		salvou = m.save
	
#	  @graph = Koala::Facebook::API.new(@oauth_token)
#	  @graph.put_wall_post(params[:message], {}, params[:destination], {})

		flash[:success] = "Message scheduled"
		redirect_to root_url
	end
	
	def write_message
	  @uid = params['uid']
	  @bday =  params['bday'].split('/')
	  @graph = Koala::Facebook::API.new(@oauth_token)
	  @facts = Fact.where(:month => @bday[0], :day => @bday[1] )
	  
    @profile = @graph.get_object("me")
    @user_id = @profile["id"]
    @canned = Cannedmessage.where(:facebook_id => @user_id)
	end
	
end