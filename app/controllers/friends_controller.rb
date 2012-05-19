class FriendsController < ApplicationController
	def index
		@msg = "Ola"
	end
	
	def send_message
	  @graph = Koala::Facebook::API.new(@oauth_token)
	  @graph.put_wall_post(params[:message], {}, params[:destination], {})
	end
	
	def write_message
	  @graph = Koala::Facebook::API.new(@oauth_token)
	  @facts = Fact.where('date.mon' => Date.today.month )
	end
	
end