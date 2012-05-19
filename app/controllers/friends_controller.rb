class FriendsController < ApplicationController
	def index
		@graph = Koala::Facebook::API.new(@oauth_token)
		query="SELECT name, birthday_date, pic_big FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me()) 
                                                          AND strlen(birthday_date) != 0 
                                                          AND (substr(birthday_date, 0, 2) = '05' 
                                                          AND substr(birthday_date, 3, 5) >= '19')  
                                                          ORDER BY birthday_date"
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
		
		puts salvou
		puts m
		puts m.message
		puts params
	
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
	end
	
end