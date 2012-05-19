class FriendsController < ApplicationController
	def index
		@msg = "Ola"
	end
	
	def send_message
	  @graph = Koala::Facebook::API.new(@oauth_token)
	  @graph.put_wall_post(params[:message], {}, 100001459536743, {})
	end
	
	def write_message
	  @graph = Koala::Facebook::API.new(@oauth_token)
	end
	
end